using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_customers : System.Web.UI.Page
{
    private void showCustomers(string sql) 
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            string strSql = sql;
            cmd = new SqlCommand(strSql, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "showCustomers():  " + ex.Message;
        }
        finally
        {
            cmd.Dispose();
            da.Dispose();
            ds.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rbl.SelectedValue = "All";
            showCustomers("SELECT CUSTOMERS.EMAIL,FIRSTNAME,LASTNAME,PERMANENTBAN,BALANCE FROM CUSTOMERS INNER JOIN LOGIN ON LOGIN.EMAIL = CUSTOMERS.EMAIL");
        }
        
    }

    protected void isPermanentBan_CheckedChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        CheckBox chk = (CheckBox)sender;
        ListViewItem item = (ListViewItem)chk.NamingContainer;
        ListViewDataItem dataItem = (ListViewDataItem)item;
        string code = ListView1.DataKeys[dataItem.DisplayIndex].Value.ToString();
        if (((CheckBox)sender).Checked == true)
        {
            try
            {
                string strSql = "UPDATE LOGIN SET PERMANENTBAN = '" + 'Y' + "' WHERE EMAIL ='" + code + "' ";
                cmd = new SqlCommand(strSql, con);
                con.Open();
                cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "updateIsActive1() " + ex.Message;
            }
            finally
            {
                cmd.Dispose();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        else
        {
            try
            {
                string strSql = "UPDATE LOGIN SET PERMANENTBAN = '" + 'N' + "' WHERE EMAIL ='" + code + "' ";
                cmd = new SqlCommand(strSql, con);
                con.Open();
                cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "updateIsActive0() " + ex.Message;
            }
            finally
            {
                cmd.Dispose();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
    protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl.SelectedValue == "All")
        {
            showCustomers("SELECT CUSTOMERS.EMAIL,FIRSTNAME,LASTNAME,PERMANENTBAN,BALANCE FROM CUSTOMERS INNER JOIN LOGIN ON LOGIN.EMAIL = CUSTOMERS.EMAIL");
        }

        if (rbl.SelectedValue == "1")
        {
            string strSql = "SELECT CUSTOMERS.EMAIL,FIRSTNAME,LASTNAME,PERMANENTBAN,BALANCE FROM CUSTOMERS INNER JOIN LOGIN ON LOGIN.EMAIL = CUSTOMERS.EMAIL WHERE PERMANENTBAN = 'N' ";
            showCustomers(strSql);

        }

        if (rbl.SelectedValue == "0")
        {
            string strSql = "SELECT CUSTOMERS.EMAIL,FIRSTNAME,LASTNAME,PERMANENTBAN,BALANCE FROM CUSTOMERS INNER JOIN LOGIN ON LOGIN.EMAIL = CUSTOMERS.EMAIL WHERE PERMANENTBAN = 'Y' ";
            showCustomers(strSql);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string strSql = "SELECT CUSTOMERS.EMAIL,FIRSTNAME,LASTNAME,PERMANENTBAN,BALANCE FROM CUSTOMERS INNER JOIN LOGIN ON LOGIN.EMAIL = CUSTOMERS.EMAIL WHERE FIRSTNAME LIKE '%" + txtSearchCustomer.Text + "%' ";
        showCustomers(strSql);
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lbl;
        CheckBox chk;

        lbl = (Label)e.Item.FindControl("lblIsPermanentBan");
        chk = (CheckBox)e.Item.FindControl("isPermanentBan");

        if (lbl.Text == "Y")
        {
            chk.Checked = true;
        }
        else
        {
            chk.Checked = false;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        SqlCommand cmd1 = null;
        SqlCommand cmd2 = null;

        try
        {
            string strSql = "delete from CART where CUSTOMEREMAIL = '" + argument + "'";
            string strSql1 = "delete from LOGIN where EMAIL = '" + argument + "'";
            string strSql2 = "delete from CUSTOMERS where EMAIL = '" + argument + "'";
            //string strSql = $"UPDATE PROMOCODES SET PROMOCODE = '{arguments[1]}',DISCOUNT = {arguments[2]},MINAMOUNT = {arguments[3]},ISACTIVE = 1 WHERE PROMOCODEID = {arguments[0]} ";
            cmd = new SqlCommand(strSql, con);
            cmd1 = new SqlCommand(strSql1, con);
            cmd2 = new SqlCommand(strSql2, con);

            con.Open();
            cmd.ExecuteReader();
            con.Close();

            con.Open();
            cmd1.ExecuteReader();
            con.Close();

            con.Open();
            cmd2.ExecuteReader();
            con.Close();
            lblMsg.Text = "Customer with email " + argument + " is deleted ";
            Response.Redirect("Customers.aspx", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnDelete_Click " + ex.Message;
        }
        finally
        {
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}