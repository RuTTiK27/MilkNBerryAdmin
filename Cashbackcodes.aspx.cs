using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Cashbackcodes : System.Web.UI.Page
{
    private void showCashbackcodes(string sql)
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
            lblMsg.Text = "showCashbackcodes():  " + ex.Message;
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
            showCashbackcodes("SELECT * FROM [CASHBACK]");
        }
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lbl;
        CheckBox chk;

        lbl = (Label)e.Item.FindControl("lblIsActive");
        chk = (CheckBox)e.Item.FindControl("isActive");

        if (lbl.Text == "1")
        {
            chk.Checked = true;
        }
        else
        {
            chk.Checked = false;
        }
    }

    protected void isActive_CheckedChanged(object sender, EventArgs e)
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
                string strSql = "UPDATE CASHBACK SET ISACTIVE = " + 1 + " WHERE CASHBACKID ='" + code + "' ";
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
                string strSql = "UPDATE CASHBACK SET ISACTIVE = " + 0 + " WHERE CASHBACKID ='" + code + "' ";
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
            showCashbackcodes("SELECT * FROM [CASHBACK]");
        }

        if (rbl.SelectedValue == "1")
        {
            string strSql = "SELECT * FROM [CASHBACK] WHERE [ISACTIVE] = 1 ";
            showCashbackcodes(strSql);

        }

        if (rbl.SelectedValue == "0")
        {
            string strSql = "SELECT * FROM [CASHBACK] WHERE [ISACTIVE] = 0 ";
            showCashbackcodes(strSql);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();

        string cashbackcodeName = ((TextBox)btn.Parent.FindControl("txtCashbackcodeName")).Text;
        string cashbackcodeAmount = ((TextBox)btn.Parent.FindControl("txtCashbackcodeAmount")).Text;
        string cashbackcodeMinumumAmount = ((TextBox)btn.Parent.FindControl("txtCashbackcodeMinimumamount")).Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE CASHBACK SET CASHBACKCODE = '" + cashbackcodeName + "',CASHBACKAMOUNT ='" + cashbackcodeAmount + "',MINAMOUNT = '" + cashbackcodeMinumumAmount + "',ISACTIVE = '1' WHERE CASHBACKID ='" + argument + "' ";
            //string strSql = $"UPDATE PROMOCODES SET PROMOCODE = '{arguments[1]}',DISCOUNT = {arguments[2]},MINAMOUNT = {arguments[3]},ISACTIVE = 1 WHERE PROMOCODEID = {arguments[0]} ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "Cashbackcode with id " + argument + " is updated";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnUpdate_Click " + ex.Message;
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERTCASHBACK", con);

        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CASHBACKCODE", txtName.Text);
            cmd.Parameters.AddWithValue("CASHBACKAMOUNT", txtAmount.Text);
            cmd.Parameters.AddWithValue("MINAMOUNT", txtMinimumAmount.Text);
            cmd.Parameters.AddWithValue("ISACTIVE", "1");
            cmd.ExecuteNonQuery();
            showCashbackcodes("SELECT * FROM [CASHBACK]");
            lblMsg.Text = "Cashbackcode added";
            txtName.Text = "";
            txtAmount.Text = "";
            txtMinimumAmount.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnAdd_Click : " + ex;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}