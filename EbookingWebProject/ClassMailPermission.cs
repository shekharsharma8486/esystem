using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

namespace EbookingWebProject
{
    public class ClassMailPermission
    {
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
}