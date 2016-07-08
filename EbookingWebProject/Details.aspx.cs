using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace EbookingWebProject
{
    public partial class Details1 : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        string grounds;
        protected void Page_Load(object sender, EventArgs e)
        {

            int userid = Convert.ToInt32(Session["userid"]);
            if (userid != 0)
            {

                if (!IsPostBack)
                {
                    try
                    {

                        string id = Request.QueryString["id"].ToString();
                        lblid.Text = id;

                        if (!string.IsNullOrEmpty(id))
                        {
                            filldetails(lblid.Text);
                            fillInventory();//this will fill the inventory grid
                           
                        }
                        else
                        {
                            Response.Redirect("Login.aspx", false);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Response.Write(ex);
                        Response.Redirect("Login.aspx", false);
                    }
                }
            }
            else
            {
                string AdminName = Request.QueryString["id"].ToString();
                //Session["userid"] = dr["id"].ToString();
                //Session["role"] = dr["userrole"].ToString();
                //Session["Loginemail"] = dr["email"].ToString();
                //Session["AdminName"] = dr["AdminName"].ToString();
                //Session["login"] = "Login";
                fillsession();
                //Response.Redirect("Login.aspx", false);
                filldetails(AdminName);
            }
        }
        public void fillsession()
        {
            try
            {
                string email = Request.QueryString["email"].ToString();
                string pass = Request.QueryString["pwd"].ToString();
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand("select id,email,pass,userrole,concat(fname,' ',lname) as AdminName from admin where email = '" + email + "' and pass = '" + pass + "' ", sqlcon);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                ad.Fill(ds);
                Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
                Session["role"] = ds.Tables[0].Rows[0]["userrole"].ToString();
                Session["Loginemail"] = ds.Tables[0].Rows[0]["email"].ToString();
                Session["AdminName"] = ds.Tables[0].Rows[0]["AdminName"].ToString();
                Session["login"] = "Login";

            }
            catch
            {


            }
        }
        public void filldetails(string id)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("sp_Getdata", sqlcon);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.CommandType = CommandType.StoredProcedure;

                sqlcon.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {

                    DateTime test = Convert.ToDateTime(dr["E_startdate"].ToString());

                    //lblmaindate.Text = test.ToString("MMMM") + " " + test.ToString("yyyy");
                    lblid.Text = dr["eventid"].ToString();
                    lblstatus.Text = dr["status"].ToString();

                    if (lblstatus.Text == "1")
                    {
                        lblstatus.Text = "Confirmed";
                        lblstatus.ForeColor = System.Drawing.Color.Green;
                        lblClientConfirm.Text = "Confirmed";
                        lblClientConfirm.ForeColor = System.Drawing.Color.Green;

                    }
                    else if (lblstatus.Text == "2")
                    {
                        lblstatus.Text = "Hold";
                        lblstatus.ForeColor = System.Drawing.Color.Red;
                        lblClientConfirm.Text = "Hold";
                        lblClientConfirm.ForeColor = System.Drawing.Color.Red;

                    }
                    else
                    {
                        lblstatus.Text = "";
                        lblstatus.ForeColor = System.Drawing.Color.Gray;
                        lblClientConfirm.Text = "";
                        lblClientConfirm.ForeColor = System.Drawing.Color.Gray;

                    }

                    grounds = dr["E_grounds"].ToString();

                    lbltitle.Text = dr["Etitle"].ToString();
                    lblSdate.Text = dr["E_startdate"].ToString().Replace("12:00:00 AM", "");
                    lblEdate.Text = dr["E_enddate"].ToString().Replace("12:00:00 AM", "");
                    lblTime.Text = dr["E_time"].ToString();
                    //= dr["E_grounds"].ToString();
                    lblNotes.Text = dr["Notes"].ToString();
                    //lblENotes.Text = dr["Notes"].ToString();

                    //lblnoti1.Text = dr["ad1fname"].ToString() + " " + dr["ad1lname"].ToString() + "(" + dr["ad1email"].ToString() + ")";
                    //lblnoti2.Text = dr["ad2fname"].ToString() + " " + dr["ad2lname"].ToString() + "(" + dr["ad2email"].ToString() + ")";
                    //lblnoti3.Text = dr["ad3fname"].ToString() + " " + dr["ad3lname"].ToString() + "(" + dr["ad3email"].ToString() + ")";


                    //lblnoti1.Text = lblnoti1.Text.Replace("()", "");
                    //lblnoti2.Text = lblnoti2.Text.Replace("()", "");
                    //lblnoti3.Text = lblnoti3.Text.Replace("()", "");


                   // chkDepost.Checked = Convert.ToBoolean(dr["RCcontract"].ToString());
                    //chkInsurance.Checked = Convert.ToBoolean(dr["RCCertificate"].ToString());
                    //chkLayout.Checked = Convert.ToBoolean(dr["RCLayout"].ToString());
                    //chkOPB.Checked = Convert.ToBoolean(dr["balanceRecieved"].ToString());

                    //lblattach1.Text = Path.GetFileName(dr["attachment1"].ToString());
                    //lblattach1.Text = dr["attachment1"].ToString();

                    if (!string.IsNullOrEmpty(dr["attachment1"].ToString()))
                    {
                        lnkattch1.CommandArgument = dr["attachment1"].ToString();
                        lnkattch1.Text = Path.GetFileName(dr["attachment1"].ToString());
                    }
                    if (!string.IsNullOrEmpty(dr["attachment2"].ToString()))
                    {
                        lnkattch2.CommandArgument = dr["attachment2"].ToString();
                        lnkattch2.Text = Path.GetFileName(dr["attachment2"].ToString());
                    }
                    if (!string.IsNullOrEmpty(dr["attachment3"].ToString()))
                    {
                        lnkattch3.CommandArgument = dr["attachment3"].ToString();
                        lnkattch3.Text = Path.GetFileName(dr["attachment3"].ToString());
                    }
                    if (!string.IsNullOrEmpty(dr["attachment4"].ToString()))
                    {
                        lnkattch4.CommandArgument = dr["attachment4"].ToString();
                        lnkattch4.Text = Path.GetFileName(dr["attachment4"].ToString());
                    }
                    //if (!string.IsNullOrEmpty(dr["attachment5"].ToString()))
                    //{
                    //    lnkattch5.CommandArgument = dr["attachment5"].ToString();
                    //    lnkattch5.Text = Path.GetFileName(dr["attachment5"].ToString());
                    //}

                    //HyperLink1.NavigateUrl = dr["attachment1"].ToString();
                    //lblattach2.Text = Path.GetFileName(dr["attachment2"].ToString());
                    //lblattach3.Text = Path.GetFileName(dr["attachment3"].ToString());
                    //lblattach4.Text = Path.GetFileName(dr["attachment4"].ToString());
                    //lblattach5.Text = Path.GetFileName(dr["attachment5"].ToString());


                    //lblcurr.Text = dr["curr"].ToString();
                    lbltamt.Text = dr["tamt"].ToString();
                    lbldamt.Text = dr["damt"].ToString();
                    lblbamt.Text = dr["bamt"].ToString();

                    //= dr["RCMain"].ToString();
                    // = dr["RCCertificate"].ToString();
                    // = dr["RCLayout"].ToString();
                    // = dr["RCMainDate"].ToString();
                    // = dr["RCCertificateDate"].ToString();
                    // = dr["RCLayoutDate"].ToString();
                    // = dr["Ebalance"].ToString();

                    // string filename = dr["aname"].ToString();

                    //lblAttachment.Text = dr["invoicename"].ToString();

                    if (!string.IsNullOrEmpty(dr["invoicepath"].ToString()))
                    {
                        lnkAttachment.Text = dr["invoicepath"].ToString();
                        lnkAttachment.CommandArgument = dr["invoicepath"].ToString();
                        lnkAttachment.Text = Path.GetFileName(dr["invoicepath"].ToString());
                    }



                    lblPname1.Text = dr["Fname"].ToString();
                    lblPname11.Text = dr["Lname"].ToString();
                    lblPEmail2.Text = dr["email"].ToString();
                    lblPPhone3.Text = dr["phone"].ToString();
                    lblstarttime.Text = dr["startTime"].ToString();
                    lblEndTime.Text = dr["EndTime"].ToString();
                    lblEventOwner.Text = dr["EventOwner"].ToString();
                    lblEventCreatedDtae.Text = dr["eventCreatedDate"].ToString();
                    LBLEventUpdatedDate.Text = dr["EventUpdatedDate"].ToString();
                    lblEventUpdatedBy.Text = dr["EventOwnerUpdatedBy"].ToString();
                    
                    lblcurr.Text=  "( In "+dr["curr"].ToString()+ ")";

                    dr.Close();
                    sqlcon.Close();
                    fillgrndsrdo();
                    fillnotification();
                }

            }
            catch
            {

                Response.Write("Event Details Does Not Exists.");
                Response.Redirect("Home.aspx", false);
            }

        }
        protected void attachment1(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            filedownload(filePath);
        }
        protected void attachment2(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            filedownload(filePath);
        }
        protected void attachment3(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            filedownload(filePath);
        }
        protected void attachment4(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            filedownload(filePath);
        }
        protected void attachment5(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            filedownload(filePath);
        }
        protected void invoiceAttachment(object sender, EventArgs e)
        {
            MemoryStream memoryStream = new MemoryStream();
            string filePath = (sender as LinkButton).CommandArgument;
            byte[] bytes = memoryStream.ToArray();
            memoryStream.Close();
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.ContentType = "application/pdf";
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
            Response.Close();
        }

        public void filedownload(string pth)
        {
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(pth));
            Response.WriteFile(pth);
            Response.End();
        }


        public void fillgrndsrdo()
        {
            try
            {
                string[] items = grounds.Split(',');


                for (int j = 0; j < items.Length; j++)
                {
                    sqlcon.Open();

                    SqlCommand cmd = new SqlCommand("Select checkbox_location from chk_location where checkbox_id= " + items[j].ToString() + "", sqlcon);
                    SqlDataReader dr;

                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lblLocation.Text = lblLocation.Text + "," + dr["checkbox_location"].ToString();
                    }
                    dr.Close();
                    sqlcon.Close();
                }
                string val = lblLocation.Text;
                val = val.Remove(0, 1);
                lblLocation.Text = val;
            }
            catch
            {

            }
        }
        public void fillnotification()
        {
            SqlCommand cmd = new SqlCommand(" select n.*, (a.fname+ ' '+ a.lname) as usr,convert(varchar(10), n.dt, 101) as dtt from tbl_notifications n left join events e on e.id  = n.eventid left join  admin a on a.id = n.userid where e.id = " + Request.QueryString["id"].ToString() + "", sqlcon);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            sqlcon.Open();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                gvuser.DataSource = ds;
                gvuser.DataBind();
               
            }
            sqlcon.Close();
        }
        public void fillInventory()
        {
            SqlCommand cmd = new SqlCommand(" select i.itemname,ed.inventQty as  'quantity',ed.inventoryDescp as 'remarks',i.Createdate from [events] e left join EventInventoryDetails ed on e.id=ed.eventid inner join tbl_inventory i on i.id=ed.inventoryid where e.id = " + Request.QueryString["id"].ToString() + "", sqlcon);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            sqlcon.Open();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                GrdInventory.DataSource = ds;
                GrdInventory.DataBind();

            }
            sqlcon.Close();
        }
        protected void btnedit_Click(object sender, ImageClickEventArgs e)
        {
            if (!string.IsNullOrEmpty(lblid.Text))
            {
                Response.Redirect("EditEvent.aspx?id=" + lblid.Text + "");
            }
        }
        //protected void btnupdate_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string comand = "update events set RCcontract='" + chkDepost.Checked + "',RCCertificate='" + chkInsurance.Checked + "'" +
        //        ",RCLayout='" + chkLayout.Checked + "',balanceRecieved='" + chkOPB.Checked + "' where id=" + lblid.Text + "";
        //        SqlCommand cmd = new SqlCommand(comand, sqlcon);
        //        sqlcon.Open();
        //        cmd.ExecuteNonQuery();
        //        sqlcon.Close();
        //        imgupdate.Visible = true;
        //    }
        //    catch { }
        //}

        protected void btndlt_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("prcDeleteEvents", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(lblid.Text.Trim()));
                sqlcon.Open();
                int result = (int)cmd.ExecuteNonQuery();

                sqlcon.Close();

                if (result > 0)
                {
                    Response.Redirect("Home.aspx", false);
                }
                else
                {

                }
            }
            catch
            {
                //  Response.Write(ex);

            }
        }
    }
}