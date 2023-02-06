using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Customisation : System.Web.UI.Page
{
    private void showMasterPanels()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            string strSql = "SELECT * FROM [PANELMASTER]";
            cmd = new SqlCommand(strSql, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "showMasterPanels():  " + ex.Message;
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
            showMasterPanels();
        }
    }

    protected void btnRespond_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();
        Response.Redirect("EditPanel.aspx?panelId="+argument, true);
        //lblMsg.Text = argument;
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
                string strSql = "UPDATE PANELMASTER SET ISACTIVE = " + 1 + " WHERE ID ='" + code + "' ";
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
                string strSql = "UPDATE PANELMASTER SET ISACTIVE = " + 0 + " WHERE ID ='" + code + "' ";
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

    protected void btnUpdateTitle_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();

        ListViewItem item = (sender as Button).NamingContainer as ListViewItem;
        string title = (item.FindControl("txtMainTitle") as TextBox).Text;

        try
        {
            string strSql = "UPDATE PANELMASTER SET MAINTITLE = '" + title + "' WHERE ID ='" + argument + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnUpdateTitle_Click() " + ex.Message;
        }
        finally
        {
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        lblMsg.Text = "Title Updated ✔";
        lblMsg.ForeColor = System.Drawing.Color.Green;
    }
}