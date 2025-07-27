using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace To_dos.User
{
    public partial class SaveUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtPassword.Attributes["placeholder"] = "Al menos 1 Mayúscula, un número un caracter especial y 8 de longitud mínima";
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            string connString = System.Configuration.ConfigurationManager
                .ConnectionStrings["MiConexion"].ConnectionString;

            var userService = new UserService(connString);

            try
            {
                userService.RegisterUser(name, email, password);
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Usuario registrado con éxito.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

    }
}