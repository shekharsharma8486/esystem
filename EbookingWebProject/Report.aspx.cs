using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace EbookingWebProject
{
    public partial class Report1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userid"]);
             if (userid != 0)
             {
                 if (!IsPostBack)
                 {
                     fillusersinddl();
                 }
             }
             else
             {
                 Response.Redirect("login.aspx", false);
             }
        }
        public void fillusersinddl()
        {

            SqlCommand cmd = new SqlCommand("Select checkbox_location,  checkbox_id  from chk_location", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlseletAssert.DataSource = ds;
            ddlseletAssert.DataTextField = "checkbox_location";
            ddlseletAssert.DataValueField = "checkbox_id";
            ddlseletAssert.DataBind();


        }
        [System.Web.Services.WebMethod]
        public static List<string> GetEmployeeName(string empName)
        {
            List<string> empResult = new List<string>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct (fname +' '+ lname) as EmployeeName from promoters where fname LIKE ''+@SearchEmpName+'%' or lname LIKE ''+@SearchEmpName+'%' ";
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@SearchEmpName", empName);
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
        [System.Web.Services.WebMethod]
        public static List<string> GetEventName(string EventName)
        {
            List<string> empEvent = new List<string>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct etitle from events where etitle LIKE ''+@SearchEventName+'%'";
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@SearchEventName", EventName);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        empEvent.Add(dr["etitle"].ToString());
                    }
                    con.Close();
                    return empEvent;
                }
            }
        }
        protected void btngo_Click(object sender, EventArgs e)
        {
            go();


        }
        protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl = (Label)e.Row.FindControl("status");
                if (lbl.Text == "Hold")
                {
                    lbl.ForeColor = System.Drawing.Color.DarkRed;
                }
                else if (lbl.Text == "Confirm")
                {
                    lbl.ForeColor = System.Drawing.Color.DarkGreen;
                }
                else
                {
                    lbl.ForeColor = System.Drawing.Color.Blue;

                }
            }
        }


        public void go()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("prcViewReport", con);
                cmd.CommandType = CommandType.StoredProcedure;
                string query = "";
                if (!string.IsNullOrEmpty(txtfrom.Text.Trim()))
                {
                    DateTime fromdate = Convert.ToDateTime(txtfrom.Text.Trim());
                    query = query + "and E_startdate >= '" + fromdate + "'";

                }
                if (!string.IsNullOrEmpty(txtto.Text.Trim()))
                {
                    DateTime todate = Convert.ToDateTime(txtto.Text.Trim());
                    query = query + "and E_startdate <= '" + todate + "'";

                }
                if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
                {

                    //query = query +  "and Fname in ('" + TextBox1.Text.Trim() + "') or lname in ('" + TextBox1.Text.Trim() + "') or Fname+' '+lname in  ('" + TextBox1.Text.Trim() + "') ";
                    query = query + "and Fname+' '+lname in  ('" + TextBox1.Text.Trim() + "') ";
                }
                if (!string.IsNullOrEmpty(TextBox2.Text.Trim()))
                {

                    query = query + "and Etitle in ('" + TextBox2.Text.Trim() + "')";
                }
                if (ddlseletAssert.SelectedIndex != 0)
                {

                    query = query + "and E_grounds in ('" + ddlseletAssert.SelectedItem.Value + "')";
                }
                //below for status
                //query = query + "and '"+ddlstatus.SelectedItem.Text+"'";
                string fquery = "";
                if (!string.IsNullOrEmpty(query))
                {
                    string newquery = query.Remove(0, 3);
                    fquery = newquery.Replace("12:00:00 AM", "");
                }
                //cmd.Parameters.AddWithValue("@sdate", fromdate);
                //cmd.Parameters.AddWithValue("@enddate", todate);
                cmd.Parameters.AddWithValue("@stt", ddlstatus.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@query", fquery);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridDataset.SetDatatable(dt);
                    grd.DataSource = GridDataset.GetDatatable();
                    grd.DataBind();
                }
                else
                {

                    grd.EmptyDataText = "No Record Found";
                    grd.DataBind();

                }


                //if (stts == "Confirmed")
                //{
                //    cmd = new SqlCommand("select e.id,e.Etitle, convert(varchar(10), e.E_startdate, 101) as E_startdate,convert(varchar(10),e.E_enddate, 101) as E_enddate,e.startTime,e.EndTime,p.Fname,p.Lname, e.notes, case when  e.status  = 1 then  'Confirmed' when  e.status  = 2 then  'Hold' when  e.status  = 0 then  ' ' end as status" +
                //" from events e left join promoters p on e.promoterid = p.id where E_startdate between '" + fromdate + "' and '" + todate + "' and e.status = 1 ", con);

                //}
                //else if (stts == "Hold")
                //{
                //    cmd = new SqlCommand("select e.id,e.Etitle, convert(varchar(10), e.E_startdate, 101) as E_startdate,convert(varchar(10),e.E_enddate, 101) as E_enddate,e.startTime,e.EndTime,p.Fname,p.Lname, e.notes, case when  e.status  = 1 then  'Confirmed' when  e.status  = 2 then  'Hold' when  e.status  = 0 then  ' ' end as status " +
                //" from events e left join promoters p on e.promoterid = p.id where E_startdate between '" + fromdate + "' and '" + todate + "' and e.status = 2 ", con);

                //}
                //else if (stts == "All")
                //{

                //    cmd = new SqlCommand("select e.id,e.Etitle, convert(varchar(10), e.E_startdate, 101) as E_startdate,convert(varchar(10),e.E_enddate, 101) as E_enddate,e.startTime,e.EndTime,p.Fname,p.Lname, e.notes, case when  e.status  = 1 then  'Confirmed' when  e.status  = 2 then  'Hold' when  e.status  = 0 then  ' ' end as status " +
                //    " from events e left join promoters p on e.promoterid = p.id where E_startdate between '" + fromdate + "' and '" + todate + "' and e.status = 0", con);

                //}

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }

        }
        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        if (!string.IsNullOrEmpty(txtsearch.Value))
        //        {
        //            string i = Convert.ToString(0);
        //            if (txtsearch.Value.Trim().ToLower() == "hold")
        //            {
        //                i = "Hold";
        //            }
        //            else if (txtsearch.Value.Trim().ToLower() == "confirmed")
        //            {
        //                i = "Confirmed";
        //            }
        //            else
        //            {
        //                i = txtsearch.Value.Trim();
        //            }

        //            string expression = " notes like '" + i.Trim() + "%' or status like '" + i.Trim() + "%' or Etitle like '" + i.Trim() + "%' or Fname like '" + i.Trim() + "%' or lname like '" + i.Trim() + "%'";
        //            DataRow[] foundRows;
        //            DataTable dt = GridDataset.GetDatatable();
        //            foundRows = dt.Select(expression);
        //            DataTable dtt = new DataTable();
        //            if (foundRows.Length > 0)
        //            {
        //                dtt = foundRows.CopyToDataTable();
        //                grd.DataSource = dtt;
        //                grd.DataBind();
        //            }
        //            else
        //            {
        //                grd.EmptyDataText = "No Record Found";
        //                grd.DataBind();
        //            }


        //        }
        //        else
        //        {
        //            //cmd = new SqlCommand("select e.id,e.Etitle, convert(varchar(10), e.E_startdate, 101) as E_startdate,convert(varchar(10),e.E_enddate, 101) as E_enddate,e.E_time,p.Fname, e.notes, case when  e.status  = 1 then  'Confirmed' when  e.status  = 0 then  'Hold' end as status " +
        //            //" from events e left join promoters p on e.promoterid = p.id", con);

        //        }

        //    }
        //    catch
        //    { }
        //}
        protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd.PageIndex = e.NewPageIndex;
            go();
        }


        public void onclicked(object sender, EventArgs e)
        {
            try
            {
                ImageButton btn = (ImageButton)sender;
                int RowIndex = Convert.ToInt32(btn.CommandArgument);
                // int RowIndex = Convert.ToInt32(e.CommandArgument);
                //DateTime fromdate = Convert.ToDateTime(txtfrom.Text);
                //DateTime todate = Convert.ToDateTime(txtto.Text);
                SqlDataAdapter da;

                da = new SqlDataAdapter("select e.id,e.Etitle, convert(varchar(10), e.E_startdate, 101) as E_startdate,convert(varchar(10),e.E_enddate, 101) as E_enddate,e.startTime,e.EndTime,e.E_grounds,e.status, p.Fname,e.tamt, e.damt, e.bamt, e.notes, case when  e.status  = 1 then  'Confirmed' when  e.status  = 2 then  'Hold' when  e.status  = 0 then  ' ' end as status " +
                " from events e left join promoters p on e.promoterid = p.id where e.id = '" + RowIndex + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);

                Document document = new Document(PageSize.A4, 88f, 88f, 10f, 0f);
                Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK);
                using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                    Phrase phrase = null;
                    PdfPCell cell = null;
                    PdfPTable table = null;
                    Color color = null;

                    document.Open();

                    //Header Table
                    table = new PdfPTable(2);
                    table.TotalWidth = 500f;
                    table.LockedWidth = true;
                    table.SetWidths(new float[] { 0.3f, 0.7f });

                    //Company Logo
                    cell = ImageCell("~/img/logo.png", 70f, PdfPCell.ALIGN_LEFT);
                    cell.BorderWidth = 0;
                    table.AddCell(cell);


                    //Company Name and Address
                    phrase = new Phrase();
                    phrase.Add(new Chunk("Dean Infotech Private Limited\n\n", FontFactory.GetFont("Arial", 16, Font.BOLD, Color.BLUE)));
                    phrase.Add(new Chunk("2380 W Honeysuckle Ln,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
                    phrase.Add(new Chunk("Chandler AZ - 85248,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
                    phrase.Add(new Chunk("United States", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
                    cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
                    cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                    cell.BorderWidth = 0;
                    table.AddCell(cell);



                    //Separater Line
                    color = new Color(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                    DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
                    DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
                    document.Add(table);

                    table = new PdfPTable(2);
                    table.HorizontalAlignment = Element.ALIGN_LEFT;
                    table.SetWidths(new float[] { 0.3f, 1f });
                    table.SpacingBefore = 20f;


                    // space


                    PdfPCell cellspace33 = new PdfPCell();
                    cellspace33.Colspan = 2;
                    cellspace33.BorderWidthBottom = 0f;
                    cellspace33.BorderWidthLeft = 0f;
                    cellspace33.BorderWidthTop = 0f;
                    cellspace33.BorderWidthRight = 0f;
                    cellspace33.MinimumHeight = 40f;
                    table.AddCell(cellspace33);


                    // Acknowledgement
                    cell = PhraseCell(new Phrase("Acknowledgement", FontFactory.GetFont("Arial", 14, Font.BOLD, Color.BLUE)), PdfPCell.ALIGN_CENTER);

                    cell.Colspan = 2;
                    cell.BorderWidth = 0;
                    table.AddCell(cell);

                    table = new PdfPTable(2);
                    table.SetWidths(new float[] { 2f, 2f });
                    table.TotalWidth = 450f;
                    table.LockedWidth = true;
                    table.SpacingBefore = 40f;
                    table.HorizontalAlignment = Element.ALIGN_RIGHT;
                    //table.AddCell(PhraseCell(new Phrase("Acknowledgement", FontFactory.GetFont("Arial", 18, Font.BOLD, Color.RED)), PdfPCell.ALIGN_MIDDLE));
                    //cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    //cell.Colspan = 2;
                    cell.PaddingBottom = 7f;
                    table.AddCell(cell);

                    //Pdf Date hh:mm:ss
                    string s = System.DateTime.Now.ToString("dd/MM/yyyy");
                    //String s = DateTime.Now.ToString("dd/MM/yyyy");
                    String s1 = System.DateTime.Now.ToString("hh:mm");
                    table.AddCell(PhraseCell(new Phrase("Dated:" + s, FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("                  Time:" + s1, FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_RIGHT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 40f;
                    table.AddCell(cell);

                    //Event name
                    table.AddCell(PhraseCell(new Phrase("Event name:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["Etitle"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);



                    table.AddCell(PhraseCell(new Phrase("Venue:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + fillgrndsrdo(dt.Rows[0]["E_grounds"].ToString()), FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);


                    //Promoter Name
                    table.AddCell(PhraseCell(new Phrase("Promoter Name:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["Fname"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);


                    //Start Date
                    table.AddCell(PhraseCell(new Phrase("Start Date:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase((dt.Rows[0]["E_startdate"]).ToString(), FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);



                    //End Date
                    table.AddCell(PhraseCell(new Phrase("End Date:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase((dt.Rows[0]["E_enddate"]).ToString(), FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);

                    /////////////Current date and time


                    //Time

                    table.AddCell(PhraseCell(new Phrase("Start Time:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["startTime"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);

                    table.AddCell(PhraseCell(new Phrase("End Time:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["EndTime"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);



                    //status

                    table.AddCell(PhraseCell(new Phrase("Status:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    if (dt.Rows[0]["status"].ToString() == "2")
                    {
                        table.AddCell(PhraseCell(new Phrase("Hold", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.RED)), PdfPCell.ALIGN_LEFT));
                    }
                    else if (dt.Rows[0]["status"].ToString() == "1")
                    {
                        table.AddCell(PhraseCell(new Phrase("Confirmed", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.GREEN)), PdfPCell.ALIGN_LEFT));
                    }
                    else if (dt.Rows[0]["status"].ToString() == "0")
                    {
                        table.AddCell(PhraseCell(new Phrase(" ", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.GREEN)), PdfPCell.ALIGN_LEFT));
                    }
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 40f;
                    table.AddCell(cell);


                    //Total Amount
                    table.AddCell(PhraseCell(new Phrase("Total Amount:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["tamt"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);


                    //Deposit Amount
                    table.AddCell(PhraseCell(new Phrase("Deposit Amount:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["damt"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 10f;
                    table.AddCell(cell);


                    //Balance Amount
                    table.AddCell(PhraseCell(new Phrase("Balance Amount:", FontFactory.GetFont("Arial", 12, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("" + dt.Rows[0]["bamt"], FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    cell.PaddingBottom = 322f;
                    table.AddCell(cell);


                    //Copyright
                    table.AddCell(PhraseCell(new Phrase("© All rights reserved by Deaninfotech Pvt Ltd. ", FontFactory.GetFont("Arial", 10, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    table.AddCell(PhraseCell(new Phrase("          1.", FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                    cell.Colspan = 2;
                    //cell.PaddingTop = 100f;
                    cell.PaddingBottom = 0f;
                    table.AddCell(cell);

                    //Separater Line
                    color = new Color(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                    DrawLine(writer, 25f, document.Top - 779f, document.PageSize.Width - 25f, document.Top - 779f, color);
                    DrawLine(writer, 25f, document.Top - 780f, document.PageSize.Width - 25f, document.Top - 780f, color);
                    document.Add(table);
                    table = new PdfPTable(2);
                    table.HorizontalAlignment = Element.ALIGN_LEFT;
                    table.SetWidths(new float[] { 0.3f, 1f });
                    table.SpacingBefore = 180f;




                    // Add Border to a page
                    //PdfContentByte content = writer.DirectContent;
                    //Rectangle rectangle = new Rectangle(document.PageSize);
                    //rectangle.Left += document.LeftMargin;
                    //rectangle.Right -= document.RightMargin;
                    //rectangle.Top -= document.TopMargin;
                    //rectangle.Bottom += document.BottomMargin;
                    //content.SetColorStroke(Color.BLACK);
                    //content.Rectangle(rectangle.Left , rectangle.Bottom, rectangle.Width, rectangle.Height);

                    //content.Stroke();



                    document.Add(table);
                    document.Close();
                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", "attachment; filename=Acknowledgement.pdf");
                    Response.ContentType = "application/pdf";
                    Response.Buffer = true;
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(bytes);
                    Response.End();
                    Response.Close();

                }
            }

            catch (Exception ex)
            {
            }
        }

        private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, Color color)
        {
            PdfContentByte contentByte = writer.DirectContent;
            contentByte.SetColorStroke(color);
            contentByte.MoveTo(x1, y1);
            contentByte.LineTo(x2, y2);
            contentByte.Stroke();
        }
        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = Color.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            return cell;
        }
        private static PdfPCell ImageCell(string path, float scale, int align)
        {
            iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
            image.ScalePercent(scale);
            PdfPCell cell = new PdfPCell(image);
            cell.BorderColor = Color.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;
        }
        public string fillgrndsrdo(string grounds)
        {
            try
            {
                string valu = "";
                string[] items = grounds.Split(',');


                if (con.State == ConnectionState.Closed)
                {

                    con.Open();
                }

                for (int j = 0; j < items.Length; j++)
                {


                    SqlCommand cmd = new SqlCommand("Select checkbox_location from chk_location where checkbox_id= " + items[j].ToString() + "", con);
                    SqlDataReader dr;

                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        valu = valu + "," + dr["checkbox_location"].ToString();
                    }


                    dr.Close();

                }

                if (con.State == ConnectionState.Open)
                {
                    con.Close();
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

        protected void btnsearch_Click(object sender, EventArgs e)
        {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    if (!string.IsNullOrEmpty(txtsearch.Value))
                    {
                        string i = Convert.ToString(0);
                        if (txtsearch.Value.Trim().ToLower() == "hold")
                        {
                            i = "Hold";
                        }
                        else if (txtsearch.Value.Trim().ToLower() == "confirmed")
                        {
                            i = "Confirmed";
                        }
                        else
                        {
                            i = txtsearch.Value.Trim();
                        }

                        string expression = " notes like '%" + i.Trim() + "%' or status like '%" + i.Trim() + "%' or Etitle like '%" + i.Trim() + "%' or Fname like '%" + i.Trim() + "%' or lname like '%" + i.Trim() + "%'";
                        DataRow[] foundRows;
                        DataTable dt = GridDataset.GetDatatable();
                        foundRows = dt.Select(expression);
                        DataTable dtt = new DataTable();
                        if (foundRows.Length > 0)
                        {
                            dtt = foundRows.CopyToDataTable();
                            grd.DataSource = dtt;
                            grd.DataBind();
                        }
                        else
                        {
                            grd.EmptyDataText = "No Record Found";
                            grd.DataBind();
                        }


                    }
                    else
                    {
                        //cmd = new SqlCommand("select e.id,e.Etitle, convert(varchar(10), e.E_startdate, 101) as E_startdate,convert(varchar(10),e.E_enddate, 101) as E_enddate,e.E_time,p.Fname, e.notes, case when  e.status  = 1 then  'Confirmed' when  e.status  = 0 then  'Hold' end as status " +
                        //" from events e left join promoters p on e.promoterid = p.id", con);

                    }

                }
                catch
                { }
        }
    }
}