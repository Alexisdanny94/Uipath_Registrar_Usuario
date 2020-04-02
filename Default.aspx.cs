using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uipath_Registro_Usuario
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            string respuesta = string.Empty;
            Controller.Base con = new Controller.Base();
            respuesta = con.Guardar_Usuario(txtCedula.Text, txtNombre.Text, txtApellido.Text, txtEstado.Text);

            sql_Usuario.DataBind();
            gv_Registro.DataBind();
        }
    }
}