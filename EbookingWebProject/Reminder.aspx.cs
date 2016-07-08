using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;

namespace EbookingWebProject
{
    public partial class Reminder1 : System.Web.UI.Page
    {
     public   DataTable dtSmtp = new DataTable();
        int userid;
        SqlConnection sqlcnn = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            userid = Convert.ToInt32(Session["userid"]);
            if (userid != 0)
            {

                if (!IsPostBack)
                {
                    CKEditor1.Text = "Dear" + " &nbsp;&nbsp; " + "<span style='color:Red;'>" + "[UserName]" + "</span>" + "<br/>" + Environment.NewLine
                 + "<br/>" + "Start Date" + " &nbsp; &nbsp; " + "<span style='color:Red;'>" + "[StartDate]" + "</span>" + "<br/>" + Environment.NewLine
                + "<br/>" + "Start Time" + " &nbsp;&nbsp; " + "<span style='color:Red;'>" + "[StartTime]" + "</span>" + "<br/>" + Environment.NewLine
                 + "<br/>" + "End Date" + " &nbsp; &nbsp; " + "<span style='color:Red;'>" + "[EndDate]" + "</span>" +
                  "<br/>" + "End Time" + " &nbsp; &nbsp; " + "<span style='color:Red;'>" + "[EndTime]" + "</span>" + "<br/>" + Environment.NewLine +
                  "<br/>" + "Your Body Content Goes Here...";
                    fillInfo();
                    SetSmtpSetting(1);
                }
            }


