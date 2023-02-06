using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    private void messageCount()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        //SqlDataReader dr = null;

        try
        {
            string strSql = "SELECT COUNT(*) FROM MESSAGES WHERE ISACTIVE = 0";
            con.Open();
            cmd = new SqlCommand(strSql, con);
            object obj = cmd.ExecuteScalar();
            lblTotalMsgCount.Text = obj.ToString();

            if (Convert.ToInt32(obj) == 0)
            {
                msg.Attributes.Add("class", "");
                lblTotalMsgCount.Text = "";
            }

            if (Convert.ToInt32(obj) != 0)
            {
                msg.Attributes.Add("class", "badge bg-danger");
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = "getstar() " + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd.Dispose();
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminEmail"] != null)
        {
            if (Session["AdminEmail"].ToString() != "")
            {
                messageCount();
            }
        }
        else
        {
            Response.Redirect("Signin.aspx", true);
        }
    }
    protected void lbSignout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Signin.aspx", true);
    }
    protected void lbChangePassword_Click(object sender, EventArgs e)
    {

    }
}
