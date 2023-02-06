using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string loginQuery = "SELECT EMAIL,PASSWORD FROM ADMINSIGNIN WHERE EMAIL = '" + floatingInput.Text + "';";
            cmd = new SqlCommand(loginQuery, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                if (dr["EMAIL"].ToString() == floatingInput.Text && dr["PASSWORD"].ToString() == floatingPassword.Text)
                {
                    Session["AdminEmail"] = dr["EMAIL"].ToString();
                    Response.Redirect("Dashboard.aspx", true);
                    
                }
                else
                {
                    lblMsg.Text = "Incorrect credentials";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "loginCustomer() : " + ex;
        }
        finally
        {
            dr.Close();
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}