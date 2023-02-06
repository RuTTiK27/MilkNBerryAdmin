using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Activities;

public partial class Admin_Messages : System.Web.UI.Page
{
    private void showMessages(string sql)
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
            lblMsg.Text = "showMessages():  " + ex.Message;
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

            showMessages("SELECT * FROM [MESSAGES]");
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


    protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl.SelectedValue == "All")
        {
            showMessages("SELECT * FROM [MESSAGES]");
        }

        if (rbl.SelectedValue == "1")
        {
            string strSql = "SELECT * FROM [MESSAGES] WHERE [ISACTIVE] = 1 ";
            showMessages(strSql);

        }

        if (rbl.SelectedValue == "0")
        {
            string strSql = "SELECT * FROM [MESSAGES] WHERE [ISACTIVE] = 0 ";
            showMessages(strSql);
        }
    }

    protected void btnRespond_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string[] arguments = btn.CommandArgument.ToString().Split(',');

        lblId.Text = arguments[0];
        lblMessages.Text = arguments[1];
        txtResponse.Text = arguments[2];
        lblEmail.Text = arguments[3];
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
        
    }

    protected void btnAnswer_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE MESSAGES SET ISACTIVE = " + 1 + ",RESPONSE = '" + txtResponse.Text + "' WHERE ID ='" + lblId.Text + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "Responded for ID : " + lblId.Text;
            sentMail(lblEmail.Text, lblMessages.Text, txtResponse.Text);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnAnswer_Click() " + ex.Message;
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
    private void sentMail(string email, string question, string answer)
    {
        try
        {
            MailMessage msgs = new MailMessage();
            msgs.To.Add(email.Trim());//registerEmail.Text.Trim()
            MailAddress address = new MailAddress("info@milknberries.com");
            msgs.From = address;
            msgs.Subject = "Regarding Contact Us";
            string htmlBody = @"<div style='font - family: Helvetica,Arial,sans - serif; min - width:1000px; overflow: auto; line - height:2'>
  <div style='margin:50px auto;width:70%;padding:20px 0'>
    <div style='border-bottom:1px solid #eee'>
      <a href='milknberries.com' style='font-size:1.4em;color: #000;text-decoration:none;font-weight:600'> Milk And Berries </a>
    </div>
    <p style ='font-size:1.1em'> Hi, Thanks for contact us</p>
    <p> Your question : " + question + "</p> <p>Answer : " + answer + "</p><p style = 'font-size:0.9em;'> Regards,<br/> Milkn And Berries </p> <hr style='border:none;border-top:1px solid #eee'/> <div style= 'float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300'> </div></div></div> ";
            msgs.Body = htmlBody;
            msgs.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";//smtpout.secureserver.net
            client.Port = 25;
            //smtpout.secureserver.net
            //client.Port = 465;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("info@milknberries.com", "computer1@");
            //Send the msgs  
            client.Send(msgs);
            //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Verify your account via email');", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "sentMail() : " + ex;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "DELETE FROM MESSAGES WHERE ID ='" + argument + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "Message Deleted WIth ID=" + argument;
            Response.Redirect("Messages.aspx", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnDelete_Click() " + ex.Message;
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

    protected void deleteAllMessages_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "DELETE FROM MESSAGES";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            lblMsg.Text = "All Messages Are Deleted ";
            Response.Redirect("Messages.aspx", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "btnDelete_Click() " + ex.Message;
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