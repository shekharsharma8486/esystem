using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Xml;
namespace EbookingWebProject
{
    public partial class AccessInfo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_xml();
                btnsave.Enabled = false;
                hdnPage.Value = "0";
            }


        }
        protected void Get_xml()
        {
            try
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/AccessInfo.xml"));
                if (ds != null && ds.HasChanges())
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
            catch { }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            //int id = Convert.ToInt32(txtid.Text);
            string rollname = ddlselectRole.SelectedItem.Text;
            string pagename = txtPageName.Text.Trim();
            string pageaccess = "";
            if (ckPageAccess.Checked == true)
            {
                pageaccess = "True";
            }
            if (ckPageAccess.Checked == false)
            {
                pageaccess = "False";
            }
            string pageEdit = "";
            if (chPageEdit.Checked == true)
            {
                pageEdit = "True";
            }
            if (chPageEdit.Checked == false)
            {
                pageEdit = "False";
            }
            string PageUpdate = "";
            if (chPageUpdate.Checked == true)
            {
                PageUpdate = "True";
            }
            if (chPageUpdate.Checked == false)
            {
                PageUpdate = "False";
            }
            string PageDelete = "";
            if (chPageDetele.Checked == true)
            {
                PageDelete = "True";
            }
            if (chPageDetele.Checked == false)
            {
                PageDelete = "False";
            }

            int idd = Convert.ToInt32(hdnPage.Value);
            if (idd != 0)
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(Server.MapPath("AccessInfo.xml"));

                foreach (XmlNode node in xmldoc.SelectNodes("AccessDetails/AccessInfo"))
                {
                    if (node.SelectSingleNode("Id").InnerText == idd.ToString())
                    {
                        node.SelectSingleNode("Id").InnerText = txtid.Text.Trim();
                        node.SelectSingleNode("Role").InnerText = ddlselectRole.SelectedItem.Text;
                        node.SelectSingleNode("PageName").InnerText = txtPageName.Text.Trim();
                        node.SelectSingleNode("Access").InnerText = ckPageAccess.Checked == true ? "True" : "False";
                        node.SelectSingleNode("EditAccess").InnerText = chPageEdit.Checked == true ? "True" : "False";
                        node.SelectSingleNode("UpdateAccess").InnerText = chPageUpdate.Checked == true ? "True" : "False";
                        node.SelectSingleNode("DeleteAccess").InnerText = chPageDetele.Checked == true ? "True" : "False";
                    }
                }
                xmldoc.Save(Server.MapPath("AccessInfo.xml"));

                Get_xml();
                txtid.Text = string.Empty;
                ddlselectRole.SelectedIndex = Convert.ToInt32("0");
                txtPageName.Text = string.Empty;
                ckPageAccess.Checked = false;
                chPageEdit.Checked = false;
                chPageUpdate.Checked = false;
                chPageDetele.Checked = false;
                hdnPage.Value = "0";
                Response.Redirect("Roles.aspx", false);

            }
            else
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(Server.MapPath("~/AccessInfo.xml"));
                XmlElement xelement = xmldoc.CreateElement("AccessInfo");

                XmlElement xmlname = xmldoc.CreateElement("Id");
                xmlname.InnerText = txtid.Text.Trim();
                xelement.AppendChild(xmlname);

                XmlElement xmlRoll = xmldoc.CreateElement("Role");
                xmlRoll.InnerText = ddlselectRole.SelectedItem.Text;
                xelement.AppendChild(xmlRoll);

                XmlElement xmlPageName = xmldoc.CreateElement("PageName");
                xmlPageName.InnerText = txtPageName.Text.Trim();
                xelement.AppendChild(xmlPageName);

                XmlElement xmlPage = xmldoc.CreateElement("Access");
                xmlPage.InnerText = pageaccess;
                xelement.AppendChild(xmlPage);

                XmlElement xmlEdit = xmldoc.CreateElement("EditAccess");
                xmlEdit.InnerText = pageEdit;
                xelement.AppendChild(xmlEdit);

                XmlElement xmlPageUpdate = xmldoc.CreateElement("UpdateAccess");
                xmlPageUpdate.InnerText = PageUpdate;
                xelement.AppendChild(xmlPageUpdate);


                XmlElement xmPageDelete = xmldoc.CreateElement("DeleteAccess");
                xmPageDelete.InnerText = PageDelete;
                xelement.AppendChild(xmPageDelete);

                xmldoc.DocumentElement.AppendChild(xelement);
                xmldoc.Save(Server.MapPath("~/AccessInfo.xml"));
                Get_xml();
            }


        }

        protected void ddlrole_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/AccessInfo.xml"));


            DataView view = ds.Tables[0].AsDataView();

            view.RowFilter = "Role='" + ddlrole.SelectedItem.Text + "'";
            if (ddlrole.SelectedIndex > 0)
            {

                GridView1.DataSource = view;
                GridView1.DataBind();
            }
            else
            {
                DataSet dss = new DataSet();
                dss.ReadXml(Server.MapPath("~/AccessInfo.xml"));
                GridView1.DataSource = dss;
                GridView1.DataBind();
            }


        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Get_xml();

        }
    }
}