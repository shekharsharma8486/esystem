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
    public partial class scheduler : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        MailMaster objMailMaster = new MailMaster();
        protected void Page_Load(object sender, EventArgs e)
        {
            MailToAdmin();
            MailToClient();

        }
        public void MailToAdmin()
        {

            try
            {
                SqlCommand cmd2 = new SqlCommand("select * from tblMailSetting", sqlcon);
               
                SqlDataAdapter add = new SqlDataAdapter(cmd2);
                DataSet dset = new DataSet();
                add.Fill(dset);

                string AdminName = "";
                string email = "";
                string pass = "";
                int ownerid;
                SqlCommand cmd = new SqlCommand("sp_mailSchedular", sqlcon);
                DataSet ds = new DataSet();
                cmd.CommandType = CommandType.StoredProcedure;
                #region strat insert in rows
                string cont2 = "MailToId=5";
                
                

                DataRow[] rows2;

                rows2 = dset.Tables[0].Select(cont2);
                //rows2 = ClassMailPermission.dtloginPermission.Select(cont2);

                if (rows2.Length > 0 && rows2 != null)
                {
                    bool chekmail = Convert.ToBoolean(rows2[0]["chkMailSend"].ToString());
                    if (chekmail == true)
                    {
                        string subjectinfo = rows2[0]["subject"].ToString();
                        string bodymsg = rows2[0]["bodymsg"].ToString();
                        string timeinerval = rows2[0]["timeInterval"].ToString();
                        cmd.Parameters.AddWithValue("@timeinterval", timeinerval);
                        cmd.Parameters.AddWithValue("@mailto", "admin");
                        SqlDataAdapter ad = new SqlDataAdapter(cmd);
                        ad.Fill(ds);
                        for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                        {
                            //AdminName = ds.Tables[0].Rows[i]["name"].ToString();
                            //email = ds.Tables[0].Rows[i]["email"].ToString();
                            //pass = ds.Tables[0].Rows[i]["pass"].ToString();
                            AdminName = ds.Tables[0].Rows[i]["EventCreatorName"].ToString();
                            email = ds.Tables[0].Rows[i]["CreatorEmailId"].ToString();
                            pass = ds.Tables[0].Rows[i]["creatorPassword"].ToString();
                            ownerid = Convert.ToInt32(ds.Tables[0].Rows[i]["EventCreatedBy"].ToString());
                            if(!string.IsNullOrEmpty(email))
                            {

                                DataSet fds = new DataSet();

                                SqlCommand fcmd = new SqlCommand("sp_mailSchedularInfo", sqlcon);
                                fcmd.CommandType = CommandType.StoredProcedure;
                                fcmd.Parameters.AddWithValue("@createdby", ownerid);
                                fcmd.Parameters.AddWithValue("@timeinterval", timeinerval);
                                fcmd.Parameters.AddWithValue("@mailto", "admin");
                                SqlDataAdapter fad = new SqlDataAdapter(fcmd);
                                fad.Fill(fds);
                            StringBuilder sbAdminTable = new StringBuilder();
                            #region AdminEventTable
                            //below this table 0/Event
                            if (fds.Tables[0].Rows.Count > 0 && fds!=null)
                            //if (ds.Tables[1].Rows.Count > 0)
                            //if (ds.Tables[0].Rows.Count > 0)
                            {
                                string ValidateURL = "http://ebooking.deaninfotech.com/Details.aspx?id=";

                                //string ValidateURL = "http://localhost:51807/EbookingSoft/Details.aspx?id=";
                                //sbLetter.Append("<a href='");
                                //sbLetter.Append(WebUrl);
                                //sbLetter.Append(ValidationKey);
                                //sbLetter.Append("'>  click here");

                                string id = "";
                                sbAdminTable.Append("<div style='color:#006699;text-decoration:underline; font-weight:bold'>Coming Events</div>");
                                sbAdminTable.Append("<table border='1' width='80%'>");
                                sbAdminTable.Append("<tr>");


                                foreach (System.Data.DataColumn col in fds.Tables[0].Columns)
                                //foreach (System.Data.DataColumn col in ds.Tables[1].Columns)
                                //foreach (System.Data.DataColumn col in ds.Tables[0].Columns)
                                {

                                    if (col.ColumnName != "id" )
                                    {
                                      if  (col.ColumnName != "EventCreatedBy")
                                        {
                                            sbAdminTable.Append("<td style='font-size: 11px; color: Black;background-color:#D7D7D7; font-family: Arial, Verdana; font-Weight:Bold; text-align: center;'>");
                                        sbAdminTable.Append(col.ColumnName);
                                        sbAdminTable.Append("</td>");
                                      
                                        }
                                    }

                                   
                                  
                                }
                                sbAdminTable.Append("</tr>");
                              
                                for (int j = 0; j <= fds.Tables[0].Rows.Count - 1; j++)
                               // for (int j = 0; j <= ds.Tables[1].Rows.Count - 1; j++)
                                //for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                                {

                                    sbAdminTable.Append("<tr>");
                                    for (int k = 0; k <= fds.Tables[0].Columns.Count - 1; k++)
                                    //for (int k = 0; k <= ds.Tables[1].Columns.Count - 1; k++)
                                    //for (int k = 0; k <= ds.Tables[0].Columns.Count - 1; k++)
                                    {
                                        if (k == 0)
                                        {

                                            id = Convert.ToString(fds.Tables[0].Rows[j][k]).ToString() + "&email=" + email + "&pwd=" + pass;
                                            //id = Convert.ToString(ds.Tables[1].Rows[j][k]).ToString() + "&email=" + email + "&pwd=" + pass;
                                            //id = Convert.ToString(ds.Tables[0].Rows[j][k]).ToString() + "&email=" + email + "&pwd=" + pass;

                                        }

                                        if (k < 4)
                                        {
                                            if (k != 0)
                                            {
                                                if (k == 1)
                                                {
                                                    sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                                    sbAdminTable.Append("<a href='");
                                                    sbAdminTable.Append(ValidateURL + id);

                                                    sbAdminTable.Append("'>");
                                                    sbAdminTable.Append(fds.Tables[0].Rows[j][k]).ToString();
                                                    sbAdminTable.Append("</td>");
                                                }
                                                else
                                                if (k != 10)
                                                {
                                                    sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                                    sbAdminTable.Append(fds.Tables[0].Rows[j][k]).ToString();
                                                    sbAdminTable.Append("</td>");
                                                }
                                                //sbAdminTable.Append(ds.Tables[1].Rows[j][k]).ToString();
                                                //sbAdminTable.Append(ds.Tables[0].Rows[j][k]).ToString();
                                            }
                                        }

                                        if (k == 4)
                                        {
                                            sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                            sbAdminTable.Append(fillgrndsrdo(Convert.ToString(fds.Tables[0].Rows[j][k])));
                                            sbAdminTable.Append("</td>");
                                            //sbAdminTable.Append(fillgrndsrdo(Convert.ToString(ds.Tables[1].Rows[j][k])));
                                            //sbAdminTable.Append(fillgrndsrdo(Convert.ToString(ds.Tables[0].Rows[j][k])));

                                        }
                                        if (k > 4)
                                        {
                                            if (k != 0)
                                            {
                                                if (k != 10)
                                                {
                                                    sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                                    sbAdminTable.Append(fds.Tables[0].Rows[j][k]).ToString();
                                                    sbAdminTable.Append("</td>");
                                                    //sbAdminTable.Append(ds.Tables[1].Rows[j][k]).ToString();
                                                    //sbAdminTable.Append(ds.Tables[0].Rows[j][k]).ToString();
                                                }
                                            }
                                        }
                                        //sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                        //sbAdminTable.Append("</td>");
                                    }
                                    sbAdminTable.Append("</tr>");
                                }
                                sbAdminTable.Append("</table>");
                            }
                            #endregion
                            if (fds.Tables[0].Rows.Count > 0)
                            //if (ds.Tables[1].Rows.Count > 0)
                            //if (ds.Tables[0].Rows.Count > 0)
                            {
                                objMailMaster.MasterMailSettingTable(AdminName, email, subjectinfo, bodymsg, sbAdminTable.ToString());
                            }
                            }

                        }

                        ////objMailMaster.MasterMailSettingTable(txtFname.Text.Trim(), txtEmail.Text.Trim(), txtFname.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), ddlstartTime.SelectedItem.Text, ddlEndTime.SelectedItem.Text, getgroundText(), subjectinfo, bodymsg, ddlstatus.SelectedItem.Text, "", txtnotidate.Text.Trim());
                    }

                }
                #endregion
            }
            catch
            {

            }

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
        public void MailToClient()
        {
            try
            {
                SqlCommand cmd2 = new SqlCommand("select * from tblMailSetting", sqlcon);

                SqlDataAdapter add = new SqlDataAdapter(cmd2);
                DataSet dset = new DataSet();
                add.Fill(dset);

                string AdminName = "";
                string email = "";
                string pass = "";
                int Promoterid;
                SqlCommand cmd = new SqlCommand("sp_mailSchedular", sqlcon);
                DataSet ds = new DataSet();
                cmd.CommandType = CommandType.StoredProcedure;
                #region strat insert in rows
                string cont2 = "MailToId=6";



                DataRow[] rows2;

                rows2 = dset.Tables[0].Select(cont2);
                //rows2 = ClassMailPermission.dtloginPermission.Select(cont2);

                if (rows2.Length > 0 && rows2 != null)
                {
                    bool chekmail = Convert.ToBoolean(rows2[0]["chkMailSend"].ToString());
                    if (chekmail == true)
                    {
                        string subjectinfo = rows2[0]["subject"].ToString();
                        string bodymsg = rows2[0]["bodymsg"].ToString();
                        string timeinerval = rows2[0]["timeInterval"].ToString();
                        cmd.Parameters.AddWithValue("@timeinterval", timeinerval);
                        cmd.Parameters.AddWithValue("@mailto", "client");
                        SqlDataAdapter ad = new SqlDataAdapter(cmd);
                        ad.Fill(ds);
                        for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                        {
                            //AdminName = ds.Tables[0].Rows[i]["name"].ToString();
                            //email = ds.Tables[0].Rows[i]["email"].ToString();
                            //pass = ds.Tables[0].Rows[i]["pass"].ToString();
                            AdminName = ds.Tables[0].Rows[i]["ClientName"].ToString();
                            email = ds.Tables[0].Rows[i]["ClentEmail"].ToString();

                            Promoterid = Convert.ToInt32(ds.Tables[0].Rows[i]["promoterid"].ToString());
                            if (!string.IsNullOrEmpty(email))
                            {

                                DataSet fds = new DataSet();

                                SqlCommand fcmd = new SqlCommand("sp_mailSchedularInfo", sqlcon);
                                fcmd.CommandType = CommandType.StoredProcedure;
                                fcmd.Parameters.AddWithValue("@createdby", Promoterid);
                                fcmd.Parameters.AddWithValue("@timeinterval", timeinerval);
                                fcmd.Parameters.AddWithValue("@mailto", "client");
                                SqlDataAdapter fad = new SqlDataAdapter(fcmd);
                                fad.Fill(fds);
                                StringBuilder sbAdminTable = new StringBuilder();
                                #region AdminEventTable
                                //below this table 0/Event
                                if (fds.Tables[0].Rows.Count > 0 && fds != null)
                                //if (ds.Tables[1].Rows.Count > 0)
                                //if (ds.Tables[0].Rows.Count > 0)
                                {


                                    string id = "";
                                    sbAdminTable.Append("<div style='color:#006699;text-decoration:underline; font-weight:bold'>Coming Events</div>");
                                    sbAdminTable.Append("<table border='1' width='80%'>");
                                    sbAdminTable.Append("<tr>");


                                    foreach (System.Data.DataColumn col in fds.Tables[0].Columns)
                                    //foreach (System.Data.DataColumn col in ds.Tables[1].Columns)
                                    //foreach (System.Data.DataColumn col in ds.Tables[0].Columns)
                                    {

                                        if (col.ColumnName != "ClientName")
                                        {
                                            if (col.ColumnName != "ClentEmail")
                                            {
                                                if (col.ColumnName != "promoterid")
                                                {
                                                    sbAdminTable.Append("<td style='font-size: 11px; color: Black;background-color:#D7D7D7; font-family: Arial, Verdana; font-Weight:Bold; text-align: center;'>");
                                                    sbAdminTable.Append(col.ColumnName);
                                                    sbAdminTable.Append("</td>");

                                                }
                                            }
                                        }



                                    }
                                    sbAdminTable.Append("</tr>");

                                    for (int j = 0; j <= fds.Tables[0].Rows.Count - 1; j++)
                                    // for (int j = 0; j <= ds.Tables[1].Rows.Count - 1; j++)
                                    //for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                                    {

                                        sbAdminTable.Append("<tr>");
                                        for (int k = 0; k <= fds.Tables[0].Columns.Count - 1; k++)
                                        //for (int k = 0; k <= ds.Tables[1].Columns.Count - 1; k++)
                                        //for (int k = 0; k <= ds.Tables[0].Columns.Count - 1; k++)
                                        {

                                            if (k > 2)
                                            {
                                                if (k != 6)
                                                {
                                                    sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                                    sbAdminTable.Append(fds.Tables[0].Rows[j][k]).ToString();
                                                    sbAdminTable.Append("</td>");
                                                }
                                            }
                                            if (k == 6)
                                            {
                                                sbAdminTable.Append("<td style='font-size: 10px;font-family: Arial, Verdana; text-align: left;'>");
                                                sbAdminTable.Append(fillgrndsrdo(Convert.ToString(fds.Tables[0].Rows[j][k])));
                                                sbAdminTable.Append("</td>");
                                                //sbAdminTable.Append(fillgrndsrdo(Convert.ToString(ds.Tables[1].Rows[j][k])));
                                                //sbAdminTable.Append(fillgrndsrdo(Convert.ToString(ds.Tables[0].Rows[j][k])));

                                            }
                                            
                                          
                                        }
                                        sbAdminTable.Append("</tr>");
                                       
                                    }
                                    sbAdminTable.Append("</table>");
                                #endregion
                                    if (fds.Tables[0].Rows.Count > 0)
                                    //if (ds.Tables[1].Rows.Count > 0)
                                    //if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        objMailMaster.MasterMailSettingTable(AdminName, email, subjectinfo, bodymsg, sbAdminTable.ToString());
                                    }
                                }

                            }

                            ////objMailMaster.MasterMailSettingTable(txtFname.Text.Trim(), txtEmail.Text.Trim(), txtFname.Text.Trim(), txtStartDate.Text.Trim(), txtEndDate.Text.Trim(), ddlstartTime.SelectedItem.Text, ddlEndTime.SelectedItem.Text, getgroundText(), subjectinfo, bodymsg, ddlstatus.SelectedItem.Text, "", txtnotidate.Text.Trim());
                        }

                    }
                #endregion
                }
            }
            catch
            {

            }
        }
    }
}