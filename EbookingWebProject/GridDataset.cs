using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace EbookingWebProject
{
    public class GridDataset
    {
        public static DataTable dttable
        { get; set; }
        //static DataTable dt = new DataTable();
        public static DataTable GetDatatable()
        {
            return dttable;
        }
        public static void SetDatatable(DataTable dt1)
        {
            dttable = dt1;

        }

        public static int uid
        { get; set; }
        //static DataTable dt = new DataTable();
        public static int Getuid()
        {
            return uid;
        }
        public static void Setuid(int userid)
        {
            uid = userid;

        }

        public static DataTable dtSmtp
        { get; set; }
        //static DataTable dt = new DataTable();
        public static DataTable GetdtSmtp()
        {
            return dtSmtp;
        }
        public static void SetdtSmtp(DataTable dtSmtpSetting)
        {
            dtSmtp = dtSmtpSetting;

        }
    }

}