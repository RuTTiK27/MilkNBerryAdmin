using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Products : System.Web.UI.Page
{
    private void showProducts(string sql) 
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
            lblMsg.Text = "showProducts():  " + ex.Message;
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
    private void showCount(string sql,string whichoShow)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            string strSql = sql;

            cmd = new SqlCommand(strSql, con);
            con.Open();

            object obj = cmd.ExecuteScalar();

            if (whichoShow == "All")
            {
                lblAllCount.Text = obj.ToString();
            }

            if (whichoShow == "Active")
            {
                lblActiveCount.Text = obj.ToString();
            }

            if (whichoShow == "Deactive")
            {
                lblDeactiveCount.Text = obj.ToString();
            }
        }

        catch (Exception ex)
        {
            lblMsg.Text = "showCount() " + ex.Message;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rbl.SelectedValue = "All";
            
            showProducts("SELECT[PRODUCTNO], [NAME], [ISACTIVE], [MAINIMAGEURL] FROM[PRODUCTS]");
            showCount("SELECT COUNT(*) FROM PRODUCTS", "All"); //All
            showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 1", "Active"); //Active
            showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 0", "Deactive"); //Deactive
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
                string strSql = "UPDATE PRODUCTS SET ISACTIVE = " + 1 + " WHERE PRODUCTNO ='" + code + "' ";
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
            showCount("SELECT COUNT(*) FROM PRODUCTS", "All"); //All
            showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 1", "Active"); //Active
            showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 0", "Deactive"); //Deactive
        }
        else
        {
            try
            {
                string strSql = "UPDATE PRODUCTS SET ISACTIVE = " + 0 + " WHERE PRODUCTNO ='" + code + "' ";
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
            showCount("SELECT COUNT(*) FROM PRODUCTS", "All"); //All
            showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 1", "Active"); //Active
            showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 0", "Deactive"); //Deactive
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string strSql = "SELECT[PRODUCTNO], [NAME], [ISACTIVE], [MAINIMAGEURL] FROM[PRODUCTS] WHERE [NAME] LIKE '%" + txtSearchProduct.Text + "%' ";
        showProducts(strSql);
        showCount("SELECT COUNT(*) FROM PRODUCTS", "All"); //All
        showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 1", "Active"); //Active
        showCount("SELECT COUNT(*) FROM PRODUCTS WHERE ISACTIVE = 0", "Deactive"); //Deactive
    }

    protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl.SelectedValue == "All")
        {
            showProducts("SELECT[PRODUCTNO], [NAME], [ISACTIVE], [MAINIMAGEURL] FROM[PRODUCTS]");
        }

        if (rbl.SelectedValue == "1")
        {
            string strSql = "SELECT[PRODUCTNO], [NAME], [ISACTIVE], [MAINIMAGEURL] FROM[PRODUCTS] WHERE [ISACTIVE] = 1 ";
            showProducts(strSql);

        }

        if (rbl.SelectedValue == "0")
        {
            string strSql = "SELECT[PRODUCTNO], [NAME], [ISACTIVE], [MAINIMAGEURL] FROM[PRODUCTS] WHERE [ISACTIVE] = 0 ";
            showProducts(strSql);
        }
    }

    protected void btnNewProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductDetail.aspx?product=NEW", true);
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();
        Response.Redirect("ProductDetail.aspx?product=" + argument, true);
    }
}