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

        protected void Page_Load(object sender, EventArgs e)
        {
            //Se inicia la bd
            entities = new DistribuidoraPEntities();
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
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            this.usuario = new Usuario();
            this.usuario.cedula = this.txtCedula.Text.Trim();
            this.usuario.telefono = int.Parse(this.txtCedula.Text.Trim());
            this.usuario.tipoCedula = this.txtTipoCedula.Text.Trim();
            this.usuario.nombreCompleto = this.txtNombre.Text.Trim();
            this.usuario.email = this.txtEmail.Text.Trim();
            this.usuario.direccion = this.txtDireccion.Text.Trim();
            this.usuario.Contrasena = this.txtPassword.Text.Trim();

            this.agregarUsuario(this.usuario);

            Response.Redirect("Default.aspx");
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
    }
}