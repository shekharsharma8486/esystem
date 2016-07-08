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
using System.Collections;
namespace EbookingWebProject
{
    public partial class AddEvent1 : System.Web.UI.Page
    {
        string emailid;
        string des;
        string eventtitle;
        string startdate;
        string enddate;
        int userid;
        public static DataTable dummy = new DataTable();
        public static DataTable FillTabledummy = new DataTable();
        MailMaster objMailMaster = new MailMaster();

        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        [System.Web.Services.WebMethod]

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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session["login"] != null)
                {
                    if (!string.IsNullOrEmpty(Session["login"].ToString()) && Session["login"].ToString() == "Login")
                    {

                        if (!IsPostBack)
                        {
                            //txtEndDate.Enabled = false;
                            dataingridview();
                            FillTableRow();
                            //  BindDummyRow();
                            GetTimeIntervals();

                            CalendarExtender1.StartDate = DateTime.Now;
                            CalendarExtender2.StartDate = DateTime.Now;
                            CalendarExtender4.StartDate = DateTime.Now;
                            CalendarExtender5.StartDate = DateTime.Now;
                            CalendarExtender6.StartDate = DateTime.Now;
                            CalendarExtender7.StartDate = DateTime.Now;
                            CalendarExtender8.StartDate = DateTime.Now;



                            // bookingInfo();
                            //updatetop3();
                            Session["Noti"] = null;
                            Session["AddInventory"] = null;
                            userid = Convert.ToInt32(Session["userid"].ToString());


                            fillusersinddl();
                            getuser();
                            attachfile();
                            ddlInventoryBind();






                            SqlCommand cmd = new SqlCommand("select distinct checkbox_id,checkbox_location from chk_location where ActiveFlag=1", sqlcon);
                            sqlcon.Open();
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataSet ds = new DataSet();
                            sqlcon.Close();
                            da.Fill(ds);
                            if (ds.Tables[0].Rows.Count != 0)
                            {
                                chklistgrnd.DataSource = ds;
                                chklistgrnd.DataTextField = "checkbox_location";
                                chklistgrnd.DataValueField = "checkbox_id";
                                chklistgrnd.DataBind();
                            }



                            else
                            {
                                //Response.Write("No Results found");

                            }


                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
                // checkc();
            }

            catch (Exception ex)
            {
                // Response.Write(ex);
                Response.Redirect("Login.aspx", false);
            }


        }
        public void fillusersinddl()
        {

            SqlCommand cmd = new SqlCommand("Select id, (fname +' '+ lname+ '  (' + email +')') as fullname,email from admin", sqlcon);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                ddluser.DataSource = ds;
                ddluser.DataTextField = "fullname";
                ddluser.DataValueField = "id";
                ddluser.DataBind();
            }

        }
        public void ddlInventoryBind()
        {

            SqlCommand cmd = new SqlCommand("select id,itemname,remarks from tbl_inventory", sqlcon);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                ddlInventory.DataSource = ds;
                ddlInventory.DataTextField = "itemname";
                ddlInventory.DataValueField = "id";
                ddlInventory.DataBind();
            }


        }
        public void getuser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select id, ( fname+' '+ lname) as fullname from promoters", sqlcon);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    ddlpromoter.DataSource = ds;
                    ddlpromoter.DataTextField = "fullname";
                    ddlpromoter.DataValueField = "id";
                    ddlpromoter.DataBind();
                }

            }
            catch
            {

            }
        }
        #region Attchment code
        public void attachfile()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select id, invoicename from tbl_invoice", sqlcon);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    ddlattach.DataSource = ds;
                    ddlattach.DataTextField = "invoicename";
                    ddlattach.DataValueField = "id";
                    ddlattach.DataBind();
                }

            }
            catch
            {

            }
        }
        public string attachment1()
        {
            string path = "";

            if (attach1.HasFile == true)
            {
                path = Server.MapPath("~/attach1/" + attach1.PostedFile.FileName);

                attach1.PostedFile.SaveAs(path);


            }
            return path;

        }
        public string attachment2()
        {
            string path = "";

            if (attach2.HasFile == true)
            {
                path = Server.MapPath("~/attach2/" + attach2.PostedFile.FileName);
                attach2.PostedFile.SaveAs(path);

            }
            return path;
        }
        public string attachment3()
        {
            string path = "";

            if (attach3.HasFile == true)
            {
                path = Server.MapPath("~/attach3/" + attach3.PostedFile.FileName);

                attach3.PostedFile.SaveAs(path);

            }
            return path;
        }
        public string attachment4()
        {
            string path = "";

            if (attach4.HasFile == true)
            {
                path = Server.MapPath("~/attach4/" + attach4.PostedFile.FileName);
                attach4.PostedFile.SaveAs(path);

            }
            return path;
        }
        //public string attachment5()
        //{
        //    string path = "";

        //    if (attach5.HasFile == true)
        //    {
        //        path = Server.MapPath("~/attach5/" + attach5.PostedFile.FileName);
        //        attach5.PostedFile.SaveAs(path);

        //    }
        //    return path;
        //}
        #endregion
        public string getgroundText()
        {
            string ground = "";

            for (int i = 0; i < chklistgrnd.Items.Count; i++)
            {
                if (chklistgrnd.Items[i].Selected)
                {
                    ground = ground + "," + chklistgrnd.Items[i].Text;
                }

            }

            if (ground != "")
            {
                ground = ground.Remove(0, 1);
            }
            return ground;


        }
        public void insertEvent()
        {
            try
            {

                txtFname.Enabled = true;
                txtLname.Enabled = true;
                txtEmail.Enabled = true;
                txtPhone.Enabled = true;

                SqlCommand cmd = new SqlCommand("sp_InsertEvent", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Etitle", txtETitle.Text.Trim());
                cmd.Parameters.AddWithValue("@E_startdate", txtStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@E_enddate", txtEndDate.Text.Trim());
                cmd.Parameters.AddWithValue("@E_time", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@E_grounds", getground());
                cmd.Parameters.AddWithValue("@idd", lblpid.Value);
                if (rbnAddNewInvoce.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@invoice_attachmentid", lblattachid.Value = Convert.ToString(SaveInvoice()));
                }
                else if (rbnAddExisInvoce.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@invoice_attachmentid", lblattachid.Value);
                }
                else
                {
                    int inviid = 0;
                    cmd.Parameters.AddWithValue("@invoice_attachmentid", inviid);

                }




                cmd.Parameters.AddWithValue("@attachment1", attachment1());
                cmd.Parameters.AddWithValue("@attachment2", attachment2());
                cmd.Parameters.AddWithValue("@attachment3", attachment3());
                cmd.Parameters.AddWithValue("@attachment4", attachment4());
                //cmd.Parameters.AddWithValue("@attachment5", "attachment5()");
                cmd.Parameters.AddWithValue("@attachment5", "");
                cmd.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim());
                cmd.Parameters.AddWithValue("@E_Notification1", 0);
                cmd.Parameters.AddWithValue("@E_Notification2", 0);
                cmd.Parameters.AddWithValue("@E_Notification3", 0);
                cmd.Parameters.AddWithValue("@RCcontract", rdMainEx.Checked);
                cmd.Parameters.AddWithValue("@RCCertificate", rdInsurance.Checked);

                cmd.Parameters.AddWithValue("@RCLayout", rdlay.Checked);



                cmd.Parameters.AddWithValue("@RCcontractdate", txtRDate1.Text.Length == 0 ? DBNull.Value.ToString() : txtRDate1.Text);
                cmd.Parameters.AddWithValue("@RCCertificateDate", txtRDate2.Text.Length == 0 ? DBNull.Value.ToString() : txtRDate2.Text);
                cmd.Parameters.AddWithValue("@RCLayoutDate", txtRDate3.Text.Length == 0 ? DBNull.Value.ToString() : txtRDate3.Text);
                cmd.Parameters.AddWithValue("@RCOpBalRecived", txtRDate4.Text.Length == 0 ? DBNull.Value.ToString() : txtRDate4.Text);

                //cmd.Parameters.AddWithValue("@balanceRecievedAmt", txtOBR.Text);
                cmd.Parameters.AddWithValue("@balanceRecievedAmt", hdnbamt.Value);
                cmd.Parameters.AddWithValue("@balanceRecieved", rdReminder.Checked);
                cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedValue);

                cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
                cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text);

                cmd.Parameters.AddWithValue("@curr", ddlcurr.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@tamt", txttamt.Text);//total amt
                cmd.Parameters.AddWithValue("@damt", txtdamt.Text);
                cmd.Parameters.AddWithValue("@bamt", hdnbamt.Value);
                cmd.Parameters.Add("@EventId", SqlDbType.VarChar, 800);
                cmd.Parameters["@EventId"].Direction = ParameterDirection.Output;
                if (chaddnewpro.Checked == true)
                {
                    if ((!string.IsNullOrEmpty(txtFname.Text.Trim())) || (!string.IsNullOrEmpty(txtLname.Text.Trim())) || (!string.IsNullOrEmpty(txtEmail.Text.Trim())))
                    {
                        cmd.Parameters.AddWithValue("@chk_promoter", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@chk_promoter", "0");
                    }

                }
                else
                {
                    cmd.Parameters.AddWithValue("@chk_promoter", "0");

                }
                cmd.Parameters.AddWithValue("@startTime", ddlstartTime.SelectedItem.Text.Trim() == "Select" ? "" : ddlstartTime.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@EndTime", ddlEndTime.SelectedItem.Text.Trim() == "Select" ? "" : ddlEndTime.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@EventCreatedBy", Convert.ToInt32(Session["userid"].ToString()));

                sqlcon.Open();
                int modified = Convert.ToInt32(cmd.ExecuteScalar());
                int Eventid = Convert.ToInt32(cmd.Parameters["@EventId"].Value.ToString());
                ViewState["Eventid"] = Eventid;

                sqlcon.Close();
                //below this will insert in inventory
                InsertInventory();
                if (modified > 0)
                {
                    #region Below This Function to send Email to  Event Owner
                    string cont = "MailToId=1";
                    DataRow[] rows;
                    rows = ClassMailPermission.dtloginPermission.Select(cont);
                    if (rows.Length > 0 && rows != null)
                    {
                        bool chekmail = Convert.ToBoolean(rows[0]["chkMailSend"].ToString());
                        if (chekmail == true)
                        {
                            string subjectinfo = rows[0]["subject"].ToString();
                            string bodymsg = rows[0]["bodymsg"].ToString();
                            if (Session["Loginemail"].ToString() != "test")
                            {
                                objMailMaster.MasterMailSetting(Session["AdminName"].ToString(), Session["Loginemail"].ToString(), txtFname.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), ddlstartTime.SelectedItem.Text, ddlEndTime.SelectedItem.Text, getgroundText(), subjectinfo, bodymsg, ddlstatus.SelectedItem.Text, txtNotes.Text.Trim(), txtnotidate.Text.Trim());
                            }
                        }

                    }

                    //objMailMaster.SendMailToEventOwner(txtFname.Text.Trim() + " " + txtLname.Text.Trim(), txtEmail.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), getgroundText());

                    #endregion
                    if (chkMailClint.Checked == true)
                    {
                        #region Below This Function to send Email to  Client
                        //objMailMaster.SendMailToEventClient(txtFname.Text.Trim() + " " + txtLname.Text.Trim(), txtEmail.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), getgroundText());
                        string cont2 = "MailToId=2";
                        DataRow[] rows2;
                        rows2 = ClassMailPermission.dtloginPermission.Select(cont2);
                        if (rows2.Length > 0 && rows2 != null)
                        {
                            bool chekmail = Convert.ToBoolean(rows2[0]["chkMailSend"].ToString());
                            if (chekmail == true)
                            {
                                string subjectinfo = rows2[0]["subject"].ToString();
                                string bodymsg = rows2[0]["bodymsg"].ToString();
                                objMailMaster.MasterMailSetting(txtFname.Text.Trim(), txtEmail.Text.Trim(), txtFname.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), ddlstartTime.SelectedItem.Text, ddlEndTime.SelectedItem.Text, getgroundText(), subjectinfo, bodymsg, ddlstatus.SelectedItem.Text, "", txtnotidate.Text.Trim());
                            }
                        #endregion
                        }
                    }
                }

                #region below this will send a mail to notify on save booking
                foreach (GridViewRow gv in gvuser.Rows)
                {
                    Label lbluserid = (Label)gv.FindControl("lbluserid");
                    Label lbldesc = (Label)gv.FindControl("lbldesc");

                    Label lbldate = (Label)gv.FindControl("lbldate");


                    SqlCommand cmdnoti = new SqlCommand("Insert into tbl_notifications values(@eid,@uid,@desc,@dt1)", sqlcon);
                    cmdnoti.Parameters.AddWithValue("@eid", modified);
                    cmdnoti.Parameters.AddWithValue("@uid", Convert.ToInt32(lbluserid.Text));
                    cmdnoti.Parameters.AddWithValue("@desc", lbldesc.Text);
                    cmdnoti.Parameters.AddWithValue("@dt1", Convert.ToDateTime(lbldate.Text));
                    sqlcon.Open();
                    cmdnoti.ExecuteNonQuery();
                    sqlcon.Close();


                    string mailid = "";
                    string name = "";
                    if (!string.IsNullOrEmpty(lbluserid.Text))
                    {
                        SqlCommand cmdd = new SqlCommand("select email,CONCAT(fname,+' '+lname)as name from admin where id = " + lbluserid.Text + "", sqlcon);
                        sqlcon.Open();
                        SqlDataReader dr = cmdd.ExecuteReader();
                        if (dr.Read())
                        {
                            mailid = dr["email"].ToString();
                            name = dr["name"].ToString();
                        }
                        dr.Close();
                        sqlcon.Close();
                        if (!string.IsNullOrEmpty(mailid))
                        {
                            string cont = "MailToId=3";
                            DataRow[] rows;
                            rows = ClassMailPermission.dtloginPermission.Select(cont);
                            //sendmail(mailid, lbldesc.Text);
                            if (rows.Length > 0 && rows != null)
                            {
                                bool chekmail = Convert.ToBoolean(rows[0]["chkMailSend"].ToString());
                                if (chekmail == true)
                                {
                                    string subjectinfo = rows[0]["subject"].ToString();
                                    string bodymsg = rows[0]["bodymsg"].ToString();
                                    objMailMaster.MasterMailSetting(name, mailid, txtFname.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), ddlstartTime.SelectedItem.Text, ddlEndTime.SelectedItem.Text, getgroundText(), subjectinfo, bodymsg, ddlstatus.SelectedItem.Text, lbldesc.Text, lbldate.Text);
                                }
                            }
                        }
                    }
                }

                #endregion


                //Response.Redirect("~/Home.aspx", false);
               
                Response.Redirect("Details.aspx?id=" + Convert.ToInt32(ViewState["Eventid"].ToString()) + "", false);
            }
            catch (Exception ex)
            {


            }
        }
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

            if (ground != "")
            {
                ground = ground.Remove(0, 1);
            }
            return ground;


        }
        protected void btndone1_Click(object sender, EventArgs e)
        {

            if (hdnpromsg.Value == "1")
            {
                lblpromsg.Text = "Client Already Exists :-" + " " + txtFname.Text + "," + txtLname.Text + "," + txtEmail.Text;
                return;
            }
            else
            {
                insertEvent();
            }
        }
        [System.Web.Services.WebMethod]
        public static string getpromoterdata(string id)
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
            //if (hdnnoti.Value == "0")
            //{
            if (Session["Noti"] == null)
            {
                DataTable Noti_Ds = new DataTable();
                Noti_Ds = new DataTable();
                Noti_Ds.Columns.Add("User");
                Noti_Ds.Columns.Add("Description");
                Noti_Ds.Columns.Add("Date");
                Noti_Ds.Columns.Add("Id");
                Noti_Ds.Columns.Add("email");

                Session["Noti"] = Noti_Ds;
                DataRow drow = Noti_Ds.NewRow();
                drow[0] = users;
                drow[1] = noti_text;
                drow[2] = txtnotidate.Text.Trim();
                // drow[2] = DateTime.Now.ToString();
                //drow[2] = noti_textdate;
                drow[3] = userid;
                Noti_Ds.Rows.Add(drow);

                gvuser.DataSource = Noti_Ds;
                gvuser.DataBind();
            }
            else
            {
                DataTable Noti_Ds = (DataTable)Session["Noti"];
                DataRow drow = Noti_Ds.NewRow();
                drow[0] = users;
                drow[1] = noti_text;
                drow[2] = txtnotidate.Text.Trim();
                // drow[2] = DateTime.Now.ToString();
                //drow[2] = noti_textdate;
                drow[3] = userid;

                Noti_Ds.Rows.Add(drow);

                gvuser.DataSource = Noti_Ds;
                gvuser.DataBind();


            }
            ddluser.SelectedIndex = 0;
            txtnoti.Text = string.Empty;
            txtnotidate.Text = string.Empty;

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
                    //System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "document.getElementById('" + divinvoice.ClientID + "').style.display='block';", true);

                }


            }
            catch (Exception ex)
            {
                lblErrorInvoice.Text = ex.Message.ToString();

            }
            return invoiceid;
        }
        protected void BtnAddInvoice_Click(object sender, EventArgs e)
        {
            SaveInvoice();
            ddlattach.Items.Clear();
            ddlattach.Items.Insert(0, "Select File");
            ddlattach.Focus();
            attachfile();



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



                    Session["AddInventory"] = Inventory_Ds;
                    DataRow drow = Inventory_Ds.NewRow();
                    drow[0] = inventoryId;
                    drow[1] = inventorName;
                    drow[2] = invertoryQty;
                    drow[3] = invertoryDescp;
                    drow[4] = txtStartDate.Text.Trim();

                    Inventory_Ds.Rows.Add(drow);

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
                    drow[0] = inventoryId;
                    drow[1] = inventorName;
                    drow[2] = invertoryQty;
                    drow[3] = invertoryDescp;
                    drow[4] = txtStartDate.Text.Trim();

                    Inventory_Ds.Rows.Add(drow);

                    grdInventory.DataSource = Inventory_Ds;
                    grdInventory.DataBind();

                    ddlInventory.SelectedIndex = 0;
                    txtInvQty.Text = string.Empty;
                    txtInvDescp.Text = string.Empty;
                }
                Label1BalaceInvey.Visible = false;
                lblBalanceInvqty.Visible = false;
                //InsertInventory();
            }
            catch (Exception ex)
            {
                Session["AddInventory"] = "";
            }
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
        public void InsertInventory()
        {
            try
            {
                //if (!string.IsNullOrEmpty((Session["AddInventory"]).ToString()))
                //{
                //    if (dt.Rows.Count > 0 && dt != null)
                //    {
                if (Session["AddInventory"] != null)
                {

                    DataTable dt = (DataTable)(Session["AddInventory"]);
                    //ddlstartTime.SelectedItem.Text.Trim()=="Select" ? "":ddlstartTime.SelectedItem.Text.Trim());
                    int userid = Convert.ToInt32(Session["userid"].ToString() == "" ? Convert.ToInt32("0") : Convert.ToInt32(Session["userid"].ToString()));
                    int eventid = Convert.ToInt32(ViewState["Eventid"].ToString() == "" ? Convert.ToInt32("0") : Convert.ToInt32(ViewState["Eventid"].ToString()));
                    //int eventid =0;
                    DataSet ds = new DataSet();

                    ds.Merge(dt);

                    string xmldsInventory = ds.GetXml();
                    SqlCommand cmd = new SqlCommand("prcinsertEventInventory", sqlcon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@xmlInsertEvent", xmldsInventory);
                    cmd.Parameters.AddWithValue("@useridId", userid);
                    cmd.Parameters.AddWithValue("@EventId", eventid);
                    sqlcon.Open();
                    int result = (int)cmd.ExecuteNonQuery();
                    sqlcon.Close();
                }
                //    }
                //}
            }
            catch { }

        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = "";
            GridView1.DataBind();

            Session["Noti"] = null;
            Session["AddInventory"] = null;

            DataTable Inventory_Ds = (DataTable)Session["AddInventory"];
            grdInventory.DataSource = Inventory_Ds;
            grdInventory.DataBind();
            DataTable Noti = (DataTable)Session["Noti"];
            gvuser.DataSource = Noti;
            gvuser.DataBind();
            //grdInventory.DataBind();
            //if (grdInventory.Rows.Count > 0)
            //{
                //grdInventory.DataSource = "";
                //grdInventory.DataBind();
           // }
            //if (gvuser.Rows.Count > 0)
            //{
                //gvuser.DataSource = "";
                //gvuser.DataBind();
         //   }


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
                    //dt.Rows.Add("<span style='color:blue;'>" + locName + "" + "&nbsp;Is Already Booked Between&nbsp;" + "</span>", sdate1 + "<span style='color:blue;'>" + "&nbsp;And&nbsp;" + "</span>", edate1, iddd);
                    dt.Rows.Add("<span style='color:blue;'>" + locName + "" + "&nbsp;Is Already Booked &nbsp;", iddd);

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
            //dummy.Columns.Add("Start_Date");
            //dummy.Columns.Add("End_Date");
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
            SqlCommand cmd = new SqlCommand("select id AS Title,E_grounds,Etitle as 'Event_Title', convert(varchar(10), E_startdate,101) as StartDate ,convert(varchar(10), E_enddate,101) as EndDate,StartTime,EndTime,case status when 1 then 'Confirm' when 2 then 'Hold'  when 0 then '' end as Status from [dbo].[events] where E_startdate >='" + sdate1 + "' and E_enddate <= '" + edate1 + "' or '" + sdate1 + "' between E_startdate and E_enddate or '" + edate1 + "' between  E_startdate and E_enddate  and  E_grounds  like '%" + vid + "%' order by StartDate", sqlcon1);
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

    }
}