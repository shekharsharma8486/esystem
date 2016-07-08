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
    public partial class EditEvent1 : System.Web.UI.Page
    {

        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        string grounds;
        string id;
        public static DataTable dummy = new DataTable();
        public static DataTable FillTabledummy = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                id = Request.QueryString["id"].ToString();
                HiddenField2.Value = id;

                if (!string.IsNullOrEmpty(Session["login"].ToString()))
                {
                    if (!IsPostBack)
                    {
                        dataingridview();
                        FillTableRow();
                        GetTimeIntervals();
                        Session["Noti"] = null;
                        Session["AddInventory"] = null;
                        chklistgrnd.Enabled = false;
                        CalendarExtender1.StartDate = DateTime.Now;
                        CalendarExtender2.StartDate = DateTime.Now;
                        CalendarExtender4.StartDate = DateTime.Now;
                        CalendarExtender5.StartDate = DateTime.Now;
                        CalendarExtender6.StartDate = DateTime.Now;
                        CalendarExtender7.StartDate = DateTime.Now;
                        //CalendarExtender3.StartDate = DateTime.Now;

                        BindAllEditPageDate();
                        filldata();

                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
                if (ckrestEvent.Checked == true)
                {

                    //checkc();
                }
            }
            catch
            {

            }

        }
        private void BindAllEditPageDate()
        {
            ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
            try
            {
                DataSet ds = new DataSet();
                ds = obj.BindAllEditPageDate(Convert.ToInt32(Request.QueryString["id"].ToString()));
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    chklistgrnd.DataSource = ds.Tables[0];
                    chklistgrnd.DataTextField = "checkbox_location";
                    chklistgrnd.DataValueField = "checkbox_id";
                    chklistgrnd.DataBind();
                }
                if (ds != null && ds.Tables[1].Rows.Count > 0)
                {
                    Session["AddInventory"] = ds.Tables[1];
                    grdInventory.DataSource = ds.Tables[1];
                    grdInventory.DataBind();


                }
                if (ds != null && ds.Tables[2].Rows.Count > 0)
                {
                    ddlpromoter.DataSource = ds.Tables[2];
                    ddlpromoter.DataTextField = "fullname";
                    ddlpromoter.DataValueField = "id";
                    ddlpromoter.DataBind();
                }
                if (ds != null && ds.Tables[3].Rows.Count > 0)
                {

                    ddluser.DataSource = ds.Tables[3];
                    ddluser.DataTextField = "fullname";
                    ddluser.DataValueField = "id";
                    ddluser.DataBind();
                }
                if (ds != null && ds.Tables[4].Rows.Count > 0)
                {

                    //Session["Noti"] = ds.Tables[4];
                    Session["Noti"] = ds.Tables[4];
                    gvuser.DataSource = ds.Tables[4];
                    gvuser.DataBind();
                }
                if (ds != null && ds.Tables[5].Rows.Count > 0)
                {

                    ddlInventory.DataSource = ds.Tables[5];
                    ddlInventory.DataTextField = "itemname";
                    ddlInventory.DataValueField = "id";
                    ddlInventory.DataBind();
                }
                if (ds != null && ds.Tables[6].Rows.Count > 0)
                {
                    ddlattach.DataSource = ds.Tables[6];
                    ddlattach.DataTextField = "invoicename";
                    ddlattach.DataValueField = "id";
                    ddlattach.DataBind();
                }
                if (ds != null && ds.Tables[7].Rows.Count > 0)
                {
                    // Session["Noti"] = ds.Tables[7];
                    // gvuser.DataSource = ds.Tables[7];
                    // gvuser.DataBind();
                }
            }
            catch { }
        }
        protected void btndone_Click(object sender, EventArgs e)
        {
            if (hdnpromsg.Value == "1")
            {
                lblpromsg.Text = "Client Already Exists :-" + " " + txtFname.Text + ", " + txtLname.Text + ", " + txtEmail.Text;
                txtFname.Focus();
                return;
            }
            else
            {
                updateEventdeatils();
                //  Response.Redirect("Home.aspx", false);
                Response.Redirect("Details.aspx?id=" + (Convert.ToInt32(Request.QueryString["id"].ToString())) + "", false);
            }
        }

        public void filldata()
        {

            if (!string.IsNullOrEmpty(id))
            {

                SqlCommand cmd = new SqlCommand("sp_Getdata", sqlcon);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.StoredProcedure;

                sqlcon.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    DateTime test = Convert.ToDateTime(dr["E_startdate"].ToString());
                    string txtTime1 = test.ToString("MMMM") + " " + test.ToString("yyyy");
                    ddlstatus.SelectedValue = dr["status"].ToString();
                    // ddlattach.SelectedValue = dr["invoice_attachmentid"].ToString();
                    txtETitle.Text = dr["Etitle"].ToString();
                    txtStartDate.Text = Convert.ToDateTime(dr["E_startdate"]).ToString("MM'/'dd'/'yyyy");
                    txtEndDate.Text = Convert.ToDateTime(dr["E_enddate"]).ToString("MM'/'dd'/'yyyy");
                    string txteTime2 = dr["E_time"].ToString();
                    grounds = dr["E_grounds"].ToString();
                    txtNotes.Text = dr["notes"].ToString();
                    string txtTime3 = dr["E_Notification1"].ToString();
                    string txtTime4 = dr["E_Notification2"].ToString();
                    string txtTime5 = dr["E_Notification3"].ToString();
                    string txtTime6 = dr["ad1fname"].ToString() + " " + dr["ad1lname"].ToString() + "(" + dr["ad1email"].ToString() + ")";
                    string txtTime7 = dr["ad2fname"].ToString() + " " + dr["ad2lname"].ToString() + "(" + dr["ad2email"].ToString() + ")";
                    string txtTime8 = dr["ad3fname"].ToString() + " " + dr["ad3lname"].ToString() + "(" + dr["ad3email"].ToString() + ")";
                    string txtTime9 = "lbloldnoti1.Text";
                    string txtTime10 = "lbloldnoti1.Text";
                    string txtTime11 = "lbloldnoti1.Text";
                    ddlcurr.Items.FindByText(dr["curr"].ToString()).Selected = true;
               
                    txttamt.Text = dr["tamt"].ToString();
                    txtdamt.Text = dr["damt"].ToString();
                    txtbamt.Text = dr["bamt"].ToString();
                    hdnbamt.Value = dr["bamt"].ToString();
                    lblattach1.Text = Path.GetFileName(dr["attachment1"].ToString());
                    lblattach2.Text = Path.GetFileName(dr["attachment2"].ToString());
                    lblattach3.Text = Path.GetFileName(dr["attachment3"].ToString());
                    lblattach4.Text = Path.GetFileName(dr["attachment4"].ToString());
                   
                    if (!string.IsNullOrEmpty(lblattach1.Text))
                    {
                        //attach1.Enabled = false;
                        att1.Attributes.CssStyle.Add("display", "block");
                    }
                    if (!string.IsNullOrEmpty(lblattach2.Text))
                    {
                        //attach2.Enabled = false;
                        att2.Attributes.CssStyle.Add("display", "block");


                    }
                    if (!string.IsNullOrEmpty(lblattach3.Text))
                    {
                        att3.Attributes.CssStyle.Add("display", "block");
                        // attach3.Enabled = false;
                    }
                    if (!string.IsNullOrEmpty(lblattach4.Text))
                    {
                        att4.Attributes.CssStyle.Add("display", "block");
                        //attach4.Enabled = false;
                    }
                   
                    hd1.Value = dr["attachment1"].ToString();
                    hd2.Value = dr["attachment2"].ToString();
                    hd3.Value = dr["attachment3"].ToString();
                    hd4.Value = dr["attachment4"].ToString();
                  

                    rdMainEx.Checked = Convert.ToBoolean(dr["RCcontract"].ToString());
                    rdInsurance.Checked = Convert.ToBoolean(dr["RCCertificate"].ToString());
                    rdlay.Checked = Convert.ToBoolean(dr["RCLayout"].ToString());
                    rdReminder.Checked = Convert.ToBoolean(dr["balanceRecieved"].ToString());

                    //txtRDate1.Text = (dr["RCcontractdate"] == System.DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(dr["RCcontractdate"])).ToString("MM-dd-yyyy");
                    //txtRDate2.Text = (dr["RCCertificateDate"] == System.DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(dr["RCCertificateDate"])).ToString("MM-dd-yyyy");
                    //txtRDate3.Text = (dr["RCLayoutDate"] == System.DBNull.Value ?  DateTime.MinValue : Convert.ToDateTime(dr["RCLayoutDate"])).ToString("MM-dd-yyyy");
                    //txtRDate4.Text = (dr["RCOpBalRecived"] == System.DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(dr["RCOpBalRecived"])).ToString("MM-dd-yyyy");
                    //txtRDate2.Text = txtRDate2.Text.Replace("01/01/1900", "").Trim();

                    txtRDate1.Text = dr["RCcontractdate"].ToString().Replace("01-01-1900 12:00:00 AM", "").Replace("12:00:00 AM", "");
                    txtRDate2.Text = dr["RCCertificateDate"].ToString().Replace("01-01-1900 12:00:00 AM", "").Replace("12:00:00 AM", "");
                    txtRDate3.Text = dr["RCLayoutDate"].ToString().Replace("01-01-1900 12:00:00 AM", "").Replace("12:00:00 AM", "");
                    txtRDate4.Text = dr["RCOpBalRecived"].ToString().Replace("01-01-1900 12:00:00 AM", "").Replace("12:00:00 AM", "");
                    //txtRDate2.Text = txtRDate2.Text.Replace("1/1/1900", "").Trim();
                    string ince = dr["invoicename"].ToString();
                    lblattachid.Value = dr["invoice_attachmentid"].ToString();
                    ddlstatus.SelectedValue = dr["status"].ToString();
                    ddlpromoter.SelectedValue = dr["pid"].ToString();
                    lblpid.Value = dr["pid"].ToString();
                    txtFname.Text = dr["Fname"].ToString();
                    txtLname.Text = dr["Lname"].ToString();
                    txtEmail.Text = dr["email"].ToString();
                    txtPhone.Text = dr["phone"].ToString();
                    ddlstartTime.SelectedValue = dr["startTime"].ToString();
                    ddlEndTime.SelectedValue = dr["EndTime"].ToString();

                    //this is promoter id:-
                    int promoteid = Convert.ToInt32(dr["promoterid"].ToString());
                    if (promoteid != 0)
                    {
                        rbtnExisClient.Checked = true;
                        ddlpromoter.Attributes.CssStyle.Add("display", "block");
                        lblpid.Value = dr["promoterid"].ToString();
                    }
                    else
                    {
                        chaddnewpro.Checked = true;
                        ddlpromoter.Attributes.CssStyle.Add("display", "none");
                        lblpid.Value = dr["promoterid"].ToString();
                    }

                    string invoicename = dr["invoiceName"].ToString();
                    if (!string.IsNullOrEmpty(invoicename))
                    {
                        rbnAddExisInvoce.Checked = true;
                        ddlattach.Items.FindByText(dr["invoicename"].ToString()).Selected = true;
                        divExisingInvoice.Style.Add("display", "block");
                        lblattachname.Text = ddlattach.SelectedItem.Text;

                        lblattachname.Visible = true;
                        spantick.Attributes.CssStyle.Add("display", "inline");
                    }
               

                  
                    dr.Close();
                    //sqlcon.Close();
                  
                    fillgrndsrdo();
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string checkeClient(string Cresult)
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            var results = Cresult.Split(',');
            var fname = results[0].Trim();
            var lname = results[1];
            var email = results[2];
            try
            {
                SqlCommand cmd = new SqlCommand("select Fname, Lname, email from promoters where Fname='" + fname.Trim() + "' and Lname='" + lname.Trim() + "' and email='" + email.Trim() + "'", sqlcon);
                sqlcon.Open();
                string result = (string)cmd.ExecuteScalar();
                if (!string.IsNullOrEmpty(result))
                {

                    return Cresult + " " + fname + " " + lname + " " + email;

                }
                else
                {

                    Cresult = "yy";

                }
                sqlcon.Close();
                return Cresult;
            }
            catch (Exception ex)
            { }
            return Cresult;
        }
        public void fillgrndsrdo()
        {
            try
            {
                string[] items = grounds.Split(',');



                for (int i = 0; i < chklistgrnd.Items.Count; i++)
                {
                    for (int j = 0; j < items.Length; j++)
                    {
                        if (chklistgrnd.Items[i].Value == items[j].ToString())
                        {
                            chklistgrnd.Items[i].Selected = true;

                        }
                    }
                }
            }
            catch
            {

            }
        }
        public void updateEventdeatils()
        {
            //ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
            //ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();

            ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
            ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
            //EventsDetails objEventsDetails1 = new EventsDetails();    
            try
            {

                string txtStartDate1 = string.IsNullOrEmpty(txtStartDate.Text.Trim()) ? ("1900-01-01") : (txtStartDate.Text.Trim());
                string txtEndDate1 = string.IsNullOrEmpty(txtEndDate.Text.Trim()) ? ("1900-01-01") : (txtEndDate.Text.Trim());
                string txtRDate11 = string.IsNullOrEmpty(txtRDate1.Text.Trim()) ? ("1900-01-01") : (txtRDate1.Text.Trim());
                string txtRDate22 = string.IsNullOrEmpty(txtRDate2.Text.Trim()) ? ("1900-01-01") : (txtRDate2.Text.Trim());
                string txtRDate33 = string.IsNullOrEmpty(txtRDate3.Text.Trim()) ? ("1900-01-01") : (txtRDate3.Text.Trim());
                string txtRDate44 = string.IsNullOrEmpty(txtRDate4.Text.Trim()) ? ("1900-01-01") : (txtRDate4.Text.Trim());

                objEventsDetails1.ID = Convert.ToInt32(Request.QueryString["id"].ToString());
                objEventsDetails1.Etitle = txtETitle.Text.Trim();
                objEventsDetails1.E_Startdate = Convert.ToDateTime(txtStartDate1, System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                objEventsDetails1.E_Enddate = Convert.ToDateTime(txtEndDate1, System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                //objEventsDetails1.E_Time = txtTime.Text.Trim();
                objEventsDetails1.E_Time = System.DateTime.Today.ToString();
                objEventsDetails1.E_Grounds = getground();
                objEventsDetails1.E_Notification1 = "notification1()";
                objEventsDetails1.E_Notification2 = "notification2()";
                objEventsDetails1.E_Notification3 = "notification3()";
                objEventsDetails1.RCmain = rdMainEx.Checked;
                objEventsDetails1.RCcerti = rdInsurance.Checked;
                objEventsDetails1.RClay = rdlay.Checked;
                objEventsDetails1.RCmaindate = Convert.ToDateTime(txtRDate11, System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                objEventsDetails1.RCcertidate = Convert.ToDateTime(txtRDate22, System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                objEventsDetails1.RClaydate = Convert.ToDateTime(txtRDate33, System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                objEventsDetails1.RCOpBalReciveD = Convert.ToDateTime(txtRDate44, System.Globalization.CultureInfo.GetCultureInfo("en-US"));
                objEventsDetails1.EBalancerecive = txtbamt.Text;
                objEventsDetails1.EBalance = rdReminder.Checked;
                if (rbnAddNewInvoce.Checked == true)
                {
                    objEventsDetails1.Attachmentid = lblattachid.Value = Convert.ToString(SaveInvoice());
                }
                else if (rbnAddExisInvoce.Checked == true)
                {
                    objEventsDetails1.Attachmentid = lblattachid.Value;
                }
                else
                {
                    objEventsDetails1.Attachmentid = lblattachid.Value;
                }
                objEventsDetails1.FName = txtFname.Text;
                objEventsDetails1.LName = txtLname.Text;
                objEventsDetails1.EMail = txtEmail.Text;
                objEventsDetails1.PHone = txtPhone.Text;
                objEventsDetails1.STatus = ddlstatus.SelectedValue;
                objEventsDetails1.Attachment1 = attachment1();
                objEventsDetails1.Attachment2 = attachment2();
                objEventsDetails1.Attachment3 = attachment3();
                objEventsDetails1.Attachment4 = attachment4();
               
                objEventsDetails1.CUrr = ddlcurr.SelectedItem.Text;
                objEventsDetails1.TAmt = txttamt.Text;
                objEventsDetails1.DAmt = txtdamt.Text;
                objEventsDetails1.BAmt = hdnbamt.Value;
                objEventsDetails1.NoTes = txtNotes.Text.Trim();

                if (chaddnewpro.Checked == true)
                {
                    int idd = 0;
                    if ((!string.IsNullOrEmpty(txtFname.Text.Trim())) || (!string.IsNullOrEmpty(txtLname.Text.Trim())) || (!string.IsNullOrEmpty(txtEmail.Text.Trim())))
                    {
                        objEventsDetails1.Chk_Promoter = "1";
                        objEventsDetails1.iDD = idd;
                    }
                    else
                    {
                        objEventsDetails1.Chk_Promoter = "0";
                        objEventsDetails1.iDD = idd;
                    }
                }

                if (rbtnExisClient.Checked == true)
                {
                    objEventsDetails1.Chk_Promoter = "0";
                    objEventsDetails1.iDD = Convert.ToInt32(lblpid.Value.Trim());
                }
                objEventsDetails1.StartTime = Convert.ToString(ddlstartTime.SelectedItem.Text.Trim() == "Select" ? "" : ddlstartTime.SelectedItem.Text.Trim());

                objEventsDetails1.E_Time = Convert.ToString(ddlEndTime.SelectedItem.Text.Trim() == "Select" ? "" : ddlEndTime.SelectedItem.Text.Trim());
                objEventsDetails1.UPDATEId = Convert.ToInt32(Session["userid"].ToString());
             
               // obj.updateEvent(objEventsDetails1);
                updateEvent1(objEventsDetails1);
                InsertInventory();
                InsertNotification();
            }
            catch
            {

            }

        }

        private void updateEvent1(ServiceReference1.EventsDetails objEventsDetails)
        {
            try
            {


                SqlCommand cmd = new SqlCommand("sp_UpdateEvent", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", objEventsDetails.ID);
                cmd.Parameters.AddWithValue("@etitle", objEventsDetails.Etitle);
                cmd.Parameters.AddWithValue("@E_startdate", objEventsDetails.E_Startdate);

                cmd.Parameters.AddWithValue("@E_enddate", objEventsDetails.E_Enddate);


                cmd.Parameters.AddWithValue("@E_time", objEventsDetails.E_Time);


                cmd.Parameters.AddWithValue("@E_grounds", objEventsDetails.E_Grounds);

                cmd.Parameters.AddWithValue("@E_notification1", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@E_notification2", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@E_notification3", Convert.ToInt32("0"));





                cmd.Parameters.AddWithValue("@rcmain", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@rccerti", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@rclay", Convert.ToInt32("0"));
                cmd.Parameters.AddWithValue("@rcmaindate", objEventsDetails.RCmaindate);
                cmd.Parameters.AddWithValue("@rccertidate", objEventsDetails.RCcertidate);
                cmd.Parameters.AddWithValue("@rclaydate", objEventsDetails.RClaydate);

                cmd.Parameters.AddWithValue("@RCOpBalRecived", objEventsDetails.RCOpBalReciveD);

                cmd.Parameters.AddWithValue("@ebalancerecive", objEventsDetails.EBalance);
                cmd.Parameters.AddWithValue("@Ebalance", objEventsDetails.EBalance);

                cmd.Parameters.AddWithValue("@attachmentid", objEventsDetails.Attachmentid);





                // cmd.Parameters.AddWithValue("@idd", lblpid.Value);
                cmd.Parameters.AddWithValue("@Fname", objEventsDetails.FName);
                cmd.Parameters.AddWithValue("@Lname", objEventsDetails.LName);
                cmd.Parameters.AddWithValue("@email", objEventsDetails.EMail);
                cmd.Parameters.AddWithValue("@phone", objEventsDetails.PHone);
                cmd.Parameters.AddWithValue("@status", objEventsDetails.STatus);

                cmd.Parameters.AddWithValue("@attachment1", objEventsDetails.Attachment1);
                cmd.Parameters.AddWithValue("@attachment2", objEventsDetails.Attachment2);
                cmd.Parameters.AddWithValue("@attachment3", objEventsDetails.Attachment3);
                cmd.Parameters.AddWithValue("@attachment4", objEventsDetails.Attachment4);
                cmd.Parameters.AddWithValue("@attachment5", "");
                cmd.Parameters.AddWithValue("@curr", objEventsDetails.CUrr);
                cmd.Parameters.AddWithValue("@tamt", objEventsDetails.TAmt);
                cmd.Parameters.AddWithValue("@damt", objEventsDetails.DAmt);





                cmd.Parameters.AddWithValue("@bamt", objEventsDetails.BAmt);
                cmd.Parameters.AddWithValue("@Notes", objEventsDetails.NoTes);

                cmd.Parameters.AddWithValue("@chk_promoter", objEventsDetails.Chk_Promoter);

                cmd.Parameters.AddWithValue("@idd", objEventsDetails.iDD);



                cmd.Parameters.AddWithValue("@startTime", objEventsDetails.StartTime);
                cmd.Parameters.AddWithValue("@EndTime", objEventsDetails.E_Time);
                cmd.Parameters.AddWithValue("@UpdateId", objEventsDetails.UPDATEId);


                sqlcon.Open();
                cmd.ExecuteNonQuery();
                sqlcon.Close();

            }
            catch (Exception ex)
            {

            }
        }
        protected void btnnoti_Click(object sender, EventArgs e)
        {
            //double val = Convert.ToInt32(Convert.ToInt32(gtotal.ToString()) + Convert.ToInt32(txtPkChrg.Text == "" ? 0 : Convert.ToInt32(txtPkChrg.Text)) + Convert.ToInt32(txtExcDty.Text.Trim()));
            decimal tamt = Convert.ToDecimal(txttamt.Text == "" ? 0 : Convert.ToDecimal(txttamt.Text));
            decimal damt = Convert.ToDecimal(txtdamt.Text == "" ? 0 : Convert.ToDecimal(txtdamt.Text));
            txtbamt.Text = Convert.ToString(tamt - damt);
            hdnbamt.Value = txtbamt.Text;
            if (ddlattach.SelectedIndex > 0)
            {
                lblattachname.Text = ddlattach.SelectedItem.Text;

                lblattachname.Visible = true;
                spantick.Attributes.CssStyle.Add("display", "inline");

            }
            string users = ddluser.SelectedItem.Text;
            string noti_text = txtnoti.Text;
            // string noti_textdate = txtnotidate.Text;
            int userid = Convert.ToInt32(ddluser.SelectedItem.Value);
            string eventid = Request.QueryString["id"].ToString();
            //if (hdnnoti.Value == "0")
            //{
            if (Session["Noti"] == null)
            {
                DataTable Noti_Ds = new DataTable();
                Noti_Ds = new DataTable();
                Noti_Ds.Columns.Add("User");
                Noti_Ds.Columns.Add("Description");
                Noti_Ds.Columns.Add("Date");
                Noti_Ds.Columns.Add("UserId");
                Noti_Ds.Columns.Add("EventId");

                Session["Noti"] = Noti_Ds;
                DataRow drow = Noti_Ds.NewRow();
                drow["User"] = users;
                drow["Description"] = noti_text;
                drow["Date"] = txtnotidate.Text.Trim();

                // drow["Date"] = DateTime.Now.ToString("MM'/'dd'/'yyyy");
                drow["UserId"] = userid;
                drow["EventId"] = eventid;
                Noti_Ds.Rows.Add(drow);

                gvuser.DataSource = Noti_Ds;
                gvuser.DataBind();
            }
            else
            {
                DataTable Noti_Ds = (DataTable)Session["Noti"];
                DataRow drow = Noti_Ds.NewRow();
                drow["User"] = users;
                drow["Description"] = noti_text;
                drow["Date"] = txtnotidate.Text.Trim();
                //drow["Date"] = DateTime.Now.ToString("MM'/'dd'/'yyyy");
                drow["UserId"] = userid;
                drow["EventId"] = eventid;

                Noti_Ds.Rows.Add(drow);

                gvuser.DataSource = Noti_Ds;
                gvuser.DataBind();

            }
            ddluser.SelectedIndex = 0;
            txtnoti.Text = string.Empty;
            txtnotidate.Text = string.Empty;
        }

        //public string notification1()
        //{
        //    string id = hdnnotiid1.Value;

        //    if (!string.IsNullOrEmpty(hdnnoti1.Value))
        //    {

        //        id = hdnnoti1.Value;

        //    }
        //    return id;
        //}
        //public string notification2()
        //{
        //    string id = hdnnotiid2.Value;

        //    if (!string.IsNullOrEmpty(hdnnoti2.Value))
        //    {

        //        id = hdnnoti2.Value;

        //    }
        //    return id;
        //}
        //public string notification3()
        //{
        //    string id = hdnnotiid3.Value;

        //    if (!string.IsNullOrEmpty(hdnnoti3.Value))
        //    {

        //        id = hdnnoti3.Value;
        //    }
        //    return id;
        //}
        #region Attachment code here
        public string attachment1()
        {

            string path = hd1.Value;


            // string path="";

            if (attach1.HasFile == true)
            {
                path = Server.MapPath("~/attach1/" + attach1.PostedFile.FileName);
                attach1.PostedFile.SaveAs(path);

            }
            return path;
        }
        public string attachment2()
        {
            string path = hd2.Value;
            //string path = "";
            if (attach2.HasFile == true)
            {
                path = Server.MapPath("~/attach2/" + attach2.PostedFile.FileName);
                attach2.PostedFile.SaveAs(path);

            }
            return path;
        }
        public string attachment3()
        {
            string path = hd3.Value;
            //string path = "";
            if (attach3.HasFile == true)
            {
                path = Server.MapPath("~/attach3/" + attach3.PostedFile.FileName);
                attach3.PostedFile.SaveAs(path);

            }
            return path;
        }
        public string attachment4()
        {
            string path = hd4.Value;
            //string path = "";
            if (attach4.HasFile == true)
            {
                path = Server.MapPath("~/attach4/" + attach4.PostedFile.FileName);
                attach4.PostedFile.SaveAs(path);

            }
            return path;
        }
      
        #endregion
        public string getground()
        {
            string ground = "";

            for (int i = 0; i < chklistgrnd.Items.Count; i++)
            {
                if (chklistgrnd.Items[i].Selected)
                {
                    ground = ground + "," + chklistgrnd.Items[i].Value;
                }
            }

            if (!string.IsNullOrEmpty(ground))
            {

                ground = ground.Remove(0, 1);
            }
            return ground;

        }
        [System.Web.Services.WebMethod]
        public static string getpromoterdata(int id)
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            string fname = "";
            string lname = "";
            string email = "";
            string phone = "";
            string pid = "";
            string value = "";
            if (!string.IsNullOrEmpty(id.ToString()))
            {
                SqlCommand cmd = new SqlCommand("Select id,fname,lname,phone,email from promoters where id = " + id + "", sqlcon);
                sqlcon.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    fname = dr["fname"].ToString();
                    lname = dr["lname"].ToString();
                    email = dr["email"].ToString();
                    phone = dr["phone"].ToString();
                    pid = dr["id"].ToString();

                }
                value = fname + "~" + lname + "~" + email + "~" + phone + "~" + pid;
                dr.Close();
                sqlcon.Close();
            }
            return value;
        }
        protected void gvuser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvuser.PageIndex = e.NewPageIndex;

            DataTable Noti_Ds = (DataTable)Session["Noti"];
            gvuser.DataSource = Noti_Ds;
            gvuser.DataBind();

        }
        public List<string> GetTimeIntervals()
        {
            List<string> timeIntervals = new List<string>();
            TimeSpan startTime = new TimeSpan(0, 0, 0);
            DateTime startDate = new DateTime(DateTime.MinValue.Ticks); // Date to be used to get shortTime format.
            for (int i = 0; i < 48; i++)
            {
                int minutesToBeAdded = 30 * i;      // Increasing minutes by 30 minutes interval
                TimeSpan timeToBeAdded = new TimeSpan(0, minutesToBeAdded, 0);
                TimeSpan t = startTime.Add(timeToBeAdded);
                DateTime result = startDate + t;
                timeIntervals.Add(result.ToShortTimeString());      // Use Date.ToShortTimeString() method to get the desired format                
            }

            ddlstartTime.DataSource = timeIntervals;
            ddlstartTime.DataBind();
            ddlEndTime.DataSource = timeIntervals;
            ddlEndTime.DataBind();
            ddlstartTime.Items.Insert(0, "Select");
            ddlEndTime.Items.Insert(0, "Select");

            return timeIntervals;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var index1 = e.CommandArgument;
            int index = Convert.ToInt32(index1);

            SqlCommand cmd1 = new SqlCommand("Select checkbox_location from chk_location where checkbox_id= " + index + "", sqlcon);
            SqlDataAdapter adm = new SqlDataAdapter(cmd1);
            DataTable dtinfo = new DataTable();
            adm.Fill(dtinfo);
            lblEventName.Text = dtinfo.Rows[0]["checkbox_location"].ToString();
            SqlCommand cmd = new SqlCommand("select id,E_grounds,Etitle as 'Event_Title', convert(varchar(10), E_startdate,101) as StartDate ,convert(varchar(10), E_enddate,101) as EndDate,StartTime,EndTime,case status when 1 then 'Confirm' when 0 then 'Hold' end as status from [dbo].[events] where E_startdate >='" + txtStartDate.Text.Trim() + "' and E_enddate <= '" + txtEndDate.Text.Trim() + "' or '" + txtStartDate.Text.Trim() + "' between E_startdate and E_enddate or '" + txtEndDate.Text.Trim() + "' between  E_startdate and E_enddate  and  E_grounds  like '%" + index + "%' order by StartDate", sqlcon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            ad.Fill(ds);

            DataRow[] row = ds.Tables[0].Select("E_grounds LIKE '%" + index + "%'");
            if (row.Length > 0)
            {
                DataTable dsadd = new DataTable();
                dsadd = row.CopyToDataTable();
                grdInventInfo.DataSource = dsadd;
                grdInventInfo.DataBind();

            }
            else if (ds == null)
            {
                DataSet dss = new DataSet();
                grdInventInfo.DataSource = dss;
                grdInventInfo.DataBind();
            }

            ModalPopupExtender2.Show();
        }
        protected void grdInventory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int i = Convert.ToInt32((e.CommandArgument).ToString());
            DataTable dt = (DataTable)Session["AddInventory"];
            dt.Rows[i].Delete();
            Session["AddInventory"] = dt;
            this.grdInventory.DataSource = ((DataTable)Session["AddInventory"]).DefaultView;
            this.grdInventory.DataBind();
            dt.AcceptChanges();
        }
        public void checkc()
        {
            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            if (dt.Columns.Count == 0)
            {
                dt.Columns.Add("c1");
                dt.Columns.Add("c2");
                dt.Columns.Add("c3");
                dt.Columns.Add("c4");
            }
            string sdate1 = txtStartDate.Text;
            string edate1 = txtEndDate.Text;
            for (int i = 0; i < chklistgrnd.Items.Count; i++)
            {
                if (chklistgrnd.Items[i].Selected)
                {
                    Label1.Text = chklistgrnd.Items[i].Value;
                    int id = Convert.ToInt32(Label1.Text);

                    SqlConnection sqlcon1 = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
                    sqlcon1.Open();
                    //SqlCommand cmd = new SqlCommand("select CONVERT(varchar(10), E_startdate,101) as E_startdate,CONVERT(varchar(10), E_enddate,101) as E_enddate ,E_grounds from events where E_grounds like '%" + id + "%' and CONVERT(varchar(10), E_startdate,101)  between '" + sdate1 + "' and '" + edate1 + "' or CONVERT(varchar(10), E_enddate,101)  between '" + sdate1 + "' and '" + edate1 + "' and E_grounds like '%" + id + "%'", sqlcon1);
                    SqlCommand cmd = new SqlCommand("prcgetassertInfo", sqlcon1);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@groundid", id);
                    cmd.Parameters.AddWithValue("@sdate1", sdate1);
                    cmd.Parameters.AddWithValue("@edate1", edate1);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(ds);

                    string MinValue = Convert.ToString(ds.Tables[0].Compute("MIN([E_startdate])", ""));
                    string mdate = MinValue.ToString() + "&nbsp";

                    string MaxValue = Convert.ToString(ds.Tables[0].Compute("MAX([E_enddate])", ""));
                    string mxate = MaxValue.ToString();
                    string locName = getlocationName(Label1.Text);
                    DataRow[] row = ds.Tables[0].Select("E_grounds LIKE '%" + id.ToString() + "%'");

                    if (!string.IsNullOrEmpty(mdate) && !string.IsNullOrEmpty(mxate) && row.Length > 0)
                    {
                        dt.Rows.Add("<span style='color:blue;'>" + locName + " " + "Is Already Booked Between" + "</span>", txtStartDate.Text.Trim() + "<span style='color:blue;'>&nbsp;" + "&nbsp;And&nbsp;" + "</span>" + " ", txtEndDate.Text.Trim() + "&nbsp;", id);

                    }
                    sqlcon1.Close();
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        private static string getlocationName(string id)
        {
            string name = "";
            SqlConnection sqlcon1 = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            sqlcon1.Open();
            SqlCommand cmd = new SqlCommand("select checkbox_location from chk_location where checkbox_id=@id", sqlcon1);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                name = dr["checkbox_location"].ToString();
            }
            dr.Close();
            sqlcon1.Close();

            return name;
        }

        protected void ckrestEvent_CheckedChanged(object sender, EventArgs e)
        {
            if (ckrestEvent.Checked == true)
            {
                txtETitle.Enabled = true;
                chklistgrnd.Enabled = true;
                txtStartDate.Enabled = true;
                ddlstartTime.Enabled = true;
                txtEndDate.Enabled = true;
                ddlEndTime.Enabled = true;
                ddlstatus.Enabled = true;
                txtStartDate.Text = string.Empty;
                txtStartDate.Text = "";
                txtEndDate.Text = string.Empty;
                ddlstartTime.SelectedIndex = 0;
                ddlEndTime.SelectedIndex = 0;
                foreach (ListItem li in chklistgrnd.Items)
                {
                    li.Selected = false;
                }

            }
            if (ckrestEvent.Checked == false)
            {
                string id = Request.QueryString["id"].ToString();
                Response.Redirect("EditEvent.aspx?id=" + id + "", false);
            }

        }

        protected void btnAddInventory_Click(object sender, EventArgs e)
        {
            decimal tamt = Convert.ToDecimal(txttamt.Text == "" ? 0 : Convert.ToDecimal(txttamt.Text));
            decimal damt = Convert.ToDecimal(txtdamt.Text == "" ? 0 : Convert.ToDecimal(txtdamt.Text));
            txtbamt.Text = Convert.ToString(tamt - damt);
            hdnbamt.Value = txtbamt.Text;
            if (ddlattach.SelectedIndex > 0)
            {
                lblattachname.Text = ddlattach.SelectedItem.Text;

                lblattachname.Visible = true;
                spantick.Attributes.CssStyle.Add("display", "inline");

            }
            //DataSet dsinvent = new DataSet();
            try
            {
                int inventoryId = Convert.ToInt32(ddlInventory.SelectedValue);
                string inventorName = ddlInventory.SelectedItem.Text;
                string invertoryQty = txtInvQty.Text.Trim();
                string invertoryDescp = txtInvDescp.Text.Trim();

                if (Session["AddInventory"] == null)
                {
                    DataTable Inventory_Ds = new DataTable();
                    Inventory_Ds = new DataTable();
                    Inventory_Ds.Columns.Add("inventoryId");
                    Inventory_Ds.Columns.Add("inventorName");
                    Inventory_Ds.Columns.Add("invertoryQty");
                    Inventory_Ds.Columns.Add("invertoryDescp");
                    Inventory_Ds.Columns.Add("EventsDate");
                    //DateTime dt = new DateTime();


                    Session["AddInventory"] = Inventory_Ds;
                    DataRow drow = Inventory_Ds.NewRow();
                    drow["inventoryId"] = inventoryId;
                    drow["inventorName"] = inventorName;
                    drow["invertoryQty"] = invertoryQty;
                    drow["invertoryDescp"] = invertoryDescp;
                    //dt = DateTime.ParseExact(txtStartDate.Text.Trim().ToString(""));
                    drow["EventsDate"] = (Convert.ToDateTime(txtStartDate.Text).ToString("MM'/'dd'/'yyyy")).ToString();

                    Inventory_Ds.Rows.Add(drow);
                    // dsinvent.Merge(Inventory_Ds);
                    grdInventory.DataSource = Inventory_Ds;
                    grdInventory.DataBind();

                    ddlInventory.SelectedIndex = 0;
                    txtInvQty.Text = string.Empty;
                    txtInvDescp.Text = string.Empty;

                }
                else
                {
                    DataTable Inventory_Ds = (DataTable)Session["AddInventory"];
                    DataRow drow = Inventory_Ds.NewRow();
                    drow["inventoryId"] = inventoryId;
                    drow["inventorName"] = inventorName;
                    drow["invertoryQty"] = invertoryQty;
                    drow["invertoryDescp"] = invertoryDescp;
                    //txtEndDate.Text = Convert.ToDateTime(dr["E_enddate"]).ToString("MM'/'dd'/'yyyy");
                    //string date = Convert.ToDateTime(dr["E_enddate"]).ToString("MM'/'dd'/'yyyy");
                    drow["EventsDate"] = (Convert.ToDateTime(txtStartDate.Text).ToString("MM'/'dd'/'yyyy")).ToString();

                    Inventory_Ds.Rows.Add(drow);
                    //dsinvent.Merge(Inventory_Ds);
                    grdInventory.DataSource = Inventory_Ds;
                    grdInventory.DataBind();

                    ddlInventory.SelectedIndex = 0;
                    txtInvQty.Text = string.Empty;
                    txtInvDescp.Text = string.Empty;
                }
                Label1BalaceInvey.Visible = false;
                lblBalanceInvqty.Visible = false;

            }
            catch (Exception ex)
            {
                Session["AddInventory"] = "";
            }
        }
        protected void gvuser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int i = Convert.ToInt32((e.CommandArgument).ToString());
            DataTable dt = (DataTable)Session["Noti"];
            dt.Rows[i].Delete();
            Session["Noti"] = dt;
            this.gvuser.DataSource = ((DataTable)Session["Noti"]).DefaultView;
            this.gvuser.DataBind();
            dt.AcceptChanges();
        }

        public void InsertInventory()
        {
            try
            {

                if (Session["AddInventory"] != null)
                {

                    DataTable dt = (DataTable)(Session["AddInventory"]);
                    //ddlstartTime.SelectedItem.Text.Trim()=="Select" ? "":ddlstartTime.SelectedItem.Text.Trim());
                    int userid = Convert.ToInt32(Session["userid"].ToString() == "" ? Convert.ToInt32("0") : Convert.ToInt32(Session["userid"].ToString()));
                    //int eventid = Convert.ToInt32(ViewState["Eventid"].ToString() == "" ? Convert.ToInt32("0") : Convert.ToInt32(ViewState["Eventid"].ToString()));
                    int eventid = Convert.ToInt32(Request.QueryString["id"].ToString());
                    //int eventid =0;
                    DataSet ds = new DataSet();

                    ds.Merge(dt);

                    string xmldsInventory = ds.GetXml();
                    SqlCommand cmd = new SqlCommand("prcinsertEventInventory", sqlcon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@xmlInsertEvent", xmldsInventory);
                    cmd.Parameters.AddWithValue("@useridId", userid);
                    cmd.Parameters.AddWithValue("@EventId", eventid);
                    // cmd.Parameters.Add("@invoiceid", SqlDbType.VarChar, 800);
                    // cmd.Parameters["@invoiceid"].Direction = ParameterDirection.Output;
                    sqlcon.Open();
                    int result = (int)cmd.ExecuteNonQuery();
                    //int invoiceid = Convert.ToInt32(cmd.Parameters["@invoiceid"].Value.ToString());
                    // ViewState["invoiceid"] = invoiceid;
                    sqlcon.Close();
                }
                //    }
                //}
            }
            catch { }

        }
        public void InsertNotification()
        {
            try
            {
                if (Session["Noti"] != null)
                {
                    DataTable dt = (DataTable)Session["Noti"];
                    DataSet ds = new DataSet();
                    dt.TableName = "fds";
                    ds.Merge(dt);
                    string xmldsNotification = ds.GetXml();
                    SqlCommand cmd = new SqlCommand("prcinsertNotifivation", sqlcon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@xmlInsertNotificatin", xmldsNotification);
                    cmd.Parameters.AddWithValue("@EventId", Request.QueryString["id"].ToString());

                    sqlcon.Open();
                    int result = (int)cmd.ExecuteNonQuery();

                    sqlcon.Close();
                }
            }
            catch { }
        }
        public int SaveInvoice()
        {
            int invoiceid = 0;
            try
            {
                if (FileUploadInserInvoice.HasFile == true)
                {
                    string ddtime = DateTime.Now.ToString("ddmmyyyyhhmmss");
                    string filename = FileUploadInserInvoice.PostedFile.FileName;
                    string filename1 = FileUploadInserInvoice.PostedFile.FileName;
                    filename = System.IO.Path.GetFileNameWithoutExtension(filename);
                    string path = Server.MapPath("~/invoices/" + filename + ddtime + ".pdf");
                    FileUploadInserInvoice.PostedFile.SaveAs(path);
                    string dsxml = "";
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    dt.Columns.Add("invoiceName");
                    dt.Columns.Add("invoicepath");
                    dt.Columns.Add("remarks");
                    dt.Rows.Add(filename, path, txtInvoiceRemarks.Text.Trim());
                    ds.Merge(dt);
                    dsxml = ds.GetXml();
                    SqlCommand cmd = new SqlCommand("prcaddInvoice", sqlcon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@xmlInvoice", dsxml);
                    cmd.Parameters.Add("@invoiceid", SqlDbType.VarChar, 800);
                    cmd.Parameters["@invoiceid"].Direction = ParameterDirection.Output;
                    sqlcon.Open();
                    cmd.ExecuteNonQuery();
                    invoiceid = Convert.ToInt32(cmd.Parameters["@invoiceid"].Value.ToString());
                    sqlcon.Close();
                    lblErrorInvoice.Visible = true;
                    txtInvoiceRemarks.Text = "";
                    lblErrorInvoice.Text = "File Uploaded Successfully...!!!!";
                    // return invoiceid;
                }
                else
                {
                    lblErrorInvoice.Text = "Please select File to Upload...!!!!";
                }
            }
            catch (Exception ex)
            {
                lblErrorInvoice.Text = ex.Message.ToString();
            }
            return invoiceid;
        }
        [System.Web.Services.WebMethod]
        public static string deleteattacgment(string id)
        {

            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            try
            {
                var results = id.Split(',');
                var newid = results[0].Trim();
                var attachment = results[1];
                string path = getFilePath(newid, attachment);
                System.IO.File.Delete(path);
                SqlCommand cmd = new SqlCommand("prcdeleteattchedfile", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", newid);
                cmd.Parameters.AddWithValue("@value", attachment);
                sqlcon.Open();
                cmd.ExecuteNonQuery();
                sqlcon.Close();

            }
            catch
            {

            }
            return id;
        }

        private static string getFilePath(string newid, string attachment)
        {
            string path1 = "";
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("prcgetfilepath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@newid", newid);
                cmd.Parameters.AddWithValue("@attachment", attachment);
                cmd.Parameters.Add("@msg", SqlDbType.VarChar, 2000);
                cmd.Parameters["@msg"].Direction = ParameterDirection.Output;
                sqlcon.Open();
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                path1 = cmd.Parameters["@msg"].Value.ToString();
            }

            catch { }
            return path1;

        }
        public void dataingridview()
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("Assets");
            //dt.Columns.Add("Start_Date");
            //dt.Columns.Add("End_Date");
            dt.Columns.Add("See_More");

            dr = dt.NewRow();

            dt.Rows.Add(dr);

            GridView1.DataSource = dt;
            GridView1.DataBind();


        }
        public static string infoid;
        [System.Web.Services.WebMethod]
        public static string GetEvents(string query)
        {

            DataSet ds = new DataSet();
            DataSet newds = new DataSet();

            DataTable dt = new DataTable();
            if (dt.Columns.Count == 0)
            {
                dt.Columns.Add("Assets");
                //dt.Columns.Add("Start_Date");
                //dt.Columns.Add("End_Date");
                dt.Columns.Add("See_More");
            }

            var results = query.Split(',');
            var gid = results[0].Split('#');
            int var = gid.Length - 1;

            var id = results[0].Trim();
            string sdate1 = results[1];
            string edate1 = results[2];
            infoid = id.ToString();

            for (int i = 0; i <= var - 1; i++)
            {

                int iddd = Convert.ToInt32(gid[i].ToString());

                SqlConnection sqlcon1 = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
                sqlcon1.Open();
                //SqlCommand cmd = new SqlCommand("select CONVERT(varchar(10), E_startdate,101) as E_startdate,CONVERT(varchar(10), E_enddate,101) as E_enddate ,E_grounds from events where E_grounds like '%" + id + "%' and CONVERT(varchar(10), E_startdate,101)  between '" + sdate1 + "' and '" + edate1 + "' or CONVERT(varchar(10), E_enddate,101)  between '" + sdate1 + "' and '" + edate1 + "' and E_grounds like '%" + id + "%'", sqlcon1);
                SqlCommand cmd = new SqlCommand("prcgetassertInfo", sqlcon1);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@groundid", iddd);
                cmd.Parameters.AddWithValue("@sdate1", sdate1);
                cmd.Parameters.AddWithValue("@edate1", edate1);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);

                string MinValue = Convert.ToString(ds.Tables[0].Compute("MIN([E_startdate])", ""));
                string mdate = MinValue.ToString() + "&nbsp";

                string MaxValue = Convert.ToString(ds.Tables[0].Compute("MAX([E_enddate])", ""));
                string mxate = MaxValue.ToString();
                string locName = getlocationName(Convert.ToString(iddd));
                DataRow[] row = ds.Tables[0].Select("E_grounds LIKE '%" + gid[i].ToString() + "%'");




                if (!string.IsNullOrEmpty(mdate) && !string.IsNullOrEmpty(mxate) && row.Length > 0)
                {
                    //dt.Rows.Add("<span style='color:blue;'>" + locName + " " + "Is Already Booked Between" + "</span>", sdate1 + "<span style='color:blue;'>&nbsp;" + "&nbsp;And&nbsp;" + "</span>" + " ", edate1 + "&nbsp;", iddd);
                    dt.Rows.Add("<span style='color:blue;'>" + locName + " " + "Is Already Booked Between &nbsp;" + "</span>", sdate1 + "<span style='color:blue;'>&nbsp;" + "&nbsp;And&nbsp;" + "</span>", edate1, iddd);
                    //dt.Rows.Add("<span style='color:blue;'>" + locName + " " + "is already booked on &nbsp;" + "</span>", mdate + "<span style='color:blue;'>" + "to &nbsp;" + "</span>" + " ", mxate, id);
                }



                sqlcon1.Close();


            }
            if (dt.Rows.Count == 0)
            {
                dt.Rows.Add();
                string val = dt.Rows[0]["Assets"].ToString();
                if (!string.IsNullOrEmpty(val))
                {
                    newds.Merge(dt);
                    query = newds.GetXml();
                }
                else
                {
                    query = "false";
                }

            }
            else
            {
                newds.Merge(dt);
                query = newds.GetXml();
            }
            return query;

        }
        private void BindDummyRow()
        {

            dummy.Columns.Clear();
            dummy.Columns.Add("Assets");
            dummy.Columns.Add("Start_Date");
            dummy.Columns.Add("End_Date");
            dummy.Columns.Add("See_More");
            dummy.Rows.Add();
            GridView1.DataSource = dummy;
            GridView1.DataBind();



        }
        private void FillTableRow()
        {

            FillTabledummy.Columns.Clear();
            FillTabledummy.Columns.Add("Title");
            //FillTabledummy.Columns.Add("Event_Title");
            FillTabledummy.Columns.Add("StartDate");
            FillTabledummy.Columns.Add("EndDate");
            FillTabledummy.Columns.Add("StartTime");
            FillTabledummy.Columns.Add("EndTime");
            FillTabledummy.Columns.Add("Status");

            FillTabledummy.Rows.Add();
            GridView2.DataSource = FillTabledummy;
            GridView2.DataBind();

        }
        [System.Web.Services.WebMethod]
        public static string FillInfoTable(string query)
        {
            DataSet fds = new DataSet();
            SqlConnection sqlcon1 = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            var results = query.Split(',');
            var id = results[0].Trim();
            var vid = results[0].Trim();
            string sdate1 = results[1];
            string edate1 = results[2];


            SqlCommand cmd1 = new SqlCommand("Select checkbox_location from chk_location where checkbox_id= " + id + "", sqlcon1);
            SqlDataAdapter adm = new SqlDataAdapter(cmd1);
            DataTable dtinfo = new DataTable();
            adm.Fill(dtinfo);
            id = dtinfo.Rows[0]["checkbox_location"].ToString();
            SqlCommand cmd = new SqlCommand("select id AS Title,E_grounds,Etitle as 'Event_Title', convert(varchar(10), E_startdate,101) as StartDate ,convert(varchar(10), E_enddate,101) as EndDate,StartTime,EndTime,case status when 1 then 'Confirm' when 0 then 'Hold' end as status from [dbo].[events] where E_startdate >='" + sdate1 + "' and E_enddate <= '" + edate1 + "' or '" + sdate1 + "' between E_startdate and E_enddate or '" + edate1 + "' between  E_startdate and E_enddate  and  E_grounds  like '%" + vid + "%' order by StartDate", sqlcon1);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            ad.Fill(ds);

            DataRow[] row = ds.Tables[0].Select("E_grounds LIKE '%" + vid + "%'");
            if (row.Length > 0)
            {
                DataTable dsadd = new DataTable();
                dsadd.Columns.Clear();
                dsadd.Columns.Add("Title");
                //dsadd.Columns.Add("Event_Title");
                dsadd.Columns.Add("StartDate");
                dsadd.Columns.Add("EndDate");
                dsadd.Columns.Add("StartTime");
                dsadd.Columns.Add("EndTime");
                dsadd.Columns.Add("Status");

                dsadd = row.CopyToDataTable();
                dsadd.TableName = "fds";
                fds.Merge(dsadd);
                query = fds.GetXml();


            }
            return query;
        }
        //public void updateEvent1(EventsDetails objEventsDetails)
        //{

        //    try
        //    {


        //        SqlCommand cmd = new SqlCommand("sp_UpdateEvent", sqlcon);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@id", objEventsDetails.ID);
        //        cmd.Parameters.AddWithValue("@etitle", objEventsDetails.Etitle);
        //        cmd.Parameters.AddWithValue("@E_startdate", objEventsDetails.E_Startdate);

        //        cmd.Parameters.AddWithValue("@E_enddate", objEventsDetails.E_Enddate);


        //        cmd.Parameters.AddWithValue("@E_time", objEventsDetails.E_Time);


        //        cmd.Parameters.AddWithValue("@E_grounds", objEventsDetails.E_Grounds);

        //        cmd.Parameters.AddWithValue("@E_notification1", objEventsDetails.E_Notification1);
        //        cmd.Parameters.AddWithValue("@E_notification2", objEventsDetails.E_Notification2);
        //        cmd.Parameters.AddWithValue("@E_notification3", objEventsDetails.E_Notification3);





        //        cmd.Parameters.AddWithValue("@rcmain", objEventsDetails.RCmain);
        //        cmd.Parameters.AddWithValue("@rccerti", objEventsDetails.RCcerti);
        //        cmd.Parameters.AddWithValue("@rclay", objEventsDetails.RClay);
        //        cmd.Parameters.AddWithValue("@rcmaindate", objEventsDetails.RCmaindate);
        //        cmd.Parameters.AddWithValue("@rccertidate", objEventsDetails.RCcertidate);
        //        cmd.Parameters.AddWithValue("@rclaydate", objEventsDetails.RClaydate);

        //        cmd.Parameters.AddWithValue("@RCOpBalRecived", objEventsDetails.RCOpBalReciveD);

        //        cmd.Parameters.AddWithValue("@ebalancerecive", objEventsDetails.EBalance);
        //        cmd.Parameters.AddWithValue("@Ebalance", objEventsDetails.EBalance);

        //        cmd.Parameters.AddWithValue("@attachmentid", objEventsDetails.Attachmentid);





        //        // cmd.Parameters.AddWithValue("@idd", lblpid.Value);
        //        cmd.Parameters.AddWithValue("@Fname", objEventsDetails.FName);
        //        cmd.Parameters.AddWithValue("@Lname", objEventsDetails.LName);
        //        cmd.Parameters.AddWithValue("@email", objEventsDetails.EMail);
        //        cmd.Parameters.AddWithValue("@phone", objEventsDetails.PHone);
        //        cmd.Parameters.AddWithValue("@status", objEventsDetails.STatus);

        //        cmd.Parameters.AddWithValue("@attachment1", objEventsDetails.Attachment1);
        //        cmd.Parameters.AddWithValue("@attachment2", objEventsDetails.Attachment2);
        //        cmd.Parameters.AddWithValue("@attachment3", objEventsDetails.Attachment3);
        //        cmd.Parameters.AddWithValue("@attachment4", objEventsDetails.Attachment4);
        //        cmd.Parameters.AddWithValue("@attachment5", objEventsDetails.Attachment5);
        //        cmd.Parameters.AddWithValue("@curr", objEventsDetails.CUrr);
        //        cmd.Parameters.AddWithValue("@tamt", objEventsDetails.TAmt);
        //        cmd.Parameters.AddWithValue("@damt", objEventsDetails.DAmt);





        //        cmd.Parameters.AddWithValue("@bamt", objEventsDetails.BAmt);
        //        cmd.Parameters.AddWithValue("@Notes", objEventsDetails.NoTes);

        //        cmd.Parameters.AddWithValue("@chk_promoter", objEventsDetails.Chk_Promoter);

        //        cmd.Parameters.AddWithValue("@idd", objEventsDetails.iDD);



        //        cmd.Parameters.AddWithValue("@startTime", objEventsDetails.StartTime);
        //        cmd.Parameters.AddWithValue("@EndTime", objEventsDetails.E_Time);
        //        cmd.Parameters.AddWithValue("@UpdateId", objEventsDetails.UPDATEId);


        //        sqlcon.Open();
        //        cmd.ExecuteNonQuery();
        //        sqlcon.Close();

        //    }
        //    catch (Exception ex)
        //    {

        //    }

        //}
    }

}