using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EbookingWebProject
{
    public partial class Add_location1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try
                {
                    if (!string.IsNullOrEmpty(Session["login"].ToString()) && Session["login"].ToString() == "Login")
                    {
                        {
                            int val = 0;
                            hdnidauto.Value = val.ToString().Trim();
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
        public void getuser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select checkbox_id,checkbox_location,case ActiveFlag when 1 then 'Active' when 0 then 'Inactive' end as ActiveFlag from [dbo].[chk_location]", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {

                    grduser2.DataSource = ds;
                    grduser2.DataBind();
                  //  lblnumbers.Text = grduser2.Rows.Count.ToString();
                }

            }
            catch
            { }
        }



        public void SaveUser()
        {
            try
            {
                string chk = "";
                SqlCommand cmd1 = new SqlCommand("select checkbox_location from chk_location where checkbox_location='" + txtlocation.Text.Trim() + "' ", con);
                con.Open();
                chk = (string)cmd1.ExecuteScalar();
                con.Close();
                if (!string.IsNullOrEmpty(chk))
                {
                    lbladded.Text = "Assets Already Exists.";

                    lbladded.Attributes.CssStyle.Add("display", "block");
                    lbladded.ForeColor = System.Drawing.Color.Red;
                    lbladded.Visible = true;
                    txtlocation.Focus();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into chk_location(checkbox_location) values(@checkbox_location)", con);

                    cmd.Parameters.AddWithValue("@checkbox_location", txtlocation.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lbladded.Text = "&#10004;" + "Location Added Successfully.";

                    lbladded.Attributes.CssStyle.Add("display", "block");
                    lbladded.ForeColor = System.Drawing.Color.Green;
                    lbladded.Visible = true;
                    txtlocation.Text = "";
                    getuser();
                }
            }
            catch (Exception ex)
            {
                //  Response.Write(ex);
            }

        }

     

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("select checkbox_id,checkbox_location,case ActiveFlag when 1 then 'Active' when 0 then 'Inactive' end as ActiveFlag from chk_location where checkbox_location like '%" + txtsearch.Value.Trim() + "%'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grduser2.DataSource = ds;
                grduser2.DataBind();
                //lblnumber.Text = grduser.Rows.Count.ToString();
                lbladded.Text = string.Empty;


            }
            catch
            { }
        }


        protected void grduser2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "dele")
                {

                    int id = Convert.ToInt32(e.CommandArgument);
                    SqlCommand cmd = new SqlCommand("update  chk_location set ActiveFlag =(case when ActiveFlag=1 then 0 when ActiveFlag=0 then 1 end) where  checkbox_id = " + id + "", con);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@activeValue", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbladded.Attributes.CssStyle.Add("display", "none");
                    con.Close();
                    getuser();

                }
            }
            catch
            { }


        }
        protected void grduser2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grduser2.PageIndex = e.NewPageIndex;
            getuser();
            lbladded.Text = string.Empty;


        }
    
        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                int idd = Convert.ToInt32(hdnidauto.Value);
                if (idd != 0)
                {
                    SqlCommand cmd = new SqlCommand("update chk_location set checkbox_location ='" + txtlocation.Text + "' where checkbox_id=" + idd + "", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lbladded.Text = "&#10004;" + "Assets Updated Successfully.";

                    lbladded.Attributes.CssStyle.Add("display", "block");
                    lbladded.ForeColor = System.Drawing.Color.Green;
                    lbladded.Visible = true;
                    btnsave.Text = "Add";
                    txtlocation.Text = "";
                    int val = 0;
                    hdnidauto.Value = val.ToString().Trim();
                    getuser();

                }
                else
                {
                    SaveUser();

                }

            }
            catch (Exception ex)
            {
                // Response.Write(ex);
            }

        }
    }
}