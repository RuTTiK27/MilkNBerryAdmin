using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_AnimationText : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();

            try
            {
                string strSql = "SELECT * FROM ANIMATIONTEXTS";
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
                string strSql = "UPDATE ANIMATIONTEXTS SET ISACTIVE = " + 1 + " WHERE ID ='" + code + "' ";
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
                string strSql = "UPDATE ANIMATIONTEXTS SET ISACTIVE = " + 0 + " WHERE ID ='" + code + "' ";
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();

        string animationText = ((TextBox)btn.Parent.FindControl("txtAnimationText")).Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE ANIMATIONTEXTS SET ANIMATIONTEXT = '" + animationText + "',ISACTIVE = '1' WHERE ID ='" + argument + "' ";
            //string strSql = $"UPDATE PROMOCODES SET PROMOCODE = '{arguments[1]}',DISCOUNT = {arguments[2]},MINAMOUNT = {arguments[3]},ISACTIVE = 1 WHERE PROMOCODEID = {arguments[0]} ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "Animation Text with id " + argument + " is updated";
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
}