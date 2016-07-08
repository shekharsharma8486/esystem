using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using System.Data.SqlClient;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
	[OperationContract]
	void DoWork();
    [OperationContract]
    DataSet BindAllEditPageDate(int id);
    [OperationContract]
    void updateEvent(EventsDetails objEventsDetails1);
     [OperationContract]
    DataSet FillGridAdmin();
    [OperationContract]
     void UpdateAdminRole(EventsDetails objEventsDetails1);
    [OperationContract]
    void DeleteAdminRole(EventsDetails objEventsDetails1);
}
[DataContract]
public  class EventsDetails
{
    int id;
    string etitle;
    DateTime E_startdate;
    DateTime E_enddate;
    string E_time;
    string E_grounds;
    string E_notification1;
    string E_notification2;
    string E_notification3;
    bool rcmain;
    bool rccerti;
    bool rclay;
    DateTime rcmaindate;
    DateTime rccertidate;
    DateTime rclaydate;
    DateTime RCOpBalRecived;
    string ebalancerecive;
    bool Ebalance;
    string attachmentid;
    string Fname;
    string Lname;
    string email;
    string phone;
    string status;
    string attachment1;
    string attachment2;
    string attachment3;
    string attachment4;
    string attachment5;
    string curr;
    string tamt;
    string damt;
    string bamt;
    string Notes;
    string chk_promoter;
    int idd;
    string startTime;
    string EndTime;
    string role;
    string password;
    string btntext;
    string adminID;
    int Updateid;

    
    [DataMember]
    public int ID
    {
        get { return id; }
        set { id = value; }
    }

    [DataMember]
    public string Etitle
    {
        get { return etitle; }
        set { etitle = value; }
    }

    [DataMember]
    public DateTime E_Startdate
    {
        get { return E_startdate; }
        set { E_startdate = value; }
    }
    [DataMember]
    public DateTime E_Enddate
    {
        get { return E_enddate; }
        set { E_enddate = value; }
    }

    [DataMember]
    public string E_Time
    {
        get { return E_time; }
        set { E_time = value; }
    }

    [DataMember]
    public string E_Grounds
    {
        get { return E_grounds; }
        set { E_grounds = value; }
    }

    [DataMember]
    public string E_Notification1
    {
        get { return E_notification1; }
        set { E_notification1 = value; }
    }

    [DataMember]
    public string E_Notification2
    {
        get { return E_notification2; }
        set { E_notification2 = value; }
    }

    [DataMember]
    public string E_Notification3
    {
        get { return E_notification3; }
        set { E_notification3 = value; }
    }

    [DataMember]
    public bool RCmain
    {
        get { return rcmain; }
        set { rcmain = value; }
    }

    [DataMember]
    public bool RCcerti
    {
        get { return rccerti; }
        set { rccerti = value; }
    }

    [DataMember]
    public bool RClay
    {
        get { return rclay; }
        set { rclay = value; }
    }

    [DataMember]
    public DateTime RCmaindate
    {
        get { return rcmaindate; }
        set { rcmaindate = value; }
    }

    [DataMember]
    public DateTime RCcertidate
    {
        get { return rccertidate; }
        set { rccertidate = value; }
    }

    [DataMember]
    public DateTime RClaydate
    {
        get { return rclaydate; }
        set { rclaydate = value; }
    }

    [DataMember]
    public DateTime RCOpBalReciveD
    {
        get { return RCOpBalRecived; }
        set { RCOpBalRecived = value; }
    }

    [DataMember]
    public string EBalancerecive
    {
        get { return ebalancerecive; }
        set { ebalancerecive = value; }
    }

    [DataMember]
    public bool EBalance
    {
        get { return Ebalance; }
        set { Ebalance = value; }
    }


    [DataMember]
    public string Attachmentid
    {
        get { return attachmentid; }
        set { attachmentid = value; }
    }
    [DataMember]
    public string FName
    {
        get { return Fname; }
        set { Fname = value; }
    }

    [DataMember]
    public string LName
    {
        get { return Lname; }
        set { Lname = value; }
    }

    [DataMember]
    public string EMail
    {
        get { return email; }
        set { email = value; }
    }


    [DataMember]
    public string PHone
    {
        get { return phone; }
        set { phone = value; }
    }

    [DataMember]
    public string STatus
    {
        get { return status; }
        set { status = value; }
    }

    [DataMember]
    public string Attachment1
    {
        get { return attachment1; }
        set { attachment1 = value; }
    }

    [DataMember]
    public string Attachment2
    {
        get { return attachment2; }
        set { attachment2 = value; }
    }

    [DataMember]
    public string Attachment3
    {
        get { return attachment3; }
        set { attachment3 = value; }
    }

    [DataMember]
    public string Attachment4
    {
        get { return attachment4; }
        set { attachment4 = value; }
    }

    [DataMember]
    public string Attachment5
    {
        get { return attachment5; }
        set { attachment5 = value; }
    }

    [DataMember]
    public string CUrr
    {
        get { return curr; }
        set { curr = value; }
    }

    [DataMember]
    public string TAmt
    {
        get { return tamt; }
        set { tamt = value; }
    }

    [DataMember]
    public string DAmt
    {
        get { return damt; }
        set { damt = value; }
    }

    [DataMember]
    public string BAmt
    {
        get { return bamt; }
        set { bamt = value; }
    }

    [DataMember]
    public string NoTes
    {
        get { return Notes; }
        set { Notes = value; }
    }

    [DataMember]
    public string Chk_Promoter
    {
        get { return chk_promoter; }
        set { chk_promoter = value; }
    }

    [DataMember]
    public int iDD
    {
        get { return idd; }
        set { idd = value; }
    }

    [DataMember]
    public string StartTime
    {
        get { return startTime; }
        set { startTime = value; }
    }

    [DataMember]
    public string EndTIME
    {
        get { return EndTime; }
        set { EndTime = value; }
    }
    [DataMember]
    public string Role
    {
        get { return role; }
        set { role = value; }
    }
    [DataMember]
    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    [DataMember]
    public string BtnText
    {
        get { return btntext; }
        set { btntext = value; }
    }
    [DataMember]
    public string AdminID
    {
        get { return adminID; }
        set { adminID = value; }
    }
    [DataMember]
    public int UPDATEId
{
    get { return Updateid; }
    set { Updateid = value; }
}
}

     
     


