using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Promocodes : System.Web.UI.Page
{
    private void showPromocodes(string sql)
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
            lblMsg.Text = "showPromocodes():  " + ex.Message;
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
            showPromocodes("SELECT * FROM [PROMOCODES]");
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
                string strSql = "UPDATE PROMOCODES SET ISACTIVE = " + 1 + " WHERE PROMOCODEID ='" + code + "' ";
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
                string strSql = "UPDATE PROMOCODES SET ISACTIVE = " + 0 + " WHERE PROMOCODEID ='" + code + "' ";
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
            showPromocodes("SELECT * FROM [PROMOCODES]");
        }

        if (rbl.SelectedValue == "1")
        {
            string strSql = "SELECT * FROM [PROMOCODES] WHERE [ISACTIVE] = 1 ";
            showPromocodes(strSql);

        }

        if (rbl.SelectedValue == "0")
        {
            string strSql = "SELECT * FROM [PROMOCODES] WHERE [ISACTIVE] = 0 ";
            showPromocodes(strSql);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();

        string promocodeName = ((TextBox)btn.Parent.FindControl("txtPromocodeName")).Text;
        string promocodeDiscount = ((TextBox)btn.Parent.FindControl("txtPromocodeDiscount")).Text;
        string promocodeMinumumAmount = ((TextBox)btn.Parent.FindControl("txtPromocodeMinimumamount")).Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE PROMOCODES SET PROMOCODE = '" + promocodeName + "',DISCOUNT ='" + promocodeDiscount + "',MINAMOUNT = '" + promocodeMinumumAmount + "',ISACTIVE = '1' WHERE PROMOCODEID ='" + argument + "' ";
            //string strSql = $"UPDATE PROMOCODES SET PROMOCODE = '{arguments[1]}',DISCOUNT = {arguments[2]},MINAMOUNT = {arguments[3]},ISACTIVE = 1 WHERE PROMOCODEID = {arguments[0]} ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "Promocode with id " + argument + " is updated";
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
        SqlCommand cmd = new SqlCommand("INSERTPROMOCODE", con);

        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("PROMOCODE", txtName.Text);
            cmd.Parameters.AddWithValue("DISCOUNT", txtDiscount.Text);
            cmd.Parameters.AddWithValue("MINAMOUNT", txtMinimumAmount.Text);
            cmd.Parameters.AddWithValue("ISACTIVE", "1");
            cmd.ExecuteNonQuery();
            showPromocodes("SELECT * FROM [PROMOCODES]");
            lblMsg.Text = "Promocode added";
            txtName.Text = "";
            txtDiscount.Text = "";
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