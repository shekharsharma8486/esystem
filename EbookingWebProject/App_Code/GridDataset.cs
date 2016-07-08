using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for GridDataset
/// </summary>
public class GridDataset
{
	public GridDataset()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
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
}