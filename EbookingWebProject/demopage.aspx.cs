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
    public partial class demopage : System.Web.UI.Page
    {
        int userid;

        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {


         
            if (!IsPostBack)
            {
                HiddenField1.Value = "0";
                fill();
            }
        }
    
        public void fill()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("GetTodaysData", sqlcon);
              
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Type", "all");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    Repeater5.DataSource = ds;
                    Repeater5.DataBind();
                }
                //Repeater1.DataSource = ds;
                //Repeater1.DataBind();
                //Repeater3.DataSource = ds;
                //Repeater3.DataBind();

                //if (ds.Tables[0].Rows.Count > 0)
                //{
                //    lblevent1.Text = ds.Tables[0].Rows[0]["etitle"].ToString();
                //    lblevent1g.Text = fillgrndsrdo(ds.Tables[0].Rows[0]["E_grounds"].ToString());
                //    //lblevent1g.Text = ds.Tables[0].Rows[0]["E_grounds"].ToString();


                //    if (ds.Tables[0].Rows.Count > 1)
                //    {
                //        lblevent2.Text = ds.Tables[0].Rows[1]["etitle"].ToString();
                //        lblevent2g.Text = fillgrndsrdo(ds.Tables[0].Rows[1]["E_grounds"].ToString());
                //    }
                //    if (ds.Tables[0].Rows.Count > 2)
                //    {
                //        lblevent3.Text = ds.Tables[0].Rows[2]["etitle"].ToString();
                //        lblevent3g.Text = fillgrndsrdo(ds.Tables[0].Rows[2]["E_grounds"].ToString());
                //    }
                //    if (string.IsNullOrEmpty(lblevent1.Text))
                //    {
                //        topdiv1.Visible = false;

                //    }
                //    if (string.IsNullOrEmpty(lblevent2.Text))
                //    {
                //        topdiv2.Visible = false;

                //    }
                //    if (string.IsNullOrEmpty(lblevent3.Text))
                //    {
                //        topdiv3.Visible = false;

                //    }

                //}
                //else
                //{
                //    topdiv1.Visible = false;
                //    topdiv2.Visible = false;
                //    topdiv3.Visible = false;
                //}
            }
            catch
            { }

        }
        public string fillgrndsrdo(string grounds)
        {
            try
            {
                string valu = "";
                string[] items = grounds.Split(',');


                if (sqlcon.State == ConnectionState.Closed)
                {

                    sqlcon.Open();
                }

                for (int j = 0; j < items.Length; j++)
                {


                    SqlCommand cmd = new SqlCommand("Select checkbox_location from chk_location where checkbox_id= " + items[j].ToString() + "", sqlcon);
                    SqlDataReader dr;

                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        valu = valu + "," + dr["checkbox_location"].ToString();
                    }


                    dr.Close();
                }

                if (sqlcon.State == ConnectionState.Open)
                {
                    sqlcon.Close();
                }
                string val = valu;
                val = val.Remove(0, 1);
                return val;
            }
            catch
            {
                return null;
            }
        }
        //[System.Web.Services.WebMethod]
        //public static List<string> GetList(string emplist)
        //{
        //    List<string> empResult = new List<string>();
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString()))
        //    {
        //        //using (SqlCommand cmd = new SqlCommand())
        //        //{
        //            SqlCommand cmd = new SqlCommand("GetTodaysData", con);
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("@Type", "search");
        //                    cmd.Parameters.AddWithValue("@search", emplist);
        //                    SqlDataReader dr = cmd.ExecuteReader();
        //                    while (dr.Read())
        //                    {
        //                        empResult.Add(dr["id"].ToString());
        //                        empResult.Add(dr["Etitle"].ToString());
        //                        empResult.Add(dr["E_startdate"].ToString());
        //                        empResult.Add(dr["status"].ToString());
        //                    }
        //                    con.Close();
        //                    return empResult;
        //                    //SqlDataAdapter ad = new SqlDataAdapter(cmd);
        //                    //DataSet ds = new DataSet();
        //                    //ad.Fill(ds);
        //                    //if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
        //                    //{
        //                    //    Repeater5.DataSource = ds;
        //                    //    Repeater5.DataBind();
        //                    //}
                           
        //            //        }
        //          //  SqlCommand cmd = new SqlCommand("GetTodaysData", sqlcon);
        //          //  cmd.CommandType = CommandType.StoredProcedure;
        //          //  con.Open();
        //          //  cmd.Parameters.AddWithValue("@Type", "search");
        //          //  cmd.Parameters.AddWithValue("@search", emplist);
        //          ////  cmd.Parameters.AddWithValue("@SearchEmpName", emplist);
        //          //  SqlDataReader dr = cmd.ExecuteReader();
        //          //  while (dr.Read())
        //          //  {
        //          //      empResult.Add(dr["EmployeeName"].ToString());
        //          //  }
        //          //  con.Close();
        //          //  return empResult;
        //        //}
        //    }
        //}

      
        [System.Web.Services.WebMethod]
        public static List<Event> GetEvents()
        {
            SqlConnection sqlcon1 = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            List<Event> events = new List<Event>();


            SqlCommand cmd = new SqlCommand("BindTitle", sqlcon1);
            cmd.CommandType = CommandType.StoredProcedure;
            sqlcon1.Open();
            SqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {


                string a1 = Convert.ToDateTime(dr["E_startdate"].ToString()).ToShortDateString();
                string a2 = Convert.ToDateTime(dr["E_Enddate"].ToString()).ToShortDateString();

                string status = dr["status"].ToString();
                string clr = "";
                if (status == "1")
                {
                    clr = "Green";

                }
                else if (status == "2")
                {
                    clr = "Red";

                }
                else if (status == "0")
                {
                    clr = "Gray";

                }

                DateTime dt;
                DateTime dt2;
                //string dt;
                //string dt2;
                try
                {
                    dt = Convert.ToDateTime(a1);
                    //dt = Convert.ToString(a1);
                }
                catch
                {
                    dt = Convert.ToDateTime(dr["E_startdate"].ToString());
                }
                try
                {
                    dt2 = Convert.ToDateTime(a1);
                    //dt2 = Convert.ToString(a1);
                }
                catch
                {
                    dt2 = Convert.ToDateTime(dr["E_Enddate"].ToString());
                    //dt2 = Convert.ToDateTime(dr["E_Enddate"].ToString()).ToShortDateString();
                }

                DateTime date = Convert.ToDateTime(dr["E_startdate"].ToString().Trim());
                //string date = Convert.ToDateTime(dr["E_startdate"].ToString()).ToShortDateString();
                TimeSpan RemTime = new TimeSpan(dt.Hour, dt.Minute, dt.Second);
                DateTime d1 = date.Add(RemTime);
                //string d1 = date + Convert.ToString(dr["startTime"].ToString().Trim());


                DateTime date2 = Convert.ToDateTime(dr["E_Enddate"].ToString().Trim());

                // string date2 = Convert.ToDateTime(dr["E_Enddate"].ToString()).ToShortDateString();
                TimeSpan RemTime2 = new TimeSpan(dt2.Hour, dt2.Minute, dt2.Second);
                DateTime d2 = date2.AddHours(10);
                //string d2 = date2 + Convert.ToString(dr["endtime"].ToString().Trim());
                events.Add(new Event()
                {
                    EventID = Convert.ToInt32(dr["id"].ToString()),
                    EventName = dr["etitle"].ToString(),
                    Url = "http://google.com/",
                    StartDate = d1.ToString(),
                    color = clr,
                    EndDate = d2.ToString()

                });
            }

            return events;
            dr.Close();
            sqlcon1.Close();
        }

        protected void ddlStatusSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
               // txtEventSrch.Text = string.Empty;
               // txtPromotrSrch.Text = string.Empty;
                HiddenField1.Value="0";
                SqlCommand cmd = new SqlCommand("GetTodaysData", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Type", "search");
                cmd.Parameters.AddWithValue("@search", ddlStatusSearch.SelectedValue);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    Repeater5.DataSource = ds;
                    Repeater5.DataBind();
                }
                else
                {
                    DataTable dt = new DataTable();
                    Repeater5.DataSource = dt;
                    Repeater5.DataBind();
                    Control FooterTemplate = Repeater5.Controls[Repeater5.Controls.Count - 1].Controls[0];
                        FooterTemplate.FindControl("trEmpty").Visible = true;
                  
                }
            }
            catch { }
        }
        [System.Web.Services.WebMethod]
        public static List<string> GetPromoter(string empPromoter)
        {
            List<string> empResult = new List<string>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct (fname +' '+ lname) as EmployeeName from promoters where fname LIKE ''+@SearchEmpName+'%' or lname LIKE ''+@SearchEmpName+'%' ";
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@SearchEmpName", empPromoter);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        empResult.Add(dr["EmployeeName"].ToString());
                    }
                    con.Close();
                    return empResult;
                }
            }
        }

        protected void ddlStatusSearch1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // txtEventSrch.Text = string.Empty;
                // txtPromotrSrch.Text = string.Empty;
                HiddenField1.Value = "0";
                SqlCommand cmd = new SqlCommand("GetTodaysData", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Type", "search");
                cmd.Parameters.AddWithValue("@search", ddlStatusSearch1.SelectedValue);

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    Repeater5.DataSource = ds;
                    Repeater5.DataBind();
                }
                else
                {
                    DataTable dt = new DataTable();
                    Repeater5.DataSource = dt;
                    Repeater5.DataBind();
                    Control FooterTemplate = Repeater5.Controls[Repeater5.Controls.Count - 1].Controls[0];
                    FooterTemplate.FindControl("trEmpty").Visible = true;
                    //fill();
                }
            }
            catch { }
        }

        //protected void BtSrch_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        SqlCommand cmd = new SqlCommand("GetTodaysData", sqlcon);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        //if (string.IsNullOrEmpty(txtPromotrSrch.Text.Trim()))
        //        if (HiddenField1.Value =="1")
        //        {
        //            cmd.Parameters.AddWithValue("@Type", "Promoter");
        //            cmd.Parameters.AddWithValue("@search", txtPromotrSrch.Text.Trim());
        //        }
        //        //if (string.IsNullOrEmpty(txtEventSrch.Text.Trim()))
        //        if (HiddenField1.Value == "2")
        //        {
        //            cmd.Parameters.AddWithValue("@Type", "events");
        //            cmd.Parameters.AddWithValue("@search", txtEventSrch.Text.Trim());
        //        }

        //        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        //        DataSet ds = new DataSet();
        //        ad.Fill(ds);
        //        if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
        //        {
        //            Repeater5.DataSource = ds;
        //            Repeater5.DataBind();
        //        }
        //        else
        //        {
        //            DataSet dss = new DataSet();
        //            Repeater5.DataSource = dss;
        //            Repeater5.DataBind();
        //           // fill();
        //        }
        //    }
        //    catch { }
        //}
    }
}