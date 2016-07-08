using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

/// <summary>
/// Summary description for ClassMailPermission
/// </summary>
public class ClassMailPermission
{
	public ClassMailPermission()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static DataTable dtloginPermission
    { get; set; }
    public static DataTable GetloginPermission()
    {
        return dtloginPermission;
    
    }
    public static void SetLoginPermission(DataTable dt)
    {
        dtloginPermission = dt;    
    }
}