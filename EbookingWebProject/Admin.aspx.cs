using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace EbookingWebProject
{
    public partial class Admin1 : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
        ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
        // ServiceReference1.Service1Client obj1 =new ServiceReference1.Service1Client();

        protected void Page_Load(object sender, EventArgs e)
        {

            int userid = Convert.ToInt32(Session["userid"]);
            if (userid != 0)
            {
                if (!IsPostBack)
                {
                    // BindColumnToGridview();
                    BindAdmin();
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);

            }
        }
        private void BindColumnToGridview()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("fname");
            dt.Columns.Add("lname");
            dt.Columns.Add("email");
            dt.Columns.Add("phone");
            dt.Columns.Add("pass");
            dt.Columns.Add("userrole");
            dt.Rows.Add();
            grdAdmin.DataSource = dt;
            grdAdmin.DataBind();
            grdAdmin.Rows[0].Visible = false;
        }
        [System.Web.Services.WebMethod]
        public static string FillGridAdmin()
        {
            string gridtable;
            DataSet ds = new DataSet();
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("select id,fname,lname,email,phone,pass,userrole from admin", sqlcon);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                ad.Fill(ds);
                gridtable = ds.GetXml();
            }
            catch { }
            gridtable = ds.GetXml();
            return gridtable;

        }
        public void BindAdmin()
        {
            try
            {

                ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
                ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
                DataSet ds = new DataSet();
                ds = obj.FillGridAdmin();
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    grdAdmin.DataSource = ds;
                    grdAdmin.DataBind();

                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());

            }
        }
        [System.Web.Services.WebMethod]
        public static string UpdateAdminInfo(string admininfo)
        {

            try
            {
                //ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
                //ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
                ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
                ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
                string[] admindata = admininfo.Split(',');
                string adminid = admindata[0];
                string fname = admindata[1];
                string lname = admindata[2];
                string email = admindata[3];
                string phone = admindata[4];
                string pwd = EncryptDecrypt.Encryptdata(admindata[5]);
                string role = admindata[6];
                string btntext = admindata[7];
                objEventsDetails1.AdminID = adminid;
                objEventsDetails1.FName = fname;
                objEventsDetails1.LName = lname;
                objEventsDetails1.EMail = email;
                objEventsDetails1.PHone = phone;
                objEventsDetails1.Password = pwd;
                objEventsDetails1.Role = role;
                objEventsDetails1.BtnText = btntext;
                obj.UpdateAdminRole(objEventsDetails1);
            }
            catch { }
            return admininfo;

        }

        protected void grdAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAdmin.PageIndex = e.NewPageIndex;
            BindAdmin();
        }
      
        [System.Web.Services.WebMethod]
        public static string DeleteAdminInfo(string admininfo)
        {
            //ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
            //ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
            ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
            ServiceReference1.EventsDetails objEventsDetails1 = new ServiceReference1.EventsDetails();
            try
            {
                string adminid = admininfo;
                objEventsDetails1.AdminID = adminid;
                obj.DeleteAdminRole(objEventsDetails1);
            }
            catch { }
            return admininfo;
        }
        [System.Web.Services.WebMethod]
        public static string checkmail(string useremail)
        {
            string retval = "";
            try
            {

                SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
                SqlCommand cmd = new SqlCommand("select email from admin where email=@UserNameorEmail", sqlcon);
                cmd.Parameters.AddWithValue("@UserNameorEmail", useremail);
                sqlcon.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    retval = "true";
                }
                else
                {
                    retval = "false";
                }
                sqlcon.Close();
                return retval;

            }
            catch { }

            return retval;

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand("prcsearchAdminGrid", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@data", txtsearch.Value.Trim());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                ad.Fill(ds);
                grdAdmin.DataSource = ds;
                grdAdmin.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());

            }

        }

    }
}