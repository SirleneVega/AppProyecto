using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Referencias
using BLL;
using DAL;

namespace AppProyecto
{
    public partial class Registrarme : System.Web.UI.Page
    {
        //usuario
        private Usuario usuario;
        //Referencia db
        private DistribuidoraPEntities entities;
        private String idEmail;
        private String funcion = "R";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Se inicia la bd
            entities = new DistribuidoraPEntities();

            if (Request.QueryString["accion"] != null)
            {
                this.funcion = Request.QueryString["accion"];
                this.idEmail = Session["identificacion"].ToString();
            }

            //se valida la fincion
            this.DisplayDiv(true);
            switch (this.funcion)
            {
                case "R":
                    try
                    {
                        if (HttpContext.Current.User.Identity.IsAuthenticated)
                        {
                            Response.Redirect("Default.aspx");
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    this.btnRegistro.Text = "Registrar";
                    break;
                case "M":
                    this.datosEntrada(true);
                    this.DisplayDiv(false);
                    this.btnRegistro.Text = "Guardar cambios";
                    break;
                case "E":
                    this.datosEntrada(false);
                    this.DisplayDiv(false);
                    this.btnRegistro.Text = "Confirmar Eliminacion";
                    break;
            }
            if (!IsPostBack)
            {
                this.consulta(this.idEmail);
            }
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            this.usuario = new Usuario();
            this.usuario.cedula = this.txtCedula.Text.Trim();
            this.usuario.telefono = int.Parse(this.txtTelefono.Text.Trim());
            this.usuario.tipoCedula = this.txtTipoCedula.Text.Trim();
            this.usuario.nombreCompleto = this.txtNombre.Text.Trim();
            this.usuario.email = this.txtEmail.Text.Trim();
            this.usuario.direccion = this.txtDireccion.Text.Trim();
            this.usuario.Contrasena = this.txtPassword.Text.Trim();

            switch (this.funcion)
            {
                case "R":
                    this.agregarUsuario(this.usuario);
                    //this.mensaje("Proveedor agregado correctamente");
                    break;
                case "M":
                    this.modificarUsuario(this.usuario);
                    //this.mensaje("Proveedor modificado correctamente");
                    break;
                case "E":
                    this.eliminarUsuario(this.usuario);
                    //this.mensaje("Proveedor eliminado correctamente");
                    break;

            }

            Response.Redirect("CatalogoUsuarios.aspx");
        }

        public void agregarUsuario(Usuario usua)
        {
            try
            {
                Usuarios usuarios = new Usuarios();
                usuarios.cedula = usua.cedula;
                usuarios.telefono = usua.telefono;
                usuarios.tipoCedula = usua.tipoCedula;
                usuarios.nombreCompleto = usua.nombreCompleto;
                usuarios.email = usua.email;
                usuarios.direccion = usua.direccion;
                usuarios.password = usua.Contrasena;

                this.entities.Usuarios.Add(usuarios);
                this.entities.SaveChanges();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        private void datosEntrada(bool estado)
        {
            this.txtEmail.Enabled = false;
            this.txtCedula.Enabled = estado;
            this.txtTelefono.Enabled = estado;
            this.txtTipoCedula.Enabled = estado;
            this.txtNombre.Enabled = estado;
            this.txtDireccion.Enabled = estado;
            this.txtPassword.Enabled = estado;
        }

        public void modificarUsuario(Usuario usua)
        {
            try
            {

                Usuarios tblUsuarios = this.entities.Usuarios.FirstOrDefault(m => (m.email.Equals(idEmail)));
                if (tblUsuarios != null)
                {
                    tblUsuarios.cedula = usua.cedula;
                    tblUsuarios.telefono = usua.telefono;
                    tblUsuarios.tipoCedula = usua.tipoCedula;
                    tblUsuarios.nombreCompleto = usua.nombreCompleto;
                    tblUsuarios.email = usua.email;
                    tblUsuarios.direccion = usua.direccion;
                    if (usua.Contrasena != "")
                    {
                        tblUsuarios.password = usua.Contrasena;
                    }
                    this.entities.SaveChanges();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void eliminarUsuario(Usuario usua)
        {
            try
            {
                Usuarios tblUsuarios = this.entities.Usuarios.FirstOrDefault(m => (m.email.Equals(idEmail)));
                if (tblUsuarios != null)
                {
                    this.entities.Usuarios.Remove(tblUsuarios);
                    this.entities.SaveChanges();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        private void consulta(string codigo)
        {
            try
            {
                Usuarios tblUsuarios = this.entities.Usuarios.FirstOrDefault(m => (m.email.Equals(idEmail)));
                if (tblUsuarios != null)
                {
                    this.txtEmail.Text = tblUsuarios.email;
                    this.txtCedula.Text = tblUsuarios.cedula;
                    this.txtTelefono.Text = tblUsuarios.telefono.ToString();
                    this.txtTipoCedula.SelectedValue = tblUsuarios.tipoCedula;
                    this.txtNombre.Text = tblUsuarios.nombreCompleto;
                    this.txtDireccion.Text = tblUsuarios.direccion;
                    this.txtPassword.Text = tblUsuarios.password;
                }

            }
            catch (Exception)
            {

                throw;
            }
        }

        private void DisplayDiv(bool isShow)
        {
            idVerificador.Visible = isShow;
        }
    }
}