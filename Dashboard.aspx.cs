using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            visitedPeoples();
            totalAddedTocartPeople();
            registeredUsers();
            numberOfProducts();
            activePromocodes();
            activeCashbackCodes();
            completedOrders();
            pendingOrders();
        }
    }

    private void visitedPeoples()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql = "SELECT COUNT(DISTINCT IP) FROM VISITEDPEOPLES";

        con.Open();
        cmd = new SqlCommand(strSql, con);
        object obj = cmd.ExecuteScalar();
        lblVisitedPeople.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void totalAddedTocartPeople()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(DISTINCT customeremail) FROM Cart";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblAddedToCart.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void registeredUsers()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(*) FROM CUSTOMERS";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblRegisteredUseres.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void numberOfProducts()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(*) FROM products";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblTotalProducts.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void activePromocodes()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(*) FROM promocodes where isactive='1'";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblActivePromocode.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void activeCashbackCodes()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(*) FROM CASHBACK where isactive='1'";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblActiveCashbackCodes.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void completedOrders()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(*) FROM ordermaster where orderstatus='4'";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblCompletedOrders.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    private void pendingOrders()
    {
        SqlCommand cmd = new SqlCommand();
        string strSql2 = "SELECT COUNT(*) FROM ordermaster where orderstatus='1'";

        con.Open();
        cmd = new SqlCommand(strSql2, con);
        object obj = cmd.ExecuteScalar();
        lblPendingOrders.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }

    protected void btnAtcPeople_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
    }
}