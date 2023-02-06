using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Deliverycharges : System.Web.UI.Page
{
    private void showDeliverycharges(string sql)
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
            lblMsg.Text = "showDeliverycharges():  " + ex.Message;
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
            showDeliverycharges("SELECT * FROM [DELIVERYCHARGE]");
        }
    }

    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager dp = (DataPager)ListView1.FindControl("DataPager1");
        dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        showDeliverycharges("SELECT * FROM [DELIVERYCHARGE]");
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
                string strSql = "UPDATE DELIVERYCHARGE SET ISACTIVE = " + 1 + " WHERE ID ='" + code + "' ";
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
                string strSql = "UPDATE DELIVERYCHARGE SET ISACTIVE = " + 0 + " WHERE ID ='" + code + "' ";
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
            showDeliverycharges("SELECT * FROM [DELIVERYCHARGE]");
        }

        if (rbl.SelectedValue == "1")
        {
            string strSql = "SELECT * FROM [DELIVERYCHARGE] WHERE [ISACTIVE] = 1 ";
            showDeliverycharges(strSql);

        }

        if (rbl.SelectedValue == "0")
        {
            string strSql = "SELECT * FROM [DELIVERYCHARGE] WHERE [ISACTIVE] = 0 ";
            showDeliverycharges(strSql);
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();

        string state = ((TextBox)btn.Parent.FindControl("txtStateName")).Text;
        string charge = ((TextBox)btn.Parent.FindControl("txtCharge")).Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE DELIVERYCHARGE SET STATE = '" + state + "',CHARGE ='" + charge + "',ISACTIVE = '1' WHERE ID ='" + argument + "' ";
            //string strSql = $"UPDATE PROMOCODES SET PROMOCODE = '{arguments[1]}',DISCOUNT = {arguments[2]},MINAMOUNT = {arguments[3]},ISACTIVE = 1 WHERE PROMOCODEID = {arguments[0]} ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "state with id " + argument + " is updated";
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
        SqlCommand cmd = new SqlCommand("INSERTDELIVERYCHARGE", con);

        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("STATE", txtName.Text);
            cmd.Parameters.AddWithValue("CHARGE", txtCharge.Text);
            cmd.Parameters.AddWithValue("ISACTIVE", "1");
            cmd.ExecuteNonQuery();
            showDeliverycharges("SELECT * FROM [DELIVERYCHARGE]");
            lblMsg.Text = "Deliverycharge added";
            txtName.Text = "";
            txtCharge.Text = "";
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


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string strSql = "SELECT * FROM [DELIVERYCHARGE] WHERE [STATE] LIKE '%" + txtSearchState.Text + "%' ";
        showDeliverycharges(strSql);
    }

    
}