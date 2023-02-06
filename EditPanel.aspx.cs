using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class Admin_EditPanel : System.Web.UI.Page
{
    private void showMasterPanels()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            string strSql = "select * from PANEL where id like '"+Request.QueryString["panelId"].ToString()+ "%'";
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        Button btn = (Button)sender;

        string panelId = ((Label)btn.Parent.FindControl("lblPanelId")).Text;
        string panelTitle = ((TextBox)btn.Parent.FindControl("txtTitle")).Text;
        string panelSubTitle = ((TextBox)btn.Parent.FindControl("txtSubTitle")).Text;
        string panelButtonText = ((TextBox)btn.Parent.FindControl("txtButtonText")).Text;
        string panelButtonLink = ((TextBox)btn.Parent.FindControl("txtButtonLink")).Text;
        string panelImageUrl = ((Image)btn.Parent.FindControl("img")).ImageUrl.ToString();

        panelImageUrl = panelImageUrl.Remove(0, 1);
        panelImageUrl = panelImageUrl.Remove(0, 1);

        try
        {
            string strSql = "UPDATE PANEL SET TITLE = '"+panelTitle.Replace("'", "''")+"',SUBTITLE = '"+panelSubTitle.Replace("'", "''")+"',BUTTONTEXT = '"+panelButtonText.Replace("'", "''")+"',BUTTONLINK = '"+panelButtonLink.Replace("'", "''")+"',IMAGELINK = '"+panelImageUrl.Replace("'", "''")+"' WHERE ID = '"+panelId+"'";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "Panel with id : " + panelId + " is updated.";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnUpdate_Click : " + ex.Message;
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
        Image img;

        img = (Image)e.Item.FindControl("img");
        string imgUrl = "~/" + img.AlternateText;
        img.ImageUrl = imgUrl;
        img.Width = 150;
        img.Attributes.Add("class", "text-center");

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)(sender as Control).NamingContainer;
        FileUpload fu = (FileUpload)item.FindControl("FileUpload1");
        Image img = (Image)item.FindControl("img");

        if (fu.HasFile)
        {
            //G:\PleskVhosts\milknberries.com\httpdocs\
            //fu.SaveAs(@"..\images\" + fu.FileName);

            string filename = fu.PostedFile.FileName;
            int lastSlash = filename.LastIndexOf("\\");
            string trailingPath = filename.Substring(lastSlash + 1);
            string fullPath = Server.MapPath("../images/") + "\\" + trailingPath;
            fu.PostedFile.SaveAs(fullPath);
            img.ImageUrl = "../images/" + fu.FileName;

            
        }
        
    }
}

