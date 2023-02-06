using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_OrderDetail : System.Web.UI.Page
{
    private void updateSeenStatus()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE ORDERMASTER SET ISSEEN = " + 1 + " WHERE ORDERID ='" + lblOrderId.Text + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "updateSeenStatus() " + ex.Message;
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
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            string strSql = "SELECT ORDERMASTER.ORDERID,CONVERT(VARCHAR(11), [ORDERDATE], 106) AS ORDERDATE,CONVERT(VARCHAR(11), [DELIVERYDATE], 106) AS DELIVERYDATE,ORDERSTATUS,TOTALGST,DELIVERYCHARGE,WALLETDISCOUNT+PROMOCODEDISCOUNT AS TOTALDISCOUNT,GRANDTOTAL,FIRSTNAME,LASTNAME,EMAIL,ADDRESS,PHONE FROM ORDERMASTER INNER JOIN ORDERADDRESS ON ORDERMASTER.ORDERID = ORDERADDRESS.ORDERID INNER JOIN CUSTOMERS ON ORDERMASTER.CUSTOMEREMAIL = CUSTOMERS.EMAIL WHERE ORDERMASTER.ORDERID  = '" + Request.QueryString["orderId"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);

            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                lblOrderId.Text = dr["ORDERID"].ToString();
                lblOrderDate.Text = dr["ORDERDATE"].ToString();
                lblDeliveryDate.Text = dr["DELIVERYDATE"].ToString();
                string orderStatus = dr["ORDERSTATUS"].ToString();
                lblTotalGst.Text = dr["TOTALGST"].ToString();
                lblDeliveryCharge.Text = dr["DELIVERYCHARGE"].ToString();
                lblTotalDiscount.Text = dr["TOTALDISCOUNT"].ToString();
                lblGrandTotal.Text = dr["GRANDTOTAL"].ToString();
                lblFullName.Text = dr["FIRSTNAME"].ToString() + " " + dr["LASTNAME"].ToString();
                //lblTotalGst.Text = dr["PRICE"].ToString(); 
                lblAddress.Text = dr["ADDRESS"].ToString();
                lblMobileNumber.Text = dr["PHONE"].ToString();

                lblGrandTotalAgain.Text = dr["GRANDTOTAL"].ToString();
                lblFullNameAgain.Text = dr["FIRSTNAME"].ToString() + " " + dr["LASTNAME"].ToString();
                lblAddressAgain.Text = dr["ADDRESS"].ToString();
                lblMobileNumberAgain.Text = dr["PHONE"].ToString();

                if (Convert.ToInt32(orderStatus) == 1)
                {
                    lblOrderStatus.Text = "Processed";
                }
                if (Convert.ToInt32(orderStatus) == 2)
                {
                    lblOrderStatus.Text = "Shipped";
                }
                if (Convert.ToInt32(orderStatus) == 3)
                {
                    lblOrderStatus.Text = "En Route";
                }
                if (Convert.ToInt32(orderStatus) == 4)
                {
                    lblOrderStatus.Text = "Arrived";
                }

            }
            else
            {
                lblMsg.Text = "Cannot able to load details";
            }
            con.Close();

            string strSql2 = "SELECT ORDERPRODUCTS.PRODUCTNO,NAME,TITLE,QTY,WITHOUTGSTPRICE*QTY AS ITEMTOTAL FROM PRODUCTS INNER JOIN ORDERPRODUCTS ON PRODUCTS.PRODUCTNO = ORDERPRODUCTS.PRODUCTNO WHERE ORDERID = '" + Request.QueryString["orderId"].ToString() + "' ";
            cmd = new SqlCommand(strSql2, con);
            con.Open();
            da.SelectCommand = cmd;
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "When loading  : " + ex;
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
        updateSeenStatus();
    }

    protected void btnGetInvoice_Click1(object sender, EventArgs e)
    {
        
        Response.Redirect("../invoice.aspx?orderId=" + Request.QueryString["orderId"].ToString(), true);
    }
}