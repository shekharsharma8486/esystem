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


namespace EbookingWebProject
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        int userid;
        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {


            AccessPage();
            if (Session["userid"] != null)
            {

                userid = Convert.ToInt32(Session["userid"].ToString());
                if (userid != null)
                {
                    string admin = Session["role"].ToString();

                    if (!IsPostBack)
                    {
                        bellnotification();

                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", false);

                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);

            }
        }
        public void bellnotification()
        {


            SqlCommand cmd1 = new SqlCommand("select e.* from events e  left join  tbl_notifications n on e.id = n.eventid  where CONVERT(varchar(10), n.dt,110) between Convert(varchar(10), DateAdd(d, +1, CONVERT(VARCHAR(8), GETDATE(), 1)), 110)  and   Convert(varchar(10), DateAdd(d, +4, CONVERT(VARCHAR(8), GETDATE(), 1)), 110)  and  n.userid =" + userid + "", sqlcon);

            //working below in code

            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds);
            rptnoti.DataSource = ds;
            rptnoti.DataBind();
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("select count(*) as count from tbl_notifications where CONVERT(varchar(10), dt,110) between  Convert(varchar(10), DateAdd(d, +1, CONVERT(VARCHAR(8), GETDATE(), 1)), 110) and Convert(varchar(10), DateAdd(d, +4, CONVERT(VARCHAR(8), GETDATE(), 1)), 110)  and  userid =" + userid + "", sqlcon);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                divbell.InnerText = dr["count"].ToString();

            }

            if (divbell.InnerText == "0")
            {
                imgbell.CssClass = "blank";
            }
            dr.Close();
            sqlcon.Close();

        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["login"] = null;
            Session["userid"] = null;
            Session["role"] = null;
            Session["Loginemail"] = null;
            Session["AdminName"] = null;
            Session["login"] = null;
            Response.Redirect("Login.aspx", false);
        }


        protected void myButton_Click(object sender, EventArgs e)
        {
            string Name = ename.Text;
            string Email = eemail.Text;
            string CompanyName = ecompanyname.Text;
            string CompanyDomain = ecompanydomain.Text;
            string Location = elocation.Text;
            string Message = emessage.Text;
            sendmail(Name, Email, CompanyName, CompanyDomain, Location, Message);
            clear();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Thank You for contacting us.');", true);
        }
        public void clear()
        {
            ename.Text = string.Empty;
            eemail.Text = string.Empty;
            ecompanyname.Text = string.Empty;
            ecompanydomain.Text = string.Empty;
            elocation.Text = string.Empty;
            emessage.Text = string.Empty;
            BotBootInput1.Text = string.Empty;
        }

        public void sendmail(string namee, string emaile, string companyname, string companydomain, string location, string message)
        {
            try
            {
                MailMessage objMessage = new MailMessage();
                MailAddress fromAddress = new MailAddress("deaninfotest@gmail.com", "Booking Soft");
                objMessage.From = fromAddress;
                objMessage.Subject = "Enquiry from E-Booking System";
                objMessage.To.Add("administrator@deaninfotech.com");
                //objMessage.To.Add("mdeepak@deaninfotech.com");
                objMessage.IsBodyHtml = true;
                objMessage.Body = RegirstationMailFormat(namee, emaile, companyname, companydomain, location, message);
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);
                smtpClient.Credentials = new System.Net.NetworkCredential("deaninfotest@gmail.com", "deanpassword");
                smtpClient.EnableSsl = true;
                smtpClient.Send(objMessage);

            }
            catch
            {
            }

        }
        public static string RegirstationMailFormat(string namee, string emaile, string companyname, string companydomain, string location, string message)
        {
            StringBuilder sbLetter = new StringBuilder();
            sbLetter.Append("<html><body><div style='font-size: 13px; padding-left:20px; margin-left:20px; font-family: Arial, Verdana'>");

            sbLetter.Append("<img src='http://localhost:18972/backup/images/logo.png' alt='Dean Infotech'  />");

            sbLetter.Append(" <br /><br />");
            sbLetter.Append(" <br />Dear Admin , You have the following Enquiry from E-Booking System ");
            sbLetter.Append("<br /><br /> ");
            sbLetter.Append("Name : ");

            sbLetter.Append(namee);

            sbLetter.Append("<br /><br />");
            sbLetter.Append("Email ID : ");
            sbLetter.Append(emaile);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("Company Name : ");
            sbLetter.Append(companyname);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("Company Domain : ");
            sbLetter.Append(companydomain);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("Location : ");
            sbLetter.Append(location);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("Message : ");
            sbLetter.Append(message);
            sbLetter.Append("<br />");

            sbLetter.Append("<br /><br /><br />");

            //sbLetter.Append("<p style='Font-Size:10px'>Please do not respond to this email.<br /> Shimukjobs can not receive mail sent to this address. If you have any questions or need help, please write to <a href= ''>Email to Shimuk</a> </p>");
            sbLetter.Append("<strong style='color:navy'>Thank You</div>  ");
            return sbLetter.ToString();
        }
        public void AccessPage()
        {
            if (Session["role"] != null)
            {
                try
                {
                    DataSet ds = new DataSet();
                    DataTable newdt = new DataTable();
                    ds.ReadXml(Server.MapPath("AccessInfo.xml"));

                    DataRow[] row = ds.Tables[0].Select("Role='" + Session["role"].ToString() + "'");
                    if (row.Length > 0)
                    {
                        newdt = row.CopyToDataTable();
                        for (int i = 0; i <= newdt.Rows.Count - 1; i++)
                        {
                            bool access = Convert.ToBoolean(newdt.Rows[i]["Access"].ToString());
                            string page = Convert.ToString(newdt.Rows[i]["PageName"].ToString());
                            int id = Convert.ToInt16(i + 1);
                            if (id == 1 || id == 11 || id == 21)
                            {
                                if (access == true)
                                {
                                    AddEvent.Visible = true;
                                }
                                else
                                {
                                    AddEvent.Visible = false;
                                }


                            }
                            if (id == 2 || id == 22 || id == 32)
                            {
                                if (access == true)
                                {
                                    Promoters.Visible = true;
                                }
                                else
                                {
                                    Promoters.Visible = false;
                                }

                            }

                            if (id == 3 || id == 23 || id == 33)
                            {
                                if (access == true)
                                {
                                    Inventory.Visible = true;
                                }
                                else
                                {
                                    Inventory.Visible = false;
                                }

                            }
                            if (id == 4 || id == 24 || id == 34)
                            {
                                if (access == true)
                                {
                                    Invoices.Visible = true;
                                }
                                else
                                {
                                    Invoices.Visible = false;
                                }

                            }
                            if (id == 5 || id == 25 || id == 35)
                            {
                                if (access == true)
                                {
                                    Add_location.Visible = true;
                                }
                                else
                                {
                                    Add_location.Visible = false;
                                }

                            }
                            if (id == 6 || id == 26 || id == 36)
                            {
                                if (access == true)
                                {
                                    report.Visible = true;
                                }
                                else
                                {
                                    report.Visible = false;
                                }

                            }
                            if (id == 7 || id == 27 || id == 37)
                            {
                                if (access == true)
                                {
                                    Reminder.Visible = true;
                                }
                                else
                                {
                                    Reminder.Visible = false;
                                }

                            }
                            if (id == 8 || id == 28 || id == 38)
                            {
                                if (access == true)
                                {
                                    Admin.Visible = true;
                                }
                                else
                                {
                                    Admin.Visible = false;
                                }

                            }
                            if (id == 9 || id == 29 || id == 39)
                            {
                                if (access == true)
                                {
                                    AccessInfo.Visible = true;
                                }
                                else
                                {
                                    AccessInfo.Visible = false;
                                }

                            }
                            if (id == 10 || id == 30 || id == 40)
                            {
                                if (access == true)
                                {
                                    Schedule.Visible = true;
                                }
                                else
                                {
                                    Schedule.Visible = false;
                                }

                            }
                            //if (id == 1 && id == 11 && id == 21)
                            //{
                            // lnkAdmin.Visible=false;
                            //}
                            //    else
                            //{
                            //lnkAdmin.Visible=true;
                            //}

                        }
                    }
                    DataRow[] row1 = ds.Tables[0].Select("Role='" + Session["role"].ToString() + "'");
                    DataTable booldt = new DataTable();
                    booldt = row1.CopyToDataTable();
                    if (row1.Length > 0)
                    {
                        DataRow[] a1 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=7 and  Access=True");
                        DataRow[] a2 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=8 and Access=True");
                        DataRow[] a3 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=9 and  Access=True");

                        DataRow[] a11 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=2 and  Access=True");
                        DataRow[] a21 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=3 and Access=True");
                        DataRow[] a31 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=4 and  Access=True");
                        DataRow[] a41 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=6 and  Access=True");
                        DataRow[] a51 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=5 and Access=True");


                        DataRow[] b1 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=17 and  Access=True");
                        DataRow[] b2 = booldt.Select("Role='" + Session["role"].ToString() + "'  and Id=18 and Access=True");
                        DataRow[] b3 = booldt.Select("Role='" + Session["role"].ToString() + "'  and Id=19 and  Access=True");

                        DataRow[] b11 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=12 and  Access=True");
                        DataRow[] b21 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=13 and Access=True");
                        DataRow[] b31 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=14 and  Access=True");
                        DataRow[] b41 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=16 and  Access=True");
                        DataRow[] b51 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=15 and Access=True");

                        DataRow[] c1 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=27 and  Access=True");
                        DataRow[] c2 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=28 and Access=True");
                        DataRow[] c3 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=29 and  Access=True");

                        DataRow[] c11 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=22 and  Access=True");
                        DataRow[] c21 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=23 and Access=True");
                        DataRow[] c31 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=24 and  Access=True");
                        DataRow[] c41 = booldt.Select("Role='" + Session["role"].ToString() + "' and  Id=26 and  Access=True");
                        DataRow[] c51 = booldt.Select("Role='" + Session["role"].ToString() + "' and Id=25 and Access=True");
                        string role = Session["role"].ToString();
                        if (role == "Admin")
                        {
                            if (a1.Length > 0 || a2.Length > 0 || a3.Length > 0)
                            {
                                reminder1.Visible = true;
                            }
                            else
                            {
                                reminder1.Visible = false;
                            }
                            if (a11.Length > 0 || a21.Length > 0 || a31.Length > 0 || a41.Length > 0 || a51.Length > 0)
                            {
                                manageid.Visible = true;

                            }
                            else
                            {
                                manageid.Visible = false;
                            }
                        }
                        if (role == "Manager")
                        {
                            if (b1.Length > 0 || b2.Length > 0 || b3.Length > 0)
                            {
                                reminder1.Visible = true;
                            }
                            else
                            {
                                reminder1.Visible = false;
                            }
                            if (b11.Length > 0 || b21.Length > 0 || b31.Length > 0 || b41.Length > 0 || b51.Length > 0)
                            {
                                manageid.Visible = true;

                            }
                            else
                            {
                                manageid.Visible = false;
                            }
                        }
                        if (role == "Staff")
                        {
                            if (c1.Length > 0 || c2.Length > 0 || c3.Length > 0)
                            {
                                reminder1.Visible = true;
                            }
                            else
                            {
                                reminder1.Visible = false;
                            }
                            if (c11.Length > 0 || c21.Length > 0 || c31.Length > 0 || c41.Length > 0 || c51.Length > 0)
                            {
                                manageid.Visible = true;

                            }
                            else
                            {
                                manageid.Visible = false;
                            }
                        }

                    }
                }




                catch
                {
                    Response.Redirect("Login.aspx", false);

                }
            }

        }
    }
}