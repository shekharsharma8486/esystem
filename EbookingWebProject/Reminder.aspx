<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Reminder.aspx.cs" Inherits="EbookingWebProject.Reminder1" %>


<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    

     <link rel="icon" href="favicon.ico" type="image/png">
    <link href='fullcalendar.css' rel='stylesheet' />
    <link href='fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='lib/moment.min.js'></script>
    <script src='lib/jquery.min.js'></script>
    <script src='fullcalendar.min.js'></script>
    <link rel="shortcut icon" href="images/deanheader.jpg">
    <link rel="icon" type="image/gif" href="images/deanheader.jpg" />
    <link href="css/SearchBox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <style type="text/css">
        .black_overlay
        {
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content
        {
            display: none;
            position: absolute;
            top: 5%;
            left: 5%;
            width: 80%;
            height: 90%;
            padding: 6px;
            border: 6px solid orange;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
    </style>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
     m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-56891095-1', 'auto');
        ga('send', 'pageview');

    </script>
   

    <script type="text/javascript">
        function changediv() {


            document.getElementById("<%=DivMailSetUp.ClientID%>").style.display = "block";
            document.getElementById("<%=divShowSetting.ClientID%>").style.display = "none";

            CKEDITOR.instances["<%=CKEditor1.ClientID%>"].setData("Dear" + " &nbsp;&nbsp; " + "<span style='color:Red;'>" + "[UserName]" + "</span>" + "<br/>"
         + "<br/>" + "Start Date" + " &nbsp; &nbsp; " + "<span style='color:Red;'>" + "[StartDate]" + "</span>" + "<br/>"
        + "<br/>" + "Start Time" + " &nbsp;&nbsp; " + "<span style='color:Red;'>" + "[StartTime]" + "</span>" + "<br/>"
         + "<br/>" + "End Date" + " &nbsp; &nbsp; " + "<span style='color:Red;'>" + "[EndDate]" + "</span>" +
          "<br/>" + "End Time" + " &nbsp; &nbsp; " + "<span style='color:Red;'>" + "[EndTime]" + "</span>" + "<br/>" +
          "<br/>" + "Your Body Content Goes Here...");

            return false;
        }
    </script>
    <script type="text/javascript">
        function changedivold() {

            document.getElementById("light1").style.display = "none";
            document.getElementById("fade").style.display = "none";
            document.getElementById("fade").style.display = "none";
            document.getElementById("<%=DivMailSetUp.ClientID%>").style.display = "none";
            document.getElementById("<%=divShowSetting.ClientID%>").style.display = "block";
            
            return false;



           
        }
    </script>
    <asp:HiddenField ID="HiddenField1" runat="server" />

    <asp:HiddenField ID="HiddenFieldMailTo" runat="server" />
    <script type="text/javascript">
        //debugger;
        function fillCkeditor(idr) {

        
          
            document.getElementById("light12").style.display = "block";
            document.getElementById("fade").style.display = "block";
            
            var ckvalue = idr;
            document.getElementById("<%=HiddenField1.ClientID%>").value = ckvalue;

            PageMethods.FillMailInfo(ckvalue, onsuccess, onfail);

            function onsuccess(value) {

                if (value != "yy") {
                    var data = value.split("~");
                    var rb1 = document.getElementById("<%=rb1.ClientID %>");
                    rb1.checked = true;
                    document.getElementById("<%=ddlMailEvent.ClientID%>").value = data[0];
                    CKEDITOR.instances["<%=CKEditor1.ClientID%>"].setData(data[1]);
                    document.getElementById("<%=txtsubject.ClientID%>").value = data[2];
                    var ck = data[3];

                    if (ck == 'False') {
                        document.getElementById("<%=chkConfirmMail.ClientID%>").checked = false;

                    }
                    else if (ck == 'True') {
                        document.getElementById("<%=chkConfirmMail.ClientID%>").checked = true;
                    }

                    document.getElementById("<%=DivMailSetUp.ClientID%>").style.display = "block";
                    document.getElementById("<%=divShowSetting.ClientID%>").style.display = "none";

                    document.getElementById("<%=ddlMailEvent.ClientID%>").SelectedIndex = ckvalue;
                    document.getElementById("<%=divTable.ClientID%>").style.display = "block";
                    document.getElementById("<%=DivNodti.ClientID%>").style.display = "none";
                    var parm = document.getElementById("<%=ddlMailEvent.ClientID%>");
                    document.getElementById("<%=HiddenFieldMailTo.ClientID%>").value = parm.options[parm.selectedIndex].text;
                }
                if (value == "yy") {
                    var rb1 = document.getElementById("<%=rb1.ClientID %>");
                    rb1.checked = true;

                    document.getElementById("<%=DivMailSetUp.ClientID%>").style.display = "block";
                    document.getElementById("<%=divShowSetting.ClientID%>").style.display = "none";

                    document.getElementById("<%=ddlMailEvent.ClientID%>").value = ckvalue;
                    document.getElementById("<%=divTable.ClientID%>").style.display = "block";
                    document.getElementById("<%=DivNodti.ClientID%>").style.display = "none";
                    var parm = document.getElementById("<%=ddlMailEvent.ClientID%>");
                    document.getElementById("<%=HiddenFieldMailTo.ClientID%>").value = parm.options[parm.selectedIndex].text;
                    CKEDITOR.instances["<%=CKEditor1.ClientID%>"].setData("No mail Format Set Yet....!!!!");

                }

            }
            function onfail() {

                alert("Error");
                return false;
            }

        }
    </script>
    <script type="text/javascript">

        function fillCkeditorr2(idr) {

            document.getElementById("light12").style.display = "block";
            document.getElementById("fade").style.display = "block";
           
            var ckvalue = idr;

            document.getElementById("<%=HiddenField1.ClientID%>").value = ckvalue;

            PageMethods.FillMailInfo(ckvalue, onsuccess, onfail);

            function onsuccess(value) {

                if (value != "yy") {
                    var data = value.split("~");
                    var rb2 = document.getElementById("<%=rb2.ClientID %>");
                    rb2.checked = true;

                    document.getElementById("<%=ddlNofication.ClientID%>").value = data[0];
                    CKEDITOR.instances["<%=CKEditor1.ClientID%>"].setData(data[1]);
                    document.getElementById("<%=txtsubject.ClientID%>").value = data[2];
                    var ck = data[3];
                    var timeinter = data[4];


                    if (ck == 'False') {
                        document.getElementById("<%=chkConfirmMail.ClientID%>").checked = false;

                    }
                    else if (ck == 'True') {
                        document.getElementById("<%=chkConfirmMail.ClientID%>").checked = true;
                    }
                if (timeinter == '24') {
                    document.getElementById("<%=RadioButton1.ClientID %>").checked = true;
                }
                if (timeinter == '48') {
                    document.getElementById("<%=RadioButton2.ClientID %>").checked = true;
                }
                if (timeinter == '72') {
                    document.getElementById("<%=RadioButton3.ClientID %>").checked = true;
                    }
                    document.getElementById("<%=divEvantMailSetUp.ClientID %>").style.display = "none";
                    document.getElementById("<%=divNotificationSetUp.ClientID %>").style.display = "block";
                    document.getElementById("<%=DivMailSetUp.ClientID%>").style.display = "block";
                    document.getElementById("<%=divShowSetting.ClientID%>").style.display = "none";

                    document.getElementById("<%=ddlNofication.ClientID%>").SelectedIndex = ckvalue;
                    document.getElementById("<%=divTable.ClientID%>").style.display = "none";
                    document.getElementById("<%=DivNodti.ClientID%>").style.display = "block";
                    var parm = document.getElementById("<%=ddlNofication.ClientID%>");
                    document.getElementById("<%=HiddenFieldMailTo.ClientID%>").value = parm.options[parm.selectedIndex].text;



                }
                if (value == "yy") {
                    //alert(ckvalue);
                    document.getElementById("<%=divEvantMailSetUp.ClientID %>").style.display = "none";
                    document.getElementById("<%=divNotificationSetUp.ClientID %>").style.display = "block";
                    document.getElementById("<%=DivMailSetUp.ClientID%>").style.display = "block";
                    document.getElementById("<%=divShowSetting.ClientID%>").style.display = "none";

                    document.getElementById("<%=ddlNofication.ClientID%>").value = ckvalue;
                    document.getElementById("<%=divTable.ClientID%>").style.display = "none";
                    document.getElementById("<%=DivNodti.ClientID%>").style.display = "block";
                    var parm = document.getElementById("<%=ddlNofication.ClientID%>");
                    document.getElementById("<%=HiddenFieldMailTo.ClientID%>").value = parm.options[parm.selectedIndex].text;
                    CKEDITOR.instances["<%=CKEditor1.ClientID%>"].setData("No mail Format Set Yet....!!!!");
                }

            }
            function onfail() {

                alert("Error");
                return false;
            }

        }
    </script>
    <script type="text/javascript">
        function show() {   
        
           document.getElementById("light1").style.display = "none";
           document.getElementById("fade").style.display = "none";
           document.getElementById("fade").style.display = "none";
            return false;
        }
    </script>
  <style>
  table{width:100% !important;}
  td{line-height:22px; font-size:14px;}
  td h3{ margin:10px; font-size:14px;}
  h2{margin-top:6px;}
  
  .popup2{width:100%; height:530px; overflow-y: auto;}
  .check-box{width:20px; float:left; margin-top:7px;}
  .content-for{width:86%; float:left;}
  .content-for2{width:30%; float:left;}
  .content-for3{width:55%; float:left;}
  .button-fof{width:100px; float:left;}
  
  
  .Event-Mail-Setup-for{width:40%; float:left; margin-bottom:10px;}
  .Event-Mail-Setup-for-creator{ width:50%; float:left; margin-bottom:10px;}
  .mail-send-col{width:100%; float:left; margin-bottom:10px;}
  .hi-admin-col{width:100%; float:left; margin-bottom:10px;}
  .Note-col{ width:100%; float:left; margin-bottom:10px;}
  .user-name-col{width:30%; float:left; margin-bottom:10px;}
  .user-name-dyn-col{ color:#900; font-size:14px;} 
  .user-name-col-botton{display:block !important; float:left !important; margin-bottom:10px; color: #fff; font-size: 12px; text-align: center; background: #2c8fb0 !important; line-height: 22px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 2px 10px;  margin-right: 20px;}
   .user-name-col-botton input{background:none !important;}
  
  .table-col-for-button{ width:200px !important; float:left; margin-left:40%;}
  
  @media (min-width:320px) and (max-width:768px) {
	  
	  
	   table{width:96% !important; margin:0 auto; font-size:10px !important; }
  td{line-height:22px; font-size:10px;}
  td h3{ margin:10px; font-size:10px;}
  h2{margin-top:6px;}
  
  .popup2{width:100%; height:490px;}
  .check-box{width:20px; float:left; margin-top:4px;}
  .content-for{width:65%; float:left;}
  .content-for2{width:34%; float:left;}
  .content-for3{width:58%; float:left;}
  .button-fof{width:85px; float:right; margin-top:5px; }
  
   .black_overlay
        {
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content
        {
            display: none;
            position: absolute;
            top: 5%;
            left:10%;
            width: 80%;
            height:300px;
            padding: 6px;
            border: 6px solid orange;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
		.table-col-for-button{ width:200px !important; float:left; margin-left:10%;}
		
		
  .Event-Mail-Setup-for{width:40%; float:left; margin-bottom:10px;}
  .Event-Mail-Setup-for-creator{ width:50%; float:left; margin-bottom:10px;}
  .mail-send-col{width:100%; float:left; margin-bottom:10px;}
  .hi-admin-col{width:100%; float:left; margin-bottom:10px;}
  .Note-col{ width:100%; float:left; margin-bottom:10px;}
  .user-name-col{width:100%; float:left; margin-bottom:10px;}
  .user-name-dyn-col{ color:#900; font-size:14px;} 
  .col-sm-10{z-index:9999;}
  }
   @media (min-width:1600px) and (max-width:1900px) {
  
   .popup2{width:100%; height:630px;}
   }
  
  </style>
  
  
  <div id="full-width">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12" style="padding: 0px;">
                            <div class="col-sm-1">&nbsp;</div>
                            <div class="col-sm-10">
                                <div class="manage-col">
                                 
    <div id="content" class="popup2">

        <div id="divShowSetting" runat="server">
           <div class="manage-col-left-head">  <p class="popup_main_heading">Admin [Email Setting]</p></div>
           <%-- <asp:Button ID="btnMailSetUp" runat="server" Text="Mail Set Up" OnClientClick=" changediv();return false" />--%>
            <a onclick="return  changediv();" href="javascript:noAction();" style="display:none;">Mail Set Up</a>
            <br />
             <h2 class="popup_main_heading" style="background: #e6e6e6 none repeat scroll 0 0;
    border-bottom: 4px solid #272f45;
    border-top: 4px solid #272f45;
    float: left;
    padding: 5px 10px; font-size:20px;
    width: 100%;">Events</h2>
    <div class="clear"></div>
            <table ><tr>
                    <td class="check-box" > 
                        <asp:CheckBox ID="chkEventCreater" runat="server" Enabled="false" />
                    </td>
                    <td class="content-for">
                        <h3 class="popup_main_heading">Send Mail to login User/Event Creator</h3>
                    </td>
                    <td class="button-fof">
                        <a onclick="return fillCkeditor('1');" href="javascript:noAction();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;">Mail View</a>
                    </td>
                </tr><tr>
                    <td class="check-box">
                        <asp:CheckBox ID="checlient" runat="server" Enabled="false" />
                    </td>
                    <td  class="content-for">
                        <h3 class="popup_main_heading">Mail to Client</h3>
                    </td>
                  <td class="button-fof">
                        <a onclick="return fillCkeditor('2');" href="javascript:noAction();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;">Mail View</a>
                    </td>
                </tr><tr>
                    <td class="check-box">
                        <asp:CheckBox ID="chkEmpReminder" runat="server" Enabled="false" />
                    </td>
                    <td  class="content-for">
                        <h3 class="popup_main_heading">Mail to Employee Reminder</h3>
                    </td>
                     <td class="button-fof">
                        <a onclick="return fillCkeditor('3');" href="javascript:noAction();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;">Mail View</a>
                    </td>
                </tr>
            </table>
            <br />
            <div>
                <h2 class="popup_main_heading" style="background: #e6e6e6 none repeat scroll 0 0;
    border-bottom: 4px solid #272f45;
    border-top: 4px solid #272f45;
    float: left;
    padding: 5px 10px; font-size:20px;
    width: 100%;">Notification [Reminder]</h2>
    <div class="clear"></div>
                <table><tr>
                        <td class="check-box">
                            <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" />
                        </td>
                        <td  class="content-for2">
                            <h3 class="popup_main_heading">Mail To Admin:-</h3>
                        </td>
                        <td  class="content-for3">
                            <asp:RadioButton ID="rbn24" runat="server" GroupName="bfhh" Enabled="false" />24
                            hour Before
                            <asp:RadioButton ID="rbn48" runat="server" GroupName="bfhh" Enabled="false" />48
                            hour Before
                            <asp:RadioButton ID="rbn72" runat="server" GroupName="bfhh" Enabled="false" />72
                            hour Before
                        </td>
                           <td class="button-fof">&nbsp;&nbsp; <a onclick="return fillCkeditorr2('5');" href="javascript:noAction();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;">Mail View</a>
                        </td>
                    </tr><tr>
                        <td class="check-box">
                            <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" />
                        </td>
                        <td  class="content-for2">
                            <h3 class="popup_main_heading">Mail to Client:-</h3>
                        </td>
                      <td  class="content-for3">
                            <asp:RadioButton ID="RadioButton4" runat="server" GroupName="bfh1" Enabled="false" />24
                            hour Before
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="bfh1" Enabled="false" />48
                            hour Before
                            <asp:RadioButton ID="RadioButton6" runat="server" GroupName="bfh1" Enabled="false" />72
                            hour Before
                        </td>
                          <td class="button-fof">&nbsp;&nbsp; <a onclick="return fillCkeditorr2('6');" href="javascript:noAction();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;">Mail View</a>
                        </td>
                    </tr><tr>
                        <td class="check-box">
                            <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false" />
                        </td>
                        <td  class="content-for2">
                            <h3 class="popup_main_heading">Mail to Notification User:-</h3>
                        </td>
                       <td  class="content-for3">
                            <asp:RadioButton ID="RadioButton7" runat="server" GroupName="bfhh1" Enabled="false" />24
                            hour Before
                            <asp:RadioButton ID="RadioButton8" runat="server" GroupName="bfhh1" Enabled="false" />48
                            hour Before
                            <asp:RadioButton ID="RadioButton9" runat="server" GroupName="bfhh1   " Enabled="false" />72
                            hour Before
                        </td>
                         <td class="button-fof">&nbsp;&nbsp; <a onclick="return fillCkeditorr2('7');" href="javascript:noAction();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;">Mail View</a>
                        </td>
                    </tr>
                </table>
            </div>
           

               
            
            <div>
                <h2 class="popup_main_heading" style="background: #e6e6e6 none repeat scroll 0 0;
    border-bottom: 4px solid #272f45;
    border-top: 4px solid #272f45;
    float: left;
    padding: 5px 10px; font-size:20px;
    width: 100%;">SMTP [Setting]</h2>
    <div class="clear"></div>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:CheckBox ID="chkSMTP" runat="server" OnCheckedChanged="chkSMTP_CheckedChanged" Text="Edit:-" AutoPostBack="true"/>

                <asp:Panel ID="Panel1" runat="server" ClientIDMode="Static">
                  <table style="color:#666;  font-weight:normal;"> <tr>
                    <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label>
                       
                        <td >
                            <asp:HiddenField ID="hdnAutoId" runat="server" />
                             <label style="margin-right:10px;  width:130px;  font-weight:normal;">From Address</label><asp:TextBox ID="txtFromAddress" ClientIDMode="Static" runat="server" Style="border:solid !important;" BorderStyle="Solid"></asp:TextBox></td>
                            <td>  <label style="margin-right:10px;  width:120px;  font-weight:normal;">Display Name</label><asp:TextBox ID="txtdisplayname" ClientIDMode="Static" runat="server" Style="border:solid !important;" BorderStyle="Solid"></asp:TextBox></td>
                             <td> <label style="margin-right:10px;  width:120px;  font-weight:normal;"> Mail Server</label><asp:TextBox ID="txtmailServer" ClientIDMode="Static" runat="server" Style="border:solid !important;" BorderStyle="Solid"></asp:TextBox></td></tr>
                           <tr><td  style="padding-top: 20px !important;">  <label style="margin-right:10px;  width:130px;  font-weight:normal;"> NetWrok UserName</label><asp:TextBox ID="txtnetwrkUsername" ClientIDMode="Static" runat="server"  Style="border:solid !important;" BorderStyle="Solid"></asp:TextBox>
                        </td>
                    <td  style="padding-top: 20px !important;">
                             <label style="margin-right:10px;  width:120px;  font-weight:normal;"> Password</label><asp:TextBox ID="txtNetworlPwd" runat="server" ClientIDMode="Static" BorderStyle="Solid" Style="border:solid !important;"></asp:TextBox></td>
                             <td  style="padding-top: 20px !important;"> <label style="margin-right:10px;  width:120px;  font-weight:normal;"> Mail Port</label><asp:TextBox ID="txtMailPort" runat="server" ClientIDMode="Static" BorderStyle="Solid" Style="border:solid !important;"></asp:TextBox></td></tr>
                             <tr>
                            <td  style="padding-top: 20px !important;"> <label style="margin-right:10px;  width:130px;  font-weight:normal;">Enable Ssl</label><asp:CheckBox ID="chkEnbledSsl" runat="server"  ClientIDMode="Static" Style="border:solid !important;"/>
                        </td>
                           <td class="button-fof"  style="padding-top: 20px !important;">&nbsp;&nbsp; 
                               
         
                               <asp:Button ID="btnSmtp" runat="server" Text="Active" OnClick="btnSmtp_Click"  style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;"/>
                        </td>
                    </tr>
                </table>
                  </asp:Panel>
                </ContentTemplate>
                  <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="chkSMTP" EventName="CheckedChanged" />
                  </Triggers>
            </asp:UpdatePanel>
                <table  style="color:#666; font-weight:normal;">
                    <tr>
                        <td  style="padding-top: 20px !important;">
                            <label style="margin-right:10px;  width:126px;  font-weight:normal;">  Eamil Id</label>
                       
                            <asp:TextBox ID="txtDummyEmail" runat="server" ClientIDMode="Static" BorderStyle="Solid" Style="border:solid !important;"></asp:TextBox>
                            
                            
                        &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="btnDummy" runat="server" Text="Send Dummy Mail" OnClick="btnDummy_Click" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                        </td>
                        <td>
                          
                        </td>
                    </tr>
                </table>
            </div>
                
               </div>      
    
        <script type="text/javascript">
            function ckevalidation() {
                var ddlmailtype = document.getElementById("<%=ddlMailEvent.ClientID %>");

                var txtsubject = document.getElementById("<%=txtsubject.ClientID %>").value;
                var rb1 = document.getElementById("<%=rb1.ClientID %>");
                var rb2 = document.getElementById("<%=rb2.ClientID %>");
                if (rb1.checked == true) {
                    //  if (ddlmailtype.value == '0') {

                    //     alert("Please Select Mail Type.");
                    //    document.getElementById("<%=ddlNofication.ClientID %>").selectedIndex = 4;
                    //    return false;
                    // }
                    if (txtsubject)
                    { }
                    else {

                        alert("Please Enter Subject To Mail.");
                        document.getElementById("<%=txtsubject.ClientID %>").focus();
                        return false;
                    }
                }
                if (rb2.checked == true) {
                    var ddlNotificationtype = document.getElementById("<%=ddlNofication.ClientID %>");
                    var ddlnoty = ddlNotificationtype.options[ddlNotificationtype.selectedIndex].text;
                    var ddltimevalue = ddlNotificationtype.options[ddlNotificationtype.selectedIndex].value;

                    // if (ddltimevalue == '4') {

                    //    alert("Please Select Mail Type.");
                    //    document.getElementById("<%=ddlMailEvent.ClientID %>").selectedIndex = 0;
                    //   return false;

                    //  }

                    if (txtsubject)
                    { }
                    else {

                        alert("Please Enter Subject To Mail.");
                        document.getElementById("<%=txtsubject.ClientID %>").focus();
                        return false;
                    }
                }

            }


        </script>
        <script type="text/javascript">
            function onrbnchange() {
                var rb1 = document.getElementById("<%=rb1.ClientID %>");
                var rb2 = document.getElementById("<%=rb2.ClientID %>");
                if (rb1.checked == true) {
                    document.getElementById("<%=divEvantMailSetUp.ClientID %>").style.display = "block";
                    document.getElementById("<%=divNotificationSetUp.ClientID %>").style.display = "none";
                    return false;
                }
                if (rb2.checked == true) {
                    document.getElementById("<%=divEvantMailSetUp.ClientID %>").style.display = "none";
                    document.getElementById("<%=divNotificationSetUp.ClientID %>").style.display = "block";
                    return false;
                }

            }
        </script>
        
        
    <div id="light12"  class="white_content">
      

        

        <div id="DivMailSetUp" runat="server" style="display: inline;">
          
            <asp:RadioButton ID="rb1" runat="server" GroupName="ev1" Checked="true" onchange="return onrbnchange();" style="display: none;" />
            
            <asp:RadioButton ID="rb2" runat="server" GroupName="ev1" onchange="return onrbnchange();" style="display: none;" />
            <div id="divEvantMailSetUp" runat="server" style="line-height:32px !important;">
                Event Mail-Setup:-<asp:DropDownList ID="ddlMailEvent" runat="server" Enabled="false" style=" border:1px #09C solid; margin-left:20px;">
                    <asp:ListItem Text="Select ev1" Value="0">--Select Event--</asp:ListItem>
                    <asp:ListItem Text="Select ev2" Value="1">Send Mail to Event Creator</asp:ListItem>
                    <asp:ListItem Text="Select ev3" Value="2">Mail to Client</asp:ListItem>
                    <asp:ListItem Text="Select ev4" Value="3">Mail to Employee Reminder</asp:ListItem>
                </asp:DropDownList>
                <br />
            </div>
            
            <div>
                <div id="divNotificationSetUp" runat="server" style="display: none;">
                  
                    Notification Mail-Setup:-<asp:DropDownList ID="ddlNofication" runat="server" Enabled="false">
                        <asp:ListItem Text="ni1" Value="4">--Select Notification--</asp:ListItem>
                        <asp:ListItem Text="nt2" Value="5">Mail To Admin</asp:ListItem>
                        <asp:ListItem Text="ny3" Value="6">Mail to Client</asp:ListItem>
                        <asp:ListItem Text="ny4" Value="7">Mail to Notification User</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="true" GroupName="bfh" />24
                    hour Before
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="bfh" />48 hour Before
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="bfh" />72 hour Before
                    <br />
                </div>
              
            </div>
            <div style="line-height:32px !important;">
              Mail Send
                <asp:CheckBox ID="chkConfirmMail" runat="server" ClientIDMode="Static" />
            Subject:</div><asp:TextBox ID="txtsubject" runat="server" Width="99.5%"></asp:TextBox>
            <CKEditor:CKEditorControl ID="CKEditor1" runat="server"></CKEditor:CKEditorControl>
            <table ><tr>
                    <td class="Note-col">
                        <span style="font-weight: bold; text-decoration:solid">Note:- How To Write Dynamic
                            Mail</span>
                        <br />
                        <span style="font-weight: bold;">Dynamic Content Should Be between <span style="font-weight: bold; color: Red">'[ ]' </span>only below dynamic contect allowed.</span>
                    </td>
                    <td>&nbsp;
                    </td>
                </tr>
                </table>
               <div id="divTable" runat="server" style="display: none;">
          <table>

                <tr>
                    <td class="user-name-col">User Name: &nbsp;<span style="color: Red" class="user-name-dyn-col"> [UserName]</span></td><td class="user-name-col"> Start Time:&nbsp; <span style="color: Red" class="user-name-dyn-col">[StartTime]</span></td><td class="user-name-col"> End Time: &nbsp; <span style="color: Red" class="user-name-dyn-col">[EndTime]</span></td>
                 </tr>
                      <tr >
                    <td class="user-name-col">Start Date:&nbsp; <span style="color: Red" class="user-name-dyn-col">[StartDate]</span></td><td class="user-name-col"> End Date:&nbsp;<span style="color: Red" class="user-name-dyn-col">[EndDate]</span></td><td class="user-name-col"> Ground Info:&nbsp; <span style="color: Red" class="user-name-dyn-col">[GroundInfo]</span>
                    </td>
                           </tr>
                                <tr>
                    <td class="user-name-col">Event Status: &nbsp;<span style="color: Red" class="user-name-dyn-col"> [EventStatus]</span></td><td class="user-name-col">Description:&nbsp;<span style="color: Red" class="user-name-dyn-col">[Desp]</span></td><td class="user-name-col"> Notification Date:&nbsp; <span style="color: Red" class="user-name-dyn-col">[NotificationDate]</span></td>
                </tr>
              </table>
            </div>
            <div id="DivNodti" runat="server"  style="display: none;">
            <table >
                <tr>
                    <td class="user-name-col" >User Name: &nbsp;<span style="color: Red"> [UserName]</span>&nbsp;&nbsp;</td>
                    <td class="user-name-col">Scheduler Info: &nbsp;<span style="color: Red"> [SchedulerInfo]</span>
                    </td>
                </tr>
            </table>
                </div>
            <center>
                <table class="table-col-for-button" ><tr>
                        <td class="user-name-col-botton">
                            <asp:Button ID="btnUpdate" runat="server" Text="Set Format" OnClick="btnUpdate_Click"
                                OnClientClick="return ckevalidation();" />
                        </td>
                        <td class="user-name-col-botton">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="return changedivold();" />
                        </td>
                    </tr>
                </table>
            </center>
        </div></div></div></div></div></div>
         <div class="col-sm-1">&nbsp;</div>
        </div>
               

        </div>

    </div>
   
    <div id="fade" class="black_overlay">
    </div>
            
    </div>
</asp:Content>
