using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
	public void DoWork()
	{
	}
    public DataSet  BindAllEditPageDate(int id)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("prcBindAllEditPageDate", sqlcon);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@id",id);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        ad.Fill(ds);
        return ds;
    }

    public void updateEvent(EventsDetails objEventsDetails)
    {
       
        try
        {
            

            SqlCommand cmd = new SqlCommand("sp_UpdateEvent", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", objEventsDetails.ID);
            cmd.Parameters.AddWithValue("@etitle",objEventsDetails.Etitle );
            cmd.Parameters.AddWithValue("@E_startdate",objEventsDetails.E_Startdate);

            cmd.Parameters.AddWithValue("@E_enddate",objEventsDetails.E_Enddate );


            cmd.Parameters.AddWithValue("@E_time",objEventsDetails.E_Time );


            cmd.Parameters.AddWithValue("@E_grounds", objEventsDetails.E_Grounds);

            cmd.Parameters.AddWithValue("@E_notification1",objEventsDetails.E_Notification1 );
            cmd.Parameters.AddWithValue("@E_notification2",objEventsDetails.E_Notification2 );
            cmd.Parameters.AddWithValue("@E_notification3", objEventsDetails.E_Notification3);





            cmd.Parameters.AddWithValue("@rcmain",objEventsDetails.RCmain );
            cmd.Parameters.AddWithValue("@rccerti",objEventsDetails.RCcerti );
            cmd.Parameters.AddWithValue("@rclay", objEventsDetails.RClay);
            cmd.Parameters.AddWithValue("@rcmaindate",objEventsDetails.RCmaindate );
            cmd.Parameters.AddWithValue("@rccertidate",objEventsDetails.RCcertidate);
            cmd.Parameters.AddWithValue("@rclaydate",objEventsDetails.RClaydate );

            cmd.Parameters.AddWithValue("@RCOpBalRecived", objEventsDetails.RCOpBalReciveD);

            cmd.Parameters.AddWithValue("@ebalancerecive",objEventsDetails.EBalance);
            cmd.Parameters.AddWithValue("@Ebalance", objEventsDetails.EBalance);
           
                cmd.Parameters.AddWithValue("@attachmentid",objEventsDetails.Attachmentid );



            
           
            // cmd.Parameters.AddWithValue("@idd", lblpid.Value);
            cmd.Parameters.AddWithValue("@Fname", objEventsDetails.FName);
            cmd.Parameters.AddWithValue("@Lname", objEventsDetails.LName);
            cmd.Parameters.AddWithValue("@email",objEventsDetails.EMail);
            cmd.Parameters.AddWithValue("@phone",objEventsDetails.PHone );
            cmd.Parameters.AddWithValue("@status",objEventsDetails.STatus);

            cmd.Parameters.AddWithValue("@attachment1",objEventsDetails.Attachment1 );
            cmd.Parameters.AddWithValue("@attachment2", objEventsDetails.Attachment2);
            cmd.Parameters.AddWithValue("@attachment3", objEventsDetails.Attachment3);
            cmd.Parameters.AddWithValue("@attachment4",objEventsDetails.Attachment4 );
            cmd.Parameters.AddWithValue("@attachment5", objEventsDetails.Attachment5);
            cmd.Parameters.AddWithValue("@curr",objEventsDetails.CUrr );
            cmd.Parameters.AddWithValue("@tamt",objEventsDetails.TAmt );
            cmd.Parameters.AddWithValue("@damt",objEventsDetails.DAmt );





            cmd.Parameters.AddWithValue("@bamt",objEventsDetails.BAmt);
            cmd.Parameters.AddWithValue("@Notes", objEventsDetails.NoTes);
           
                    cmd.Parameters.AddWithValue("@chk_promoter",objEventsDetails.Chk_Promoter);

                    cmd.Parameters.AddWithValue("@idd",objEventsDetails.iDD);
               
              

            cmd.Parameters.AddWithValue("@startTime",objEventsDetails.StartTime );
            cmd.Parameters.AddWithValue("@EndTime", objEventsDetails.E_Time);
            cmd.Parameters.AddWithValue("@UpdateId", objEventsDetails.UPDATEId);

            
            sqlcon.Open();
            cmd.ExecuteNonQuery();
            sqlcon.Close();
          
        }
        catch(Exception ex)
        {

        }
       
    }

    public DataSet FillGridAdmin()
    {
        DataSet ds = new DataSet();
        SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        try
        {
            SqlCommand cmd = new SqlCommand("select * from admin", sqlcon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
        
            //gridinfo = ds.GetXml();
        }
        catch { }
        return ds;
    }
    public void UpdateAdminRole(EventsDetails objEventsDetails)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("prcUpdateAdminInfo", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", objEventsDetails.AdminID);
            cmd.Parameters.AddWithValue("@Fname", objEventsDetails.FName);
            cmd.Parameters.AddWithValue("@Lname", objEventsDetails.LName);
            cmd.Parameters.AddWithValue("@email", objEventsDetails.EMail);
            cmd.Parameters.AddWithValue("@phone", objEventsDetails.PHone);
            cmd.Parameters.AddWithValue("@pwd", objEventsDetails.Password);
            cmd.Parameters.AddWithValue("@role", objEventsDetails.Role);
            cmd.Parameters.AddWithValue("@btntext", objEventsDetails.BtnText);
            sqlcon.Open();
            cmd.ExecuteNonQuery();
            sqlcon.Close();
        
        }
        catch { 
        
        }
    }

    public void DeleteAdminRole(EventsDetails objEventsDetails)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("prcdeleteAdmin", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", objEventsDetails.AdminID);
            sqlcon.Open();
            cmd.ExecuteNonQuery();
            sqlcon.Close();

        }
        catch
        {

        }
    }
}
