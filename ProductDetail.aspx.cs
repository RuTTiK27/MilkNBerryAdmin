using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class Admin_productDetail : System.Web.UI.Page
{
    private void loadProductDetails(string productNumber)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT [PRODUCTNO],[HSNORSAC],[NAME],[TITLE],[DESCRITION], PRODUCTS.[CATEGORYID],[MAINIMAGEURL],[IMAGEURL2],[IMAGEURL3],[WITHOUTGSTPRICE],CATEGORIES.[GSTPERCENTAGE] AS GSTPERCENTAGE, [PRICE],[CGST],[SGST],[IGST],[RATE],[ISACTIVE],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE],[DISCOUNTINRUPEES] FROM[PRODUCTS] INNER JOIN CATEGORIES ON PRODUCTS.CATEGORYID = CATEGORIES.CATEGORYID WHERE PRODUCTNO = '" + productNumber + "'";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                txtProductNo.Text = dr["PRODUCTNO"].ToString();
                txtHsnSac.Text = dr["HSNORSAC"].ToString();
                txtProductName.Text = dr["NAME"].ToString();
                txtTitle.Text = dr["TITLE"].ToString();
                txtDescription.Text = dr["DESCRITION"].ToString();

                ImageButton1.ImageUrl = "~/" + dr["MAINIMAGEURL"].ToString();
                ImageButton2.ImageUrl = "~/" + dr["IMAGEURL2"].ToString();
                ImageButton3.ImageUrl = "~/" + dr["IMAGEURL3"].ToString();

                Session["image1"] = dr["MAINIMAGEURL"].ToString();
                Session["image2"] = dr["IMAGEURL2"].ToString();
                Session["image3"] = dr["IMAGEURL3"].ToString();

                ddlCategories.Items.FindByValue(dr["CATEGORYID"].ToString()).Selected = true;

                txtWithoutGstPrice.Text = dr["WITHOUTGSTPRICE"].ToString();
                txtGstPercentage.Text = dr["GSTPERCENTAGE"].ToString();

                txtPrice.Text = dr["PRICE"].ToString();

                txtCgst.Text = dr["CGST"].ToString();
                txtSgst.Text = dr["SGST"].ToString();
                txtIgst.Text = dr["IGST"].ToString();
                txtDiscount.Text = dr["DISCOUNTPERCENTAGE"].ToString();
                txtFinalPrice.Text = dr["AFTERDISCOUNTPRICE"].ToString();
                txtDiscountInRupees.Text = dr["DISCOUNTINRUPEES"].ToString();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "loadProductDetails() : " + ex;
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
    }
    private void fillDropdownlist()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();

        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        SqlCommand cmd3 = new SqlCommand();

        DataSet ds = new DataSet();

        try
        {
            string strSql = "SELECT CATEGORYID,CATEGORYNAME FROM CATEGORIES ORDER BY CATEGORYID";
            cmd = new SqlCommand(strSql, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            ddlCategories.DataSource = ds;

            ddlCategories.DataValueField = "CATEGORYID";
            ddlCategories.DataTextField = "CATEGORYNAME";
            ddlCategories.DataBind();
        }
        catch (Exception ex)
        {

            lblMsg.Text = "fillDropdownlist() " + ex.Message;
        }
        finally
        {
            da.Dispose();
            ds.Dispose();
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
            fillDropdownlist();
            if (Request.QueryString["product"].ToString() == "NEW")
            {
                Session["image1"] = "";
                Session["image2"] = "";
                Session["image3"] = "";
                btn.Text = "Post";
                //lblMsg.Text = "New Product";
            }
            else
            {
                loadProductDetails(Request.QueryString["product"].ToString());
                txtProductNo.Enabled = false;
                btn.Text = "Update";
                //lblMsg.Text = "Product Number : "+ Request.QueryString["product"].ToString();
            }
        }
    }
    protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT GSTPERCENTAGE FROM [CATEGORIES] WHERE CATEGORYID = '" + ddlCategories.SelectedValue.ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                txtGstPercentage.Text = dr["GSTPERCENTAGE"].ToString();
            }
        }

        catch (Exception ex)
        {
            lblMsg.Text = "ddlCategories_SelectedIndexChanged() : " + ex;
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
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        double discount = 0;

        discount = ((Convert.ToDouble(txtPrice.Text) * Convert.ToDouble(txtDiscount.Text)) / 100);
        txtDiscountInRupees.Text = discount.ToString();
        txtFinalPrice.Text = (Convert.ToDouble(txtPrice.Text) - discount).ToString();


        //GST Calculation
        txtWithoutGstPrice.Text = (Convert.ToDouble(txtFinalPrice.Text) / 1.18).ToString();

        double totalGst = 0;
        totalGst = Convert.ToDouble(txtFinalPrice.Text) - Convert.ToDouble(txtWithoutGstPrice.Text);

        txtCgst.Text = (totalGst / 2).ToString();
        txtSgst.Text = (totalGst / 2).ToString();

        txtIgst.Text = totalGst.ToString();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(@"D:\MilkAndBarries\images\" + FileUpload1.FileName);
            ImageButton1.ImageUrl = "~/images/" + FileUpload1.FileName;
            Session["image1"] = "images/" + FileUpload1.FileName;
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUpload2.HasFile)
        {
            FileUpload2.SaveAs(@"D:\MilkAndBarries\images\" + FileUpload2.FileName);
            ImageButton2.ImageUrl = "~/images/" + FileUpload2.FileName;
            Session["image2"] = "images/" + FileUpload2.FileName;
        }
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUpload3.HasFile)
        {
            FileUpload3.SaveAs(@"D:\MilkAndBarries\images\" + FileUpload3.FileName);
            ImageButton3.ImageUrl = "~/images/" + FileUpload3.FileName;
            Session["image3"] = "images/" + FileUpload3.FileName;
        }
    }


    protected void btn_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["product"].ToString() == "NEW")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERTPRODUCT", con);
            try
            {

                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("PRODUCTNO", txtProductNo.Text);
                cmd.Parameters.AddWithValue("HSNORSAC", txtHsnSac.Text);
                cmd.Parameters.AddWithValue("NAME", txtProductName.Text);
                cmd.Parameters.AddWithValue("TITLE", txtTitle.Text);
                cmd.Parameters.AddWithValue("DESCRITION", txtDescription.Text);
                cmd.Parameters.AddWithValue("CATEGORYID", ddlCategories.SelectedValue.ToString());

                cmd.Parameters.AddWithValue("MAINIMAGEURL", Session["image1"].ToString());
                cmd.Parameters.AddWithValue("IMAGEURL2", Session["image2"].ToString());
                cmd.Parameters.AddWithValue("IMAGEURL3", Session["image3"].ToString());

                cmd.Parameters.AddWithValue("WITHOUTGSTPRICE", Math.Round(Convert.ToDouble(txtWithoutGstPrice.Text)));
                cmd.Parameters.AddWithValue("PRICE", Math.Round(Convert.ToDouble(txtPrice.Text)));
                cmd.Parameters.AddWithValue("CGST", Math.Round(Convert.ToDouble(txtCgst.Text)));
                cmd.Parameters.AddWithValue("SGST", Math.Round(Convert.ToDouble(txtSgst.Text)));
                cmd.Parameters.AddWithValue("IGST", Math.Round(Convert.ToDouble(txtIgst.Text)));
                cmd.Parameters.AddWithValue("RATE", "5");
                cmd.Parameters.AddWithValue("ISACTIVE", "1");

                cmd.Parameters.AddWithValue("DISCOUNTPERCENTAGE", txtDiscount.Text);
                cmd.Parameters.AddWithValue("AFTERDISCOUNTPRICE", txtFinalPrice.Text);
                cmd.Parameters.AddWithValue("DISCOUNTINRUPEES", txtDiscountInRupees.Text);
                cmd.ExecuteNonQuery();
                lblMsg.Text = "Product added";

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
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = null;

            try
            {
                string strSql = "UPDATE PRODUCTS SET PRODUCTNO = '" + txtProductNo.Text + "',HSNORSAC = '" + txtHsnSac.Text + "',NAME = '" + txtProductName.Text.Replace("'", "''") + "',TITLE = '" + txtTitle.Text.Replace("'", "''") + "',DESCRITION = '" + txtDescription.Text.Replace("'", "''") + "',CATEGORYID = '" + ddlCategories.SelectedItem.Value.ToString() + "',MAINIMAGEURL = '" + Session["image1"].ToString().Replace("'", "''") + "',IMAGEURL2 = '" + Session["image2"].ToString().Replace("'", "''") + "',IMAGEURL3 = '" + Session["image3"].ToString().Replace("'", "''") + "',WITHOUTGSTPRICE = '" + Math.Round(Convert.ToDouble(txtWithoutGstPrice.Text)) + "',PRICE = '" + txtPrice.Text + "',CGST = '" + Math.Round(Convert.ToDouble(txtCgst.Text)) + "',SGST = '" + Math.Round(Convert.ToDouble(txtSgst.Text)) + "',IGST = '" + Math.Round(Convert.ToDouble(txtIgst.Text)) + "',RATE = 5, ISACTIVE = 1,DISCOUNTPERCENTAGE='" + txtDiscount.Text + "',AFTERDISCOUNTPRICE='" + txtFinalPrice.Text + "',DISCOUNTINRUPEES='" + txtDiscountInRupees.Text + "' WHERE PRODUCTNO = '" + Request.QueryString["product"].ToString() + "'";
                cmd = new SqlCommand(strSql, con);
                con.Open();
                cmd.ExecuteReader();
                lblMsg.Text = "Product Updated";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "updateProduct() " + ex.Message;
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
}