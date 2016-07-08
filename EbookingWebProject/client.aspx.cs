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
    public partial class Promoter1 : System.Web.UI.Page
    {
        int userid;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try
                {

                    userid = Convert.ToInt32(Session["userid"]);
                    if (userid != 0)
                    {
                        {
                            hdbPromtId.Value = "0";
                            getuser();
                        }
                    }
                    else
                    {
                        Response.Redirect("login.aspx", false);
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
                int idd = Convert.ToInt32(hdbPromtId.Value);
                if (idd != 0)
                {
                    SqlCommand cmd = new SqlCommand("update promoters set fname ='" + txtfname.Text + "', lname='" + txtlname.Text + "' " +
                    ", email = '" + txtemail.Text.Trim() + "', phone = '" + txtphone.Text.Trim() + "' where id=" + idd + "", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                        lbladded.Text = "Record Updated Successfully.";
                        lbladded.Attributes.CssStyle.Add("display", "block");
                        lbladded.Visible = true;
                        btnsave.Text = "Add Promoter";
                    txtfname.Text = "";
                    txtlname.Text = "";
                    txtemail.Text = "";
                    txtcemail.Text = "";
                    txtphone.Text = "";
                    hdbPromtId.Value = "0";

                }
                else
                {
                    SaveUser();

                }
                getuser();
            }
            catch (Exception ex)
            {
                // Response.Write(ex);
            }
        }


        public void SaveUser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into promoters values(@fname,@lname,@email,@phone)", con);

                cmd.Parameters.AddWithValue("@fname", txtfname.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", txtlname.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", txtphone.Text.Trim());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lbladded.Visible = true;
                lbladded.Attributes.CssStyle.Add("display", "block");
                txtfname.Text = "";
                txtlname.Text = "";
                txtemail.Text = "";
                txtcemail.Text = "";

                txtphone.Text = "";
            }
            catch (Exception ex)
            {
                //  Response.Write(ex);
            }

        }
        public void getuser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from promoters", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    grduser.DataSource = ds;
                    grduser.DataBind();
                   // lblnumber.Text = grduser.Rows.Count.ToString();
                }

            }
            catch
            { }
        }
        

        protected void grduser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "del")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    SqlCommand cmd = new SqlCommand("delete from promoters where id = " + id + "", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    getuser();

                }


                if (e.CommandName == "editt")
                {
                    lblid.Visible = false;
                    int id = Convert.ToInt32(e.CommandArgument);
                    lblid.Text = id.ToString();
                    GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int rowIndex = gvr.RowIndex;

                    SqlCommand cmd = new SqlCommand("select * from promoters where id=" + id + "", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        txtfname.Text = dr["fname"].ToString();
                        txtlname.Text = dr["lname"].ToString();
                        txtemail.Text = dr["email"].ToString();
                        txtcemail.Text = dr["email"].ToString();
                        txtphone.Text = dr["phone"].ToString();
                        hdbPromtId.Value = Convert.ToString(id);


                    }
                    dr.Close();
                    con.Close();

                    btnsave.Text = "Update";
                    lbladded.Visible = false;


                    SqlCommand cmd1 = new SqlCommand("select * from promoters where id != " + lblid.Text + "", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    grduser.DataSource = ds;
                    grduser.DataBind();


                }
            }
            catch
            { }
        }
        protected void grduser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grduser.PageIndex = e.NewPageIndex;
            getuser();

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("select id,  fname,lname,email,phone,fname + ' ' + lname from promoters where fname like '%" + txtsearch.Value.Trim() + "%' or lname like '%" + txtsearch.Value.Trim() + "%' " +
                    "or email like '%" + txtsearch.Value.Trim() + "%' or phone like '%" + txtsearch.Value.Trim() + "%' or fname + ' ' + lname  like '%" + txtsearch.Value.Trim() + "%' ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grduser.DataSource = ds;
                grduser.DataBind();
                //lblnumber.Text = grduser.Rows.Count.ToString();
                lbladded.Text = string.Empty;


            }
            catch
            { }
        }
    }
}