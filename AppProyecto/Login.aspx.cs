using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Referencias
using DAL;
using System.Web.Security;

namespace AppProyecto
{
    public partial class Login : System.Web.UI.Page
    {
        //Bases de datos
        private DistribuidoraPEntities entities;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Se inicializa la db
            this.entities = new DistribuidoraPEntities();
        }

        

        //Evento del boton Iniciar Sesión
        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.validarPerfil(this.txtEmail.Text.Trim(), this.txtContrasena.Text.Trim()))
                {
                    FormsAuthentication.SetAuthCookie(this.txtEmail.Text.Trim(), false);
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script lenguage='JavaScript'>alert('Usuario o password uncorrecto') </script>");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //metodo que validad si el perfil existe
        private bool validarPerfil(string email, string pw)
        {
            try
            {
                bool autorizado = false;
                Usuarios usuarios = this.entities.Usuarios.FirstOrDefault(u =>
                (u.email.Equals(email) & u.password.Equals(pw)));
                if (usuarios != null)
                {
                    autorizado = true;
                }

                //Sesion

                return autorizado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}