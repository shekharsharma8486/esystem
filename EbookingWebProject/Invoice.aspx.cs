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
    public partial class Invoice1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int userid = Convert.ToInt32(Session["userid"]);
                    if (userid != 0)
                    {
                        {
                            getuser();
                        }
                    }
                    else
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                }
                catch
                { }
            }

        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {

                SaveUser();
                getuser();
            }
            catch
            { }
        }
        public void SaveUser()
        {
            try
            {
                if (fuinvoice.HasFile == true)
                {

                    lblid.Text = string.Empty;
                    lblerror.Text = string.Empty;
                    string ddtime = DateTime.Now.ToString("ddmmyyyyhhmmss");
                    string filename = fuinvoice.PostedFile.FileName;
                    string filename1 = fuinvoice.PostedFile.FileName;
                    filename = System.IO.Path.GetFileNameWithoutExtension(filename);

                    string path = Server.MapPath("~/invoices/" + filename + ddtime + ".pdf");
                    fuinvoice.PostedFile.SaveAs(path);


                    string dsxml = "";
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    dt.Columns.Add("invoiceName");
                    dt.Columns.Add("invoicepath");
                    dt.Columns.Add("remarks");
                    dt.Rows.Add(filename, path, txtremarks.Text.Trim());
                    ds.Merge(dt);
                    dsxml = ds.GetXml();
                    SqlCommand cmd = new SqlCommand("prcaddInvoice", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@xmlInvoice", dsxml);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lbladded.Visible = true;
                    txtremarks.Text = "";
                    lblerror.Visible = false;
                }
                else
                {
                    lblerror.Visible = true;
                    lblerror.Text = "Please Select Pdf File.";
                }
            }
            catch (Exception ex)
            { }
        }

        public void getuser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from tbl_invoice ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                grduser.DataSource = ds;
                grduser.DataBind();
               // lblnumber.Text = grduser.Rows.Count.ToString();

            }
            catch
            { }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                lblerror.Visible = false;
                SqlCommand cmd = new SqlCommand("select * from tbl_invoice  where invoicename like '%" + txtsearch.Value + "%' or remarks like '%" + txtsearch.Value + "%' " + "", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                grduser.DataSource = ds;
                grduser.DataBind();
                //lblnumber.Text = grduser.Rows.Count.ToString();
            }
            catch
            { }
        }
        public void deletefile(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string[] CommandArgument = btn.CommandArgument.Split(',');
            string CommandArgument1 = CommandArgument[0];
            string CommandArgument2 = CommandArgument[1];
            SqlCommand cmd = new SqlCommand("delete from tbl_invoice  where id = " + CommandArgument1 + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string path = CommandArgument2;
            System.IO.File.Delete(CommandArgument2);
            getuser();
        }

        protected void grduser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "editt")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    lblid.Text = id.ToString();
                    string path = "";
                    GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int rowIndex = gvr.RowIndex;

                    SqlCommand cmd = new SqlCommand("select * from tbl_invoice  where id=" + id + "", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {

                        path = dr["invoicepath"].ToString();
                        string filename = System.IO.Path.GetFileName(path);

                        if (path != null && path != "" && path != string.Empty)
                        {
                            // get the type of file
                            string mimeType = "application/unknown";
                            string ext = System.IO.Path.GetExtension(path).ToLower();
                            Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);
                            if (regKey != null && regKey.GetValue("Content Type") != null)
                            {
                                mimeType = regKey.GetValue("Content Type").ToString();
                            }

                            Response.ContentType = mimeType;
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
                            Response.WriteFile(path);
                            HttpContext.Current.ApplicationInstance.CompleteRequest();

                            //
                        }

                    }
                    dr.Close();
                    con.Close();
                }
            }
            catch (Exception ex)
            { }
        }
        protected void grduser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grduser.PageIndex = e.NewPageIndex;
            getuser();

        }   
    }
}