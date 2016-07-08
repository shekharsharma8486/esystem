using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace EbookingWebProject
{
    public partial class FillGridClientSide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static List<string> GetList(string emplist)
        {
            List<string> empResult = new List<string>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString()))
            {
                //using (SqlCommand cmd = new SqlCommand())
                //{
                SqlCommand cmd = new SqlCommand("GetTodaysData", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Type", "search");
                cmd.Parameters.AddWithValue("@search", emplist);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    empResult.Add(dr["id"].ToString());
                    empResult.Add(dr["Etitle"].ToString());
                    empResult.Add(dr["E_startdate"].ToString());
                    // empResult.Add(dr["status"].ToString());
                }
                con.Close();
                return empResult;

            }
        }
    }
}