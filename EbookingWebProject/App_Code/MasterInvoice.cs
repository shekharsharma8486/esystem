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

/// <summary>
/// Summary description for MasterInvoice
/// </summary>
public class MasterInvoice
{
    SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
	public MasterInvoice()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}