            else
            {
                Response.Redirect("login.aspx", false);
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int cis = 0;
                SqlCommand cmd = new SqlCommand("prcMailSettingInsert", sqlcnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bodymsg", CKEditor1.Text);
                cmd.Parameters.AddWithValue("@Mailto", HiddenFieldMailTo.Value);
                cmd.Parameters.AddWithValue("@MailToId", HiddenField1.Value);
                if (chkConfirmMail.Checked == true)
                    //if (rb1.Checked == true)
                    //{
                    //    cmd.Parameters.AddWithValue("@Mailto", ddlMailEvent.SelectedItem.Text);
                    //    cmd.Parameters.AddWithValue("@MailToId", ddlMailEvent.SelectedItem.Value);
                    //}
                    //if (rb2.Checked == true)
                    //{
                    //    cmd.Parameters.AddWithValue("@Mailto", ddlNofication.SelectedItem.Text);
                    //    cmd.Parameters.AddWithValue("@MailToId", ddlNofication.SelectedItem.Value);

                    //}
                    cis = Convert.ToInt32(Session["userid"].ToString());
                cmd.Parameters.AddWithValue("@createBy", cis);
                cmd.Parameters.AddWithValue("@subject", txtsubject.Text.Trim());
                //txtRDate1.Text.Length == 0 ? DBNull.Value.ToString() : txtRDate1.Text);
                if (chkConfirmMail.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@chkMailSend", Convert.ToInt32("1"));
                }
                else if (chkConfirmMail.Checked == false)
                {
                    cmd.Parameters.AddWithValue("@chkMailSend", Convert.ToInt32("0"));
                }
                //cmd.Parameters.AddWithValue("@chkMailSend", chkConfirmMail.Checked == true ? Convert.ToInt32("1") : Convert.ToInt32("0"));
                //cmd.Parameters.AddWithValue("@timeInterval", rbn24.Checked==true ? Convert.ToInt32("24") : rbn48.Checked==true ? Convert.ToInt32("48") : rbn72.Checked==true ? Convert.ToInt32("72"));
                if (RadioButton1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@timeInterval", Convert.ToInt32("24"));
                }
                if (RadioButton2.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@timeInterval", Convert.ToInt32("48"));
                }
                if (RadioButton3.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@timeInterval", Convert.ToInt32("72"));
                }

                sqlcnn.Open();
                cmd.ExecuteNonQuery();
                sqlcnn.Close();

                if (HiddenField1.Value == "1")
                {
                    if (chkConfirmMail.Checked == true)
                    {
                        chkEventCreater.Checked = true;
                    }
                    else
                    {
                        chkEventCreater.Checked = false;
                    }

                }
                if (HiddenField1.Value == "2")
                {
                    if (chkConfirmMail.Checked == true)
                    {
                        checlient.Checked = true;
                    }
                    else
                    {
                        checlient.Checked = false;
                    }

                }
                if (HiddenField1.Value == "3")
                {
                    if (chkConfirmMail.Checked == true)
                    {
                        chkEmpReminder.Checked = true;
                    }
                    else
                    {
                        chkEmpReminder.Checked = false;
                    }

                }

                if (HiddenField1.Value == "5")
                {
                    if (RadioButton1.Checked == true)
                    {
                        rbn24.Checked = true;
                        rbn48.Checked = false;
                        rbn72.Checked = false;
                    }
                    if (RadioButton2.Checked == true)
                    {
                        rbn24.Checked = false;
                        rbn48.Checked = true;
                        rbn72.Checked = false;

                    }
                    if (RadioButton3.Checked == true)
                    {
                        rbn24.Checked = false;
                        rbn48.Checked = false;
                        rbn72.Checked = true;


                    }
                    if (chkConfirmMail.Checked == true)
                    {
                        CheckBox1.Checked = true;
                    }
                    else
                    {
                        CheckBox1.Checked = false;
                    }

                }
                if (HiddenField1.Value == "6")
                {
                    if (RadioButton1.Checked == true)
                    {
                        RadioButton4.Checked = true;
                        RadioButton5.Checked = false;
                        RadioButton6.Checked = false;
                    }
                    if (RadioButton2.Checked == true)
                    {
                        RadioButton4.Checked = false;
                        RadioButton5.Checked = true;
                        RadioButton6.Checked = false;
                    }
                    if (RadioButton3.Checked == true)
                    {
                        RadioButton4.Checked = false;
                        RadioButton5.Checked = false;
                        RadioButton6.Checked = true;
                    }
                    if (chkConfirmMail.Checked == true)
                    {
                        CheckBox2.Checked = true;
                    }
                    else
                    {
                        CheckBox2.Checked = false;
                    }

                }
                if (HiddenField1.Value == "7")
                {
                    if (RadioButton1.Checked == true)
                    {
                        RadioButton7.Checked = true;
                        RadioButton8.Checked = false;
                        RadioButton9.Checked = false;
                    }
                    if (RadioButton2.Checked == true)
                    {
                        RadioButton7.Checked = false;
                        RadioButton8.Checked = true;
                        RadioButton9.Checked = false;
                    }
                    if (RadioButton3.Checked == true)
                    {
                        RadioButton7.Checked = false;
                        RadioButton8.Checked = false;
                        RadioButton9.Checked = true;
                    }
                    if (chkConfirmMail.Checked == true)
                    {
                        CheckBox3.Checked = true;
                    }
                    else
                    {
                        CheckBox3.Checked = false;
                    }
                }


            }
            catch
            {
            }
            //fillInfo();
            getLoginPermission();

        }
        public void getLoginPermission()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from tblMailSetting", sqlcnn);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dtt = new DataTable();
                ad.Fill(dtt);
                ClassMailPermission.SetLoginPermission(dtt);


            }
            catch
            {

            }


        }
        [System.Web.Services.WebMethod]
        public static string FillMailInfo(string id)
        {
            DataTable dt = new DataTable();
            string ddlSelectedIndex = "";
            string ckeditor = "";
            string txtsubject = "";
            bool chkConfirmMail;
            int timeinverval;
            string returnvalue = "";

            SqlConnection sqlcnn = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("select * from tblMailSetting where MailToId='" + id + "'", sqlcnn);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlSelectedIndex = dt.Rows[0]["MailToId"].ToString();
                    ckeditor = dt.Rows[0]["bodymsg"].ToString();
                    txtsubject = dt.Rows[0]["subject"].ToString();
                    chkConfirmMail = Convert.ToBoolean(dt.Rows[0]["chkMailSend"].ToString());
                    timeinverval = Convert.ToInt32(dt.Rows[0]["timeInterval"].ToString());
                    returnvalue = ddlSelectedIndex + "~" + ckeditor + "~" + txtsubject + "~" + chkConfirmMail + "~" + timeinverval;
                }
                else
                {
                    returnvalue = "yy";

                }


            }
            catch { }
            return returnvalue;
        }
        public void senddynamicMail()
        {

            try
            {
                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress(ConfigurationManager.AppSettings["Email"]);
                //Msg.To.Add(txtEmail.Text);
                Msg.To.Add("sshekhar@deaninfotech.com");
                StreamReader reader = new StreamReader(Server.MapPath("~/SendMail.htm"));
                string readFile = reader.ReadToEnd();
                string StrContent = "";
                StrContent = readFile;
                //Here replace the name with [MyName]
                StrContent = StrContent.Replace("[MyName]", "sshekhar@deaninfotech.com");

                Msg.Subject = "here goes the subject..";
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
        public void fillInfo()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("select * from tblMailSetting", sqlcnn);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                ad.Fill(ds);


                for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                {
                    bool val = Convert.ToBoolean(ds.Tables[0].Rows[i]["chkMailSend"].ToString());
                    int chkval = Convert.ToInt32(ds.Tables[0].Rows[i]["MailToId"].ToString());
                    string timeint = Convert.ToString(ds.Tables[0].Rows[i]["timeInterval"].ToString());
                    if (chkval == Convert.ToInt32("1"))
                    {

                        chkEventCreater.Checked = val;

                    }
                    if (chkval == Convert.ToInt32("2"))
                    {

                        checlient.Checked = val;

                    }
                    if (chkval == Convert.ToInt32("3"))
                    {

                        chkEmpReminder.Checked = val;

                    }
                    if (chkval == Convert.ToInt32("5"))
                    {

                        CheckBox1.Checked = val;
                        if (timeint == "24")
                        {
                            rbn24.Checked = true;
                        }
                        if (timeint == "48")
                        {
                            rbn48.Checked = true;
                        }
                        if (timeint == "72")
                        {
                            rbn72.Checked = true;
                        }

                    }
                    if (chkval == Convert.ToInt32("6"))
                    {

                        CheckBox2.Checked = val;
                        if (timeint == "24")
                        {
                            RadioButton4.Checked = true;
                        }
                        if (timeint == "48")
                        {
                            RadioButton5.Checked = true;
                        }
                        if (timeint == "72")
                        {
                            RadioButton6.Checked = true;
                        }

                    }
                    if (chkval == Convert.ToInt32("7"))
                    {

                        CheckBox3.Checked = val;
                        if (timeint == "24")
                        {
                            RadioButton7.Checked = true;
                        }
                        if (timeint == "48")
                        {
                            RadioButton8.Checked = true;
                        }
                        if (timeint == "72")
                        {
                            RadioButton9.Checked = true;
                        }

                    }


                }

                //chkEventCreater.Checked = Convert.ToBoolean(ds.Tables[0].Select("MailToId=1"));
                //checlient.Checked = Convert.ToBoolean(ds.Tables[0].Select("MailToId=2"));
                //chkEmpReminder.Checked = Convert.ToBoolean(ds.Tables[0].Select("MailToId=3")); 

            }
            catch { }

        }

        public DataTable SetSmtpSetting(int cal)
        {
            //DataTable dtSmtp = new DataTable();
           
            try
            {
                if (cal == 0)
                {
                    SqlCommand cmd = new SqlCommand("sp_insertUpdateSMTPSetting", sqlcnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Auto_Id", hdnAutoId.Value);
                    cmd.Parameters.AddWithValue("@FromAddress", txtFromAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@DiaplayName", txtdisplayname.Text.Trim());
                    cmd.Parameters.AddWithValue("@MailServer", txtmailServer.Text.Trim());
                    cmd.Parameters.AddWithValue("@NetworkUserName", txtnetwrkUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@NetWorkPassword", txtNetworlPwd.Text.Trim());
                    cmd.Parameters.AddWithValue("@MailPort", txtMailPort.Text.Trim());
                    cmd.Parameters.AddWithValue("@EnabledSsl", chkEnbledSsl.Checked == true ? true : false);
                    cmd.Parameters.AddWithValue("@createdBy", GridDataset.Getuid());
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(dtSmtp);
                    GridDataset.SetdtSmtp(dtSmtp);
                    if (GridDataset.dtSmtp.Rows.Count > 0)
                    {

                        hdnAutoId.Value =GridDataset.dtSmtp.Rows[0]["Auto_Id"].ToString();
                        txtFromAddress.Text = GridDataset.dtSmtp.Rows[0]["FromAddress"].ToString();
                        txtdisplayname.Text = GridDataset.dtSmtp.Rows[0]["DiaplayName"].ToString();
                        txtmailServer.Text = GridDataset.dtSmtp.Rows[0]["MailServer"].ToString();
                        txtnetwrkUsername.Text = GridDataset.dtSmtp.Rows[0]["NetworkUserName"].ToString();
                        txtNetworlPwd.Text = GridDataset.dtSmtp.Rows[0]["NetWorkPassword"].ToString();
                        txtMailPort.Text = GridDataset.dtSmtp.Rows[0]["MailPort"].ToString();
                        chkEnbledSsl.Checked = Convert.ToBoolean(GridDataset.dtSmtp.Rows[0]["EnabledSsl"].ToString());
                        txtDummyEmail.Text = string.Empty;
                        Panel1.Enabled = false;
                        chkSMTP.Checked = false;

                    }
                }
                else if (cal == 1)
                {
                 
                    if (GridDataset.dtSmtp.Rows.Count>0)
                    {

                        hdnAutoId.Value = GridDataset.dtSmtp.Rows[0]["Auto_Id"].ToString();
                        txtFromAddress.Text = GridDataset.dtSmtp.Rows[0]["FromAddress"].ToString();
                        txtdisplayname.Text = GridDataset.dtSmtp.Rows[0]["DiaplayName"].ToString();
                        txtmailServer.Text = GridDataset.dtSmtp.Rows[0]["MailServer"].ToString();
                        txtnetwrkUsername.Text = GridDataset.dtSmtp.Rows[0]["NetworkUserName"].ToString();
                        txtNetworlPwd.Text = GridDataset.dtSmtp.Rows[0]["NetWorkPassword"].ToString();
                        txtMailPort.Text = GridDataset.dtSmtp.Rows[0]["MailPort"].ToString();
                        chkEnbledSsl.Checked = Convert.ToBoolean(GridDataset.dtSmtp.Rows[0]["EnabledSsl"].ToString());
                        txtDummyEmail.Text = string.Empty;
                        Panel1.Enabled = false;
                        chkSMTP.Checked = false;

                    }
                }
            
            }
            catch(Exception ex) {
                lblError.Text = ex.Message.ToString();
            
            }
            return dtSmtp;
        }

        protected void btnSmtp_Click(object sender, EventArgs e)
        {
            SetSmtpSetting(0);
        }

        protected void chkSMTP_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSMTP.Checked == true ? Panel1.Enabled = true : Panel1.Enabled = false)
            {

                txtDummyEmail.Text = string.Empty;
            }
           


        }

        protected void btnDummy_Click(object sender, EventArgs e)
        {
            try
            {

                if (GridDataset.dtSmtp.Rows.Count > 0)
                {
                    MailMessage objMessage = new MailMessage();
                    MailAddress fromAddress = new MailAddress(GridDataset.dtSmtp.Rows[0]["FromAddress"].ToString(), GridDataset.dtSmtp.Rows[0]["DiaplayName"].ToString());
                    objMessage.From = fromAddress;
                    objMessage.Subject = "This is Dummy Mail";
                    objMessage.To.Add(txtDummyEmail.Text.Trim());
                    //objMessage.Bcc.Add("sshekhar@deaninfotech.com");
                    objMessage.IsBodyHtml = true;
                    objMessage.Body = "This is ur Dummy mail";
                    SmtpClient smtpClient = new SmtpClient(GridDataset.dtSmtp.Rows[0]["MailServer"].ToString(), Convert.ToInt32(GridDataset.dtSmtp.Rows[0]["MailPort"].ToString()));
                    smtpClient.Credentials = new System.Net.NetworkCredential(GridDataset.dtSmtp.Rows[0]["NetworkUserName"].ToString(), GridDataset.dtSmtp.Rows[0]["NetWorkPassword"].ToString());
                    smtpClient.EnableSsl = Convert.ToBoolean(GridDataset.dtSmtp.Rows[0]["EnabledSsl"].ToString());
                    smtpClient.Send(objMessage);
                    lblError.Text = "Mail Send Successfully on :-" + txtDummyEmail.Text + ".";

                    txtDummyEmail.Text = string.Empty;
                }
            }
                catch(Exception ex)
              {
                  lblError.Text = ex.Message.ToString();
                }
            
        }
    }
}