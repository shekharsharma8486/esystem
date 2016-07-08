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
    public partial class Inventory1 : System.Web.UI.Page
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
                            hdnidauto.Value = "0";
                            getuser();
                        }
                    }
                    else
                    {
                         Response.Redirect("login.aspx",false);
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
                int idd = Convert.ToInt32(hdnidauto.Value);
                //if (btnsave.Text == "Update")
                //{
                if (idd != 0)
                {
                    SqlCommand cmd = new SqlCommand("update tbl_inventory set itemname ='" + txtitemname.Text + "', quantity='" + txtquantity.Text + "' " +
                    ", remarks = '" + txtremarks.Text.Trim() + "',createdate = getdate() where id=" + idd + "", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lbladded.Text = "Inventory Updated Successfully.";
                    lbladded.Attributes.CssStyle.Add("display", "block");
                    lbladded.Visible = true;
                    btnsave.Text = "Add Inventory";
                    txtitemname.Text = "";
                    txtquantity.Text = "";
                    txtremarks.Text = "";
                }
                else
                {
                    SaveUser();

                }
                getuser();
            }
            catch
            { }
        }


        public void SaveUser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into tbl_inventory values(@itemname,@quantity,@remarks,getdate())", con);

                cmd.Parameters.AddWithValue("@itemname", txtitemname.Text.Trim());
                cmd.Parameters.AddWithValue("@quantity", txtquantity.Text.Trim());
                cmd.Parameters.AddWithValue("@remarks", txtremarks.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lbladded.Text = "New Inventory Added.";
                lbladded.Attributes.CssStyle.Add("display", "block");
                lbladded.Visible = true;
                txtitemname.Text = "";
                txtquantity.Text = "";
                txtremarks.Text = "";

            }
            catch
            { }

        }

        public void getuser()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from tbl_inventory", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    grduser.DataSource = ds;
                    grduser.DataBind();
                    //lblnumber.Text = grduser.Rows.Count.ToString();
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
                    SqlCommand cmd = new SqlCommand("delete from tbl_inventory where id = " + id + "", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    getuser();
                    lbladded.Text = string.Empty;

                }


                if (e.CommandName == "editt")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    lblid.Text = id.ToString();
                    GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    int rowIndex = gvr.RowIndex;

                    SqlCommand cmd = new SqlCommand("select * from tbl_inventory where id=" + id + "", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lblid.Text = dr["id"].ToString();
                        txtitemname.Text = dr["itemname"].ToString();
                        txtquantity.Text = dr["quantity"].ToString();
                        txtremarks.Text = dr["remarks"].ToString();


                    }
                    dr.Close();
                    con.Close();

                    btnsave.Text = "Update";
                    lbladded.Visible = false;


                    SqlCommand cmd1 = new SqlCommand("select * from tbl_inventory where id != " + lblid.Text + "", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        grduser.DataSource = ds;
                        grduser.DataBind();
                    }


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

                SqlCommand cmd = new SqlCommand("select * from tbl_inventory where itemname like  '%" + txtsearch.Value + "%' or quantity like '%" + txtsearch.Value + "%' " + "or remarks like '%" + txtsearch.Value + "%'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                //if (ds != null && ds.Tables[0].Rows.Count > 0)
                //{
                    grduser.DataSource = ds;
                    grduser.DataBind();
                    // lblnumber.Text = grduser.Rows.Count.ToString();
                //}
              


            }
            catch
            { }
        }
    }
}