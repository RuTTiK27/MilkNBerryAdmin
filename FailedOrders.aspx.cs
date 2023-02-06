using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_FailedOrders : System.Web.UI.Page
{
    private void showOrders(string sql)
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
            lblMsg.Text = "showOrders():  " + ex.Message;
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
    private void updateOrderStatus(string status, string orderid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE ORDERMASTER SET ORDERSTATUS = " + status + " WHERE ORDERID ='" + orderid + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "updateOrderStatus() " + ex.Message;
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
            showOrders("SELECT [ORDERID], CONVERT(VARCHAR(11), [ORDERDATE], 106) AS ORDERDATE, CONVERT(VARCHAR(11), [DELIVERYDATE], 106) AS DELIVERYDATE, [ORDERSTATUS], ORDERMASTER.[CUSTOMEREMAIL], [ISSEEN], [FIRSTNAME],[LASTNAME] FROM[ORDERMASTER] INNER JOIN CUSTOMERS ON ORDERMASTER.CUSTOMEREMAIL = CUSTOMERS.EMAIL WHERE [ORDERSTATUS] = '0' ORDER BY ORDERMASTER.[ID] DESC ");
        }
    }


    protected void btnPush_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument;
        updateOrderStatus("1", argument);
        Response.Redirect("~/Admin/Orders.aspx", true);
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument;
        //lblMsg.Text = argument;

        Response.Redirect("~/Admin/orderDetail.aspx?orderId=" + argument, true);
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lbl1, lbl2, lbl3, lbl4;
        lbl1 = (Label)e.Item.FindControl("lblIsSeen");
        lbl2 = (Label)e.Item.FindControl("lblOrderStatus");
        lbl3 = (Label)e.Item.FindControl("colorIsseen");
        lbl4 = (Label)e.Item.FindControl("colorIsNotSeen");
        if (lbl1.Text == "1")
        {
            lbl3.Attributes.Add("class", "active");
            lbl4.Attributes.Add("class", "active d-none");
        }

        if (lbl1.Text == "0")
        {
            lbl3.Attributes.Add("class", "unactive d-none");
            lbl4.Attributes.Add("class", "unactive");
        }
    }
}