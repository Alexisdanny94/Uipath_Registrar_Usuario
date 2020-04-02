using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Uipath_Registro_Usuario.Controller
{
    public class Base
    {
        public string Guardar_Usuario(string cedula, string nombre, string apellido, string estado_civil)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Sp_Registrar_Usuario";
            cmd.Connection = con;
            SqlParameter par1 = cmd.Parameters.Add("@Cedula", SqlDbType.VarChar, 10);
            par1.Direction = ParameterDirection.Input;
            SqlParameter par2 = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            par2.Direction = ParameterDirection.Input;
            SqlParameter par3 = cmd.Parameters.Add("@Apellido", SqlDbType.VarChar, 50);
            par3.Direction = ParameterDirection.Input;
            SqlParameter par4 = cmd.Parameters.Add("@Estado_Civil", SqlDbType.VarChar, 25);
            par4.Direction = ParameterDirection.Input;
            SqlParameter par5 = cmd.Parameters.Add("@Mensaje", SqlDbType.VarChar, 10);
            par5.Direction = ParameterDirection.Output;
            par1.Value = cedula;
            par2.Value = nombre;
            par3.Value = apellido;
            par4.Value = estado_civil;
            cmd.ExecuteNonQuery();
            con.Close();
            return par5.Value.ToString();
        }
    }
}