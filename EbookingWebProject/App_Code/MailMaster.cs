using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;

/// <summary>
/// Summary description for MailMaster
/// </summary>
public class MailMaster
{
    SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
    DataSet ds = new DataSet();
	public MailMaster()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void getOwnerInfo()
    {
        try
        {
            
            int loginid = Convert.ToInt32(HttpContext.Current.Session["userid"].ToString());
            SqlCommand cmd = new SqlCommand("select * from admin where id='" + loginid + "'", sqlcon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
        
        }
        catch { }
    
    }
    #region Mail for event  owner
    public void SendMailToEventOwner(string ClientName,string ClientEmailId, string sdate, string Edate, string EventInfo)
    {

        try
        {
            getOwnerInfo();
            string id=ds.Tables[0].Rows[0]["id"].ToString();
            string fname = ds.Tables[0].Rows[0]["fname"].ToString();
            string lname = ds.Tables[0].Rows[0]["lname"].ToString();
            string email = ds.Tables[0].Rows[0]["email"].ToString();
            //string email = "sshekhar@deaninfotech.com";
            string phone = ds.Tables[0].Rows[0]["phone"].ToString();
            string userrole = ds.Tables[0].Rows[0]["userrole"].ToString();
            if (!string.IsNullOrEmpty(email))
            {
                MailMessage objMessage = new MailMessage();
                MailAddress fromAddress = new MailAddress("deaninfotest@gmail.com", "Booking Soft");
                objMessage.From = fromAddress;
                objMessage.Subject = "New Event Booking Information:";
                objMessage.To.Add(email);
                objMessage.IsBodyHtml = true;
                objMessage.Body = RegistrationMailFormatForEventOwner(fname + " " + lname, userrole, ClientName, ClientEmailId, sdate, Edate, EventInfo);
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);
                smtpClient.Credentials = new System.Net.NetworkCredential("deaninfotest@gmail.com", "deanpassword");
                smtpClient.EnableSsl = true;
                smtpClient.Send(objMessage);
            } 
        }
        catch
        {
            // Response.Write(ex);


        }

    }
    public static string RegistrationMailFormatForEventOwner(string name, string userRole, string Cname, string sdate, string edate,string eventname, string url)
    {
        StringBuilder sbLetter = new StringBuilder();
        sbLetter.Append("<html><body><div style='font-size: 13px;line-height:19px; padding-left:30px; margin-left:20px; font-family: Arial, Verdana'>");

        sbLetter.Append("<br /><br />");
        sbLetter.Append("Dear  ");
        sbLetter.Append(name);
        sbLetter.Append("<br /><br />");
        sbLetter.Append("Role  ");
        sbLetter.Append(userRole);
        sbLetter.Append("<br /><br /> You have Booked the  Event for Following Client:");
        //sbLetter.Append("<br />");
        //sbLetter.Append("Details are as follows : ");
        sbLetter.Append("<br /><br />");
        sbLetter.Append("Client name : ");
        sbLetter.Append(Cname);
        sbLetter.Append("<br />");
        sbLetter.Append("Event Booked For : ");
        sbLetter.Append(eventname);
        sbLetter.Append("<br />");
        sbLetter.Append("Start date : ");
        sbLetter.Append(sdate);
        sbLetter.Append("<br />");
        sbLetter.Append("End date : ");
        sbLetter.Append(edate);
        sbLetter.Append("<br />");
        sbLetter.Append("Booking For : ");
        sbLetter.Append(url);
        sbLetter.Append("<br /><br /> ");
        sbLetter.Append("");
        sbLetter.Append("<br />");
        sbLetter.Append("Regards,");
        sbLetter.Append("<br />");
        sbLetter.Append("Booking Soft Team");

        sbLetter.Append("<br /><br /><br />");

        sbLetter.Append("<p style='Font-Size:10px'>Please do not respond to this email.<br />  </p>");
        sbLetter.Append("<strong style='color:navy'></div></body></html>");
        return sbLetter.ToString();
    }
    #endregion
    #region Mail for event  Client
    public void SendMailToEventClient(string ClientName, string ClientEmailId, string sdate, string Edate, string EventInfo)
    {

        try
        {

            if (!string.IsNullOrEmpty(ClientEmailId))
            {
                MailMessage objMessage = new MailMessage();
                MailAddress fromAddress = new MailAddress("deaninfotest@gmail.com", "Booking Soft");
                objMessage.From = fromAddress;
                objMessage.Subject = "Your Event Booking Information:";
                objMessage.To.Add(ClientEmailId);
                objMessage.IsBodyHtml = true;
                objMessage.Body = RegistrationMailFormatForEvenClient(ClientName, sdate, Edate, EventInfo);
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);
                smtpClient.Credentials = new System.Net.NetworkCredential("deaninfotest@gmail.com", "deanpassword");
                smtpClient.EnableSsl = true;
                smtpClient.Send(objMessage);
            }
        }
        catch
        {
            // Response.Write(ex);


        }

    }
    public static string RegistrationMailFormatForEvenClient(string name,  string sdate, string edate, string eventname)
    {
        StringBuilder sbLetter = new StringBuilder();
        sbLetter.Append("<html><body><div style='font-size: 13px;line-height:19px; padding-left:30px; margin-left:20px; font-family: Arial, Verdana'>");

        sbLetter.Append("<br /><br />");
        sbLetter.Append("Dear  ");
        sbLetter.Append(name);
       
        sbLetter.Append("<br /><br /> Your Booking Information as below:-");
        //sbLetter.Append("<br />");
        //sbLetter.Append("Details are as follows : ");
        sbLetter.Append("<br /><br />");
        sbLetter.Append("Event Start Date : ");
        sbLetter.Append(sdate);
        sbLetter.Append("<br />");
        sbLetter.Append("Event End Date : ");
        sbLetter.Append(edate);
        sbLetter.Append("<br />");
        sbLetter.Append("Event Booked For : ");
        sbLetter.Append(eventname);
        sbLetter.Append("<br />");
       // sbLetter.Append("End date : ");
        //sbLetter.Append(edate);
        sbLetter.Append("<br />");
        //sbLetter.Append(url);
        sbLetter.Append("<br /><br /> ");
        sbLetter.Append("");
        sbLetter.Append("<br />");
        sbLetter.Append("Regards,");
        sbLetter.Append("<br />");
        sbLetter.Append("Booking Soft Team");

        sbLetter.Append("<br /><br /><br />");

        sbLetter.Append("<p style='Font-Size:10px'>Please do not respond to this email.<br />  </p>");
        sbLetter.Append("<strong style='color:navy'></div></body></html>");
        return sbLetter.ToString();
    }
    #endregion
    public void MasterMailSend(string name )
    { 
    try  {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(ConfigurationManager.AppSettings["Email"]);
            Msg.To.Add(name);
            StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/HTMLMailFormat/MailEventCreator.htm"));
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            //Here replace the name with [MyName]
            StrContent = StrContent.Replace("[MyName]", name);
            Msg.Subject = "This mail is send to EventCreator";
            Msg.Body = StrContent.ToString();
            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["MailServer"];
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["Email"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["MailPort"]);
            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSLEnabled"].ToString());
           
            smtp.Send(Msg);
        }
        catch (Exception ex)
        { }
    
    }
    public void MasterMailSetting(string UserName, string EmailId, string ClientName, string sdate, string Edate, string stime, string Etime, string EventInfo, string subject, string bodymsg, string EventStatus, string Desp, string NotificationDate)
    {
        try
        {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(ConfigurationManager.AppSettings["Email"]);
            //Msg.To.Add(txtEmail.Text);
           //Msg.To.Add("sshekhar@deaninfotech.com");
            //Msg.To.Add("mdeepak@deaninfotech.com");
            Msg.To.Add(EmailId);
            //string reader = bodymsg;
            StringReader reader = new StringReader(bodymsg);
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            //Here replace the name with [MyName]
            StrContent = StrContent.Replace("[UserName]", UserName);
            StrContent = StrContent.Replace("[StartTime]", stime);
            StrContent = StrContent.Replace("[EndTime]", Etime);
            StrContent = StrContent.Replace("[StartDate]", sdate);
            StrContent = StrContent.Replace("[EndDate]", Edate);
            StrContent = StrContent.Replace("[GroundInfo]", EventInfo);
            StrContent = StrContent.Replace("[EventStatus]", EventStatus);
            StrContent = StrContent.Replace("[Desp]", Desp);
            StrContent = StrContent.Replace("[NotificationDate]", NotificationDate);
            StrContent = StrContent.Replace("Select", "");
            
            
           // Msg.Subject = "here goes the subject..";
            Msg.Subject = subject;
            Msg.Body = StrContent.ToString();
            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["MailServer"];
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["Email"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["MailPort"]);
            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSLEnabled"].ToString());

            smtp.Send(Msg);
        
        
        }
        catch { 
        
        }
    }
    public void MasterMailSettingTable(string AdminName, string AdminEmailId, string subject, string bodymsg,string sbtableinfo)
    {
        try
        {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(ConfigurationManager.AppSettings["Email"]);
            //Msg.To.Add(txtEmail.Text);
            // Msg.To.Add("sshekhar@deaninfotech.com");
            //Msg.To.Add("mdeepak@deaninfotech.com");
           Msg.To.Add(AdminEmailId);
            //string reader = bodymsg;
            StringReader reader = new StringReader(bodymsg);
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            //Here replace the name with [MyName]
            StrContent = StrContent.Replace("[SchedulerInfo]", sbtableinfo);
            //StrContent = StrContent.Replace("[StartTime]", stime);
            //StrContent = StrContent.Replace("[EndTime]", Etime);
            //StrContent = StrContent.Replace("[StartDate]", sdate);
            //StrContent = StrContent.Replace("[EndDate]", Edate);
            //StrContent = StrContent.Replace("[GroundInfo]", EventInfo);
            //StrContent = StrContent.Replace("[EventStatus]", EventStatus);
            //StrContent = StrContent.Replace("[Desp]", Desp);
            //StrContent = StrContent.Replace("[NotificationDate]", NotificationDate);
            //StrContent = StrContent.Replace("Select", "");


            // Msg.Subject = "here goes the subject..";
            Msg.Subject = subject;
            Msg.Body = StrContent.ToString();
            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["MailServer"];
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["Email"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["MailPort"]);
            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSLEnabled"].ToString());

            smtp.Send(Msg);


        }
        catch
        {

        }
    }
}