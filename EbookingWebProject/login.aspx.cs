using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Web.Script.Serialization;
using System.Net;
using System.Text.RegularExpressions;
using System.Xml;

namespace EbookingWebProject
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        string cityname;
        string countryname;
        string ipaddress;
        string regionname;
        string zipcode;
        string latitude;
        string longitude;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    SMTPSetting();
                }

                string externalIP;
                externalIP = (new WebClient()).DownloadString("http://checkip.dyndns.org/");
                externalIP = (new Regex(@"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}").Matches(externalIP)[0].ToString());
                //string ip = hdId.Value;
                string ip = externalIP;

           string APIKey ="4990cde56ed5d00c22883bdf552389b2c400b9a4";
     // http://api.locatorhq.com/?user=shekhar2946&key=4990cde56ed5d00c22883bdf552389b2c400b9a4&ip=182.77.49.3&format=xml
               // string url=string.Format("http://api.locatorhq.com/?user=shekhar2946&"+"&key="+APIKey+"&ip="+ip+"&format=xml");
           string url = string.Format("http://api.locatorhq.com/?user=shekhar2946&key=4990cde56ed5d00c22883bdf552389b2c400b9a4&ip=182.77.49.3&format=xml");
                //string APIKey = "b0283099450e7bd81d8d7b68b699f2e24f0602f99de2dfb3b2d37329f4ce1556";
                //string url = string.Format("http://api.ipinfodb.com/v3/ip-city/?key={0}&ip={1}&format=json", APIKey, ip);
                   Location loc = new Location();
                   List<Location> locations = new List<Location>();
                //using(XmlReader  reader = XmlReader.Create(@"http://api.locatorhq.com/?user=shekhar2946&key=4990cde56ed5d00c22883bdf552389b2c400b9a4&ip=182.77.49.3&format=xml"))
                   using (XmlReader reader = XmlReader.Create(@"http://api.locatorhq.com/?user=shekhar2946&key=4990cde56ed5d00c22883bdf552389b2c400b9a4&ip="+ip+"&format=xml"))
                {
                    while (reader.Read())
                    {
                    
                        switch (reader.Name.ToString())
                        {
                      
                               case "countryCode":
                               
                                loc.CountryCode = reader.ReadString();
                                locations.Add(loc);
                            

                                break;
                            case "countryName":
                               
                                loc.CountryName = reader.ReadString();
                                countryname = loc.CountryName;
                                locations.Add(loc);
                               
                                break;
                            case "region":
                              
                                loc.RegionName = reader.ReadString();
                                regionname = loc.RegionName;
                                locations.Add(loc);
                                
                               

                                break;
                            case "city":
                             
                                loc.CityName = reader.ReadString();
                                cityname = loc.CityName;
                                locations.Add(loc);
                                //cityname = reader.ReadString();

                                break;
                            case "latitude":
                               
                                loc.Latitude= reader.ReadString();
                                latitude = loc.Latitude;
                                locations.Add(loc);

                                break;
                            case "longitude":
                               
                                loc.Longitude = reader.ReadString();
                                longitude = loc.Longitude;
                                locations.Add(loc);
                                loc.IPAddress = ip;
                                locations.Add(loc);
                                ipaddress=ip;
                                  
                               

                                break;
                        }
                    }
                
                }
                //using (WebClient client = new WebClient())
                //{
                //    string json = client.DownloadString(url);
                //    Location location = new JavaScriptSerializer().Deserialize<Location>(json);
                //    List<Location> locations = new List<Location>();
                //    locations.Add(location);
                //    cityname = locations[0].CityName.ToString();
                //    countryname = locations[0].CountryName.ToString();
                //    ipaddress = locations[0].IPAddress.ToString();
                //    regionname = locations[0].RegionName.ToString();
                //    zipcode = locations[0].ZipCode.ToString();

                //}

            }

            catch(Exception ex)
            {
                ex.Message.ToString();
            }

        }


        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                
                SqlCommand cmd = new SqlCommand("select id,email,pass,userrole,concat(fname,' ',lname) as AdminName from admin where email = '" + username.Value.ToString().Trim() + "' and pass = '" + EncryptDecrypt.Encryptdata(password.Value.Trim()) + "' ", con);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {

                    
                    Session["userid"] = dr["id"].ToString();
                    string iddd = Session["userid"].ToString();
                    GridDataset.Setuid(Convert.ToInt32(iddd));
                    Session["role"] = dr["userrole"].ToString();
                    Session["Loginemail"] = dr["email"].ToString();
                    Session["AdminName"] = dr["AdminName"].ToString();
                    Session["login"] = "Login";
                    dr.Close();
                    con.Close();
                   SendMail("Successfully Login");
                    getLoginPermission();
                  
                    //Response.Redirect("Home.aspx", false);
                    Response.Redirect("Home.aspx", false);

                }
                //else if (username.Value.ToString() == "test" && password.Value.ToString() == "test")
                //{
                //    dr.Close();
                //    con.Close();
                //    Session["userid"] = 0;
                //    Session["login"] = "Login";
                //   // SendMail("Successfully Login");
                //    Response.Redirect("Home.aspx", false);


                //}

                else
                {
                    //SendMail("Failed");
                    lblerror1.Visible = true;
                    lblerror2.Text = string.Empty;
                }


                con.Close();
            }
            catch (Exception ex)
            {
                //  Response.Write(ex);
            }
            finally
            {
                con.Close();
                con.Dispose();

            }
        }
        public void getLoginPermission()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from tblMailSetting", con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dtt = new DataTable();
                ad.Fill(dtt);
                ClassMailPermission.SetLoginPermission(dtt);
               
                


            }
            catch
            {

            }


        }

        private void SendMail(string result)
        {
           // string message = CreateEmailFormat(Text2.Value, Text1.Value, username.Value, password.Value, result, ipaddress, countryname, regionname, cityname, zipcode,latitude,longitude);
            string message = CreateEmailFormat(Text2.Value, Text1.Value, username.Value, password.Value, result, hdnIp.Value, hdncountryname.Value, hdnregionname.Value, hdncity.Value, hdnzipcode.Value, hdnlatitude.Value, hdnlongitude.Value);
            sendLoginEmailToAdmin(message);
        }
        public string CreateEmailFormat(string Name, string email, string user, string pwd, string result, string ipaddress, string countryname, string regionname, string cityname, string zipcode, string latitude, string longitude)
        {
            StringBuilder sbLetter = new StringBuilder();
            sbLetter.Append("<html><body><div style='font-size: 13px;line-height:19px; padding-left:30px; margin-left:20px; font-family: Arial, Verdana'>");

            sbLetter.Append("<br /><br />");
            sbLetter.Append("Dear Admin ");
            sbLetter.Append("<br /><br /> A user try to login into E-Booking system:");
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Name</strong> : ");
            sbLetter.Append(Name);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>Email</strong> : ");
            sbLetter.Append(email);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>UserName</strong> : ");
            sbLetter.Append(user);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>Password</strong> : ");
            sbLetter.Append(pwd);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>Login Status</strong> : ");
            sbLetter.Append(result);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>IP Address</strong> : ");
            sbLetter.Append(ipaddress);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>Country</strong> : ");
            sbLetter.Append(countryname);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>State</strong> : ");
            sbLetter.Append(regionname);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>City</strong> : ");
            sbLetter.Append(cityname);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>Zip Code</strong> : ");
            sbLetter.Append(zipcode);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>latitude</strong> : ");
            sbLetter.Append(latitude);
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>longitude</strong> : ");
            sbLetter.Append(longitude);
            sbLetter.Append("<br /><br /> ");
            sbLetter.Append("");
            sbLetter.Append("<br />");
            sbLetter.Append("Regards,");
            sbLetter.Append("<br />");
            sbLetter.Append("Booking Soft Team");

            sbLetter.Append("<br /><br /><br />");

            sbLetter.Append("<strong style='color:navy'></div></body></html>");
            return sbLetter.ToString();

        }
        public void sendLoginEmailToAdmin(string message)
        {
            if (GridDataset.dtSmtp.Rows.Count > 0)
            {
                MailMessage objMessage = new MailMessage();
                MailAddress fromAddress = new MailAddress(GridDataset.dtSmtp.Rows[0]["FromAddress"].ToString(), GridDataset.dtSmtp.Rows[0]["DiaplayName"].ToString());
                objMessage.From = fromAddress;
                objMessage.Subject = "E-Booking Login Detail";
               // objMessage.To.Add("info@deaninfotech.com");
                objMessage.To.Add("sshekhar@deaninfotech.com");
                //objMessage.To.Add("sshekhar@deaninfotech.com");
               
                
                //objMessage.Bcc.Add("sshekhar@deaninfotech.com");
                objMessage.IsBodyHtml = true;
                objMessage.Body = message;
                SmtpClient smtpClient = new SmtpClient(GridDataset.dtSmtp.Rows[0]["MailServer"].ToString(), Convert.ToInt32(GridDataset.dtSmtp.Rows[0]["MailPort"].ToString()));
                smtpClient.Credentials = new System.Net.NetworkCredential(GridDataset.dtSmtp.Rows[0]["NetworkUserName"].ToString(), GridDataset.dtSmtp.Rows[0]["NetWorkPassword"].ToString());
                smtpClient.EnableSsl = true;
                smtpClient.Send(objMessage);
            }
        }
        public void SMTPSetting()
        {
            DataTable dtSmtp = new DataTable();
            SqlCommand cmd = new SqlCommand("select * from tblSMTPSetting", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(dtSmtp);
            
            GridDataset.SetdtSmtp(dtSmtp);
        }

        protected void btnSendPwd_Click(object sender, EventArgs e)
        {
            try
            {
         
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("prcForgetPwd", con);;
            
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", resetPwd.Value);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string username = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
                string email = dt.Rows[0]["email"].ToString();
                string pwd = dt.Rows[0]["pass"].ToString();
                SendMailToUser(username, email, EncryptDecrypt.Decryptdata(pwd));
                lblerror2.Text = "Password Is Send To Your Registered Email-Id.";
                resetPwd.Value = string.Empty;

            }
            else
            {
                lblerror2.Text = "Email-Id Is Not Registered With Us.";

            }
            
   
            }
            catch { }

        }
        protected void btnSendPwd_Click1(object sender, EventArgs e)
        {
            try
            {


                SendMailToUserQuery(txtQname.Value, txtQEmail.Value, txtQCtnt.Value, txtQuery.Value);
                  
                   

                
               


            }
            catch { }

        }
        public void SendMailToUserQuery(string UserName, string EmailId, string ContactNo, string Query)
        {

            try
            {

                if (!string.IsNullOrEmpty(EmailId))
                {
                    if (GridDataset.dtSmtp.Rows.Count > 0)
                    {
                        MailMessage objMessage = new MailMessage();
                        //MailAddress fromAddress = new MailAddress("deaninfotest@gmail.com", "CLINICIAN PORTAL LOGIN DETAILS");
                        MailAddress fromAddress = new MailAddress(GridDataset.dtSmtp.Rows[0]["FromAddress"].ToString(), GridDataset.dtSmtp.Rows[0]["DiaplayName"].ToString());
                        objMessage.From = fromAddress;
                        objMessage.Subject = "Ebooking Query Details:";
                        objMessage.To.Add("info@deaninfotech.com");
                        objMessage.Bcc.Add("sshekhar@deaninfotech.com");
                        objMessage.IsBodyHtml = true;
                        objMessage.Body = RegistrationMailFormatForEventOwnerQuery(UserName, EmailId, ContactNo, Query);
                        //SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);
                        SmtpClient smtpClient = new SmtpClient(GridDataset.dtSmtp.Rows[0]["MailServer"].ToString(), Convert.ToInt32(GridDataset.dtSmtp.Rows[0]["MailPort"].ToString()));
                        smtpClient.Credentials = new System.Net.NetworkCredential(GridDataset.dtSmtp.Rows[0]["NetworkUserName"].ToString(), GridDataset.dtSmtp.Rows[0]["NetWorkPassword"].ToString());
                        smtpClient.EnableSsl = true;
                        smtpClient.Send(objMessage);
                    }
                }
            }
            catch
            {
                // Response.Write(ex);


            }

        }
        public static string RegistrationMailFormatForEventOwnerQuery(string username, string emailis, string contactno, string query)
        {
            string url = "http://www.ebooking.deaninfotech.com/";
            StringBuilder sbLetter = new StringBuilder();
            sbLetter.Append("<html><body><div style='font-size: 13px;line-height:19px; padding-left:30px; margin-left:20px; font-family: Arial, Verdana'>");
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<br /><br /> Query Details Of Ebooking  are:");
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Dear Team ,</strong>");
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Below User Want to know about Ebooking.</strong>");
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Client Name:- </strong>");
            sbLetter.Append(username);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Client Email:- </strong>");
            sbLetter.Append(emailis);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Client ContactNo:- </strong>");
            sbLetter.Append(contactno);
            sbLetter.Append("<br /><br />");
            sbLetter.Append("<strong>Client Query:- </strong>");
            sbLetter.Append(query);
            sbLetter.Append("<br /><br />");
            //sbLetter.Append("<br />");
            //sbLetter.Append("Details are as follows : ");

            sbLetter.Append("<strong>Regards,</strong>");
            sbLetter.Append("<br />");
            sbLetter.Append("<strong>Booking Soft Team.</strong>");

            sbLetter.Append("<br /><br /><br />");

            sbLetter.Append("<p style='Font-Size:10px'>Please do not respond to this email.<br />  </p>");
            sbLetter.Append("<strong style='color:navy'></div></body></html>");
            return sbLetter.ToString();
        }
        public void SendMailToUser(string UserName, string EmailId, string Password)
        {

            try
            {

                if (!string.IsNullOrEmpty(EmailId))
                {
                    if (GridDataset.dtSmtp.Rows.Count > 0)
                    {
                        MailMessage objMessage = new MailMessage();
                        //MailAddress fromAddress = new MailAddress("deaninfotest@gmail.com", "CLINICIAN PORTAL LOGIN DETAILS");
                        MailAddress fromAddress = new MailAddress(GridDataset.dtSmtp.Rows[0]["FromAddress"].ToString(), GridDataset.dtSmtp.Rows[0]["DiaplayName"].ToString());
                        objMessage.From = fromAddress;
                        objMessage.Subject = "Ebooking Login Details:";
                        objMessage.To.Add(EmailId);
                        objMessage.IsBodyHtml = true;
                        objMessage.Body = RegistrationMailFormatForEventOwner(UserName, EmailId, Password);
                        //SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);
                        SmtpClient smtpClient = new SmtpClient(GridDataset.dtSmtp.Rows[0]["MailServer"].ToString(), Convert.ToInt32(GridDataset.dtSmtp.Rows[0]["MailPort"].ToString()));
                        smtpClient.Credentials = new System.Net.NetworkCredential(GridDataset.dtSmtp.Rows[0]["NetworkUserName"].ToString(), GridDataset.dtSmtp.Rows[0]["NetWorkPassword"].ToString());
                        smtpClient.EnableSsl = true;
                        smtpClient.Send(objMessage);
                    }
                }
            }
            catch
            {
                // Response.Write(ex);


            }

        }
        public static string RegistrationMailFormatForEventOwner(string username, string emailis, string password)
        {
            string url = "http://www.ebooking.deaninfotech.com/";
            StringBuilder sbLetter = new StringBuilder();
            sbLetter.Append("<html><body><div style='font-size: 13px;line-height:19px; padding-left:30px; margin-left:20px; font-family: Arial, Verdana'>");

            sbLetter.Append("<br /><br />");
            sbLetter.Append("Dear  ");
            sbLetter.Append(username);
            sbLetter.Append("<br /><br />");

            sbLetter.Append("<br /><br /> Your's Login Credentials are:");
            //sbLetter.Append("<br />");
            //sbLetter.Append("Details are as follows : ");
            sbLetter.Append("<br /><br />");
            sbLetter.Append("Login Id : ");
            sbLetter.Append(emailis);
            sbLetter.Append("<br />");
            sbLetter.Append("Password : ");
            sbLetter.Append(password);
            sbLetter.Append("<br />");

            sbLetter.Append("Login Here : ");
            sbLetter.Append(url);
            sbLetter.Append("<br /><br /> ");
            sbLetter.Append("");
            sbLetter.Append("<br />");
            sbLetter.Append("Regards,");
            sbLetter.Append("<br />");
            sbLetter.Append("Booking Soft Team.");

            sbLetter.Append("<br /><br /><br />");

            sbLetter.Append("<p style='Font-Size:10px'>Please do not respond to this email.<br />  </p>");
            sbLetter.Append("<strong style='color:navy'></div></body></html>");
            return sbLetter.ToString();
        }
    }

}

public class Location
{
    public string IPAddress { get; set; }
    public string CountryName { get; set; }
    public string CountryCode { get; set; }
    public string CityName { get; set; }
    public string RegionName { get; set; }
    public string ZipCode { get; set; }
    public string Latitude { get; set; }
    public string Longitude { get; set; }
    public string TimeZone { get; set; }
}