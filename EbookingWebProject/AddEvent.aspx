<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddEvent1.aspx.cs" Inherits="EbookingWebProject.AddEvent1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function check1() {
            var Sdate = new Date(document.getElementById("<%=txtStartDate.ClientID %>").value);
            var Edate = new Date(document.getElementById("<%=txtEndDate.ClientID %>").value);
            var chkBox = document.getElementById("<%=chklistgrnd.ClientID%>");
            document.getElementById("<%=divgrdShowHide.ClientID %>").style.display = "none";


            var options = chkBox.getElementsByTagName('input');
            for (var i = 0; i < options.length; i++) {
                if (options[i].checked == true) {
                    options[i].checked = false;
                }
            }
            if (Edate) {
                if ((Sdate) && (Edate)) {
                    if (Edate < Sdate) {
                        alert("End Date Should Be Equal Or Grearter Than Start Date.");
                        document.getElementById("<%=txtEndDate.ClientID %>").value = "";
                        document.getElementById("<%=txtEndDate.ClientID %>").focus();
                        return false;
                    }
                }
            }
            if (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value) {

                var e = document.getElementById("<%=ddlstartTime.ClientID %>");
                var ddltimetext = e.options[e.selectedIndex].text;
                var ddltimevalue = e.options[e.selectedIndex].value;


                var T2 = document.getElementById("<%=ddlEndTime.ClientID %>");
                var ddltimetextt2 = T2.options[T2.selectedIndex].text;
                var ddltimevalue2 = T2.options[T2.selectedIndex].value;

                var dtStart = new Date("1/1/2007 " + ddltimevalue);
                var dtEnd = new Date("1/1/2007 " + ddltimevalue2);
                if ((ddltimevalue.value != "Select") && (ddltimevalue2.value != "Select")) {

                    var TimeDiff = dtEnd.getTime() - dtStart.getTime();
                    if (TimeDiff < 0) {
                        document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                       document.getElementById("<%=ddlEndTime.ClientID %>").focus();
                       alert("End Time Should Be Greater To Start Time.");

                       return false;
                   }
                   if (TimeDiff == 0) {
                       document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                        alert("Start Time And End Time Can Not Be Equal Between Same Date's.");

                        return false;
                    }

                }
            }
            //            if (document.getElementById("<%=GridView1.ClientID %>").rows.length > 0) {
            //                document.getElementById("<%=GridView1.ClientID %>").outerHTML = "";
            //            }
        }
    </script>
    <script type="text/javascript">
        function check2() {

            var Sdate = new Date(document.getElementById("<%=txtStartDate.ClientID %>").value);
            var Edate = new Date(document.getElementById("<%=txtEndDate.ClientID %>").value);

            var chkBox = document.getElementById("<%=chklistgrnd.ClientID%>");

            document.getElementById("<%=divgrdShowHide.ClientID %>").style.display = "none";

            var options = chkBox.getElementsByTagName('input');
            for (var i = 0; i < options.length; i++) {
                if (options[i].checked == true) {
                    options[i].checked = false;
                }
            }
            if (Sdate) {
                if ((Sdate) && (Edate)) {
                    if (Sdate > Edate) {
                        alert("Start Date Should Be Equal Or lesser Than End Date.");
                        document.getElementById("<%=txtStartDate.ClientID %>").value = "";
                        document.getElementById("<%=txtStartDate.ClientID %>").focus();
                        return false;
                    }
                }
            }
            if (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value) {

                var e = document.getElementById("<%=ddlstartTime.ClientID %>");
               var ddltimetext = e.options[e.selectedIndex].text;
               var ddltimevalue = e.options[e.selectedIndex].value;

               var T2 = document.getElementById("<%=ddlEndTime.ClientID %>");
               var ddltimetextt2 = T2.options[T2.selectedIndex].text;
               var ddltimevalue2 = T2.options[T2.selectedIndex].value;

               var dtStart = new Date("1/1/2007 " + ddltimevalue);
               var dtEnd = new Date("1/1/2007 " + ddltimevalue2);
               if ((ddltimevalue != "Select") && (ddltimevalue2 != "Select")) {

                   var TimeDiff = dtEnd.getTime() - dtStart.getTime();
                   if (TimeDiff < 0) {
                       document.getElementById("<%=ddlstartTime.ClientID %>").selectedIndex = 0;
                        document.getElementById("<%=ddlstartTime.ClientID %>").focus();
                        alert("Start Time Should Be Greater To End Time.");

                        return false;
                    }
                    if ((TimeDiff == 0) && (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value)) {
                        document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                        alert("Start Time And End Time Can Not Be Equal Between Same Date's.");

                        return false;
                    }
                }
            }


        }

    </script>
    <script type="text/javascript">
        function time1() {
            var Sdate = new Date(document.getElementById("<%=txtStartDate.ClientID %>").value);
            var Edate = new Date(document.getElementById("<%=txtEndDate.ClientID %>").value);

            if (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value) {
                var e = document.getElementById("<%=ddlstartTime.ClientID %>");
                var ddltimetext = e.options[e.selectedIndex].text;
                var ddltimevalue = e.options[e.selectedIndex].value;

                var T2 = document.getElementById("<%=ddlEndTime.ClientID %>");
               var ddltimetextt2 = T2.options[T2.selectedIndex].text;
               var ddltimevalue2 = T2.options[T2.selectedIndex].value;

               var dtStart = new Date("1/1/2007 " + ddltimevalue);
               var dtEnd = new Date("1/1/2007 " + ddltimevalue2);
               if ((ddltimevalue != "Select") && (ddltimevalue2 != "Select")) {

                   var TimeDiff = dtEnd.getTime() - dtStart.getTime();
                   if (TimeDiff < 0) {
                       document.getElementById("<%=ddlstartTime.ClientID %>").selectedIndex = 0;
                       //document.getElementById("<%=ddlstartTime.ClientID %>").focus();
                       alert("Start Time Should Be lesser Than End Time.");

                       return false;
                   }
                   if ((TimeDiff == 0) && (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value)) {
                       document.getElementById("<%=ddlstartTime.ClientID %>").selectedIndex = 0;
                        //document.getElementById("<%=ddlstartTime.ClientID %>").focus();
                        alert("Start Time And End Time Can Not Be Equal Between Same Date's.");
                        return false;
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">
        function time2() {
            var Sdate = new Date(document.getElementById("<%=txtStartDate.ClientID %>").value);
            var Edate = new Date(document.getElementById("<%=txtEndDate.ClientID %>").value);
            if (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value) {
                var e = document.getElementById("<%=ddlstartTime.ClientID %>");
                var ddltimetext = e.options[e.selectedIndex].text;
                var ddltimevalue = e.options[e.selectedIndex].value;



                var T2 = document.getElementById("<%=ddlEndTime.ClientID %>");
               var ddltimetextt2 = T2.options[T2.selectedIndex].text;
               var ddltimevalue2 = T2.options[T2.selectedIndex].value;

               var dtStart = new Date("1/1/2007 " + ddltimevalue);
               var dtEnd = new Date("1/1/2007 " + ddltimevalue2);
               if ((ddltimevalue != "Select") && (ddltimevalue2 != "Select")) {

                   var TimeDiff = dtEnd.getTime() - dtStart.getTime();
                   if (TimeDiff < 0) {
                       document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                       // document.getElementById("<%=ddlEndTime.ClientID %>").focus();
                       alert("End Time Should Be Greater Than Start Time.");

                       return false;
                   }
                   if ((TimeDiff == 0) && (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value)) {
                       document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                        //document.getElementById("<%=ddlEndTime.ClientID %>").focus();
                        alert("Start Time And End Time Can Not Be Equal Between Same Date's.");

                        return false;
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">
        function clldemo(test) {

            var id = test;
            var txtsdate = document.getElementById("<%=txtStartDate.ClientID%>").value;
            var txtedate = document.getElementById("<%=txtEndDate.ClientID%>").value;
            var idd = id + " ," + txtsdate + " , " + txtedate + "";
            $.ajax({
                type: "POST",
                url: "AddEvent.aspx/FillInfoTable",
                data: "{query: '" + idd + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
            function OnSuccess(response) {

                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var customers = xml.find("fds");
                var row = $("[id*=GridView2] tr:last-child").clone(true);
                $("[id*=GridView2] tr").not($("[id*=GridView2] tr:first-child")).remove();
                var count = 1;

                $.each(customers, function () {
                    // var customer = $(this);
                    $("td", row).eq(0).html('<a href="Details.aspx?id=' + $(this).find("Title").text() + '">' + $(this).find("Event_Title").text() + '</a>');
                    //$("td", row).eq(1).html($(this).find("Event_Title").text());
                    $("td", row).eq(1).html($(this).find("StartDate").text());
                    $("td", row).eq(2).html($(this).find("EndDate").text());
                    $("td", row).eq(3).html($(this).find("StartTime").text());
                    $("td", row).eq(4).html($(this).find("EndTime").text());
                    $("td", row).eq(5).html($(this).find("Status").text());
                    //                $("td", row).eq(3).html('<a href="#" onclick="clldemo(' + $(this).find("c4").text() + ');" >More Info</a>');
                    //                    $("td", row).eq(3).html($(this).find("c4").text() + '<a href="#" onclick="clldemo(' + $(this).find("c4").text() + ');" >More Info</a>');
                    //                    $("td", row).eq(3).html($(this).find("c4").text());
                    $("[id*=GridView2]").append(row);
                    if (count == 1 || (count % 2 != 0)) {
                        $(row).css("background-color", "#ffffff");
                    }
                    else {
                        $(row).css("background-color", "#D2CDCD");
                    }
                    count = count + 1;
                    row = $("[id*=GridView2] tr:last-child").clone(true);

                });
                document.getElementById("light").style.display = "block";
                document.getElementById("fade").style.display = "block";
                document.getElementById("fade").style.display = "block";
                //                 <div id="fade" class="black_overlay"></div> 
            }
        }
    </script>
    <asp:HiddenField ID="Hdnckvalue" runat="server" />
    <script type="text/javascript">
        function getcheckchang() {
            // debugger;
            var chkBox = document.getElementById("<%=chklistgrnd.ClientID%>");
            var options = chkBox.getElementsByTagName('input');
            var txtsdate = document.getElementById("<%=txtStartDate.ClientID%>").value;
            var txtedate = document.getElementById("<%=txtEndDate.ClientID%>").value;
            var hdvalu = document.getElementById("<%=Hdnckvalue.ClientID%>").value;
            if ((txtsdate) && (txtedate)) {
                //here i need to add my client function;
            }
            else {
                document.getElementById("<%=divgrdShowHide.ClientID %>").style.display = "none";
                alert("Please Select Start Date And End Date First.");
                for (var i = 0; i < options.length; i++) {
                    if (options[i].checked) {
                        options[i].checked = false;
                    }
                }
                document.getElementById("<%=txtStartDate.ClientID%>").focus();
                return false;
            }
            for (var i = 0; i < options.length; i++) {
                if (options[i].checked && txtsdate.value != "" && txtedate.value != "") {

                    var idd = options[i].value + "#";
                    hdvalu = hdvalu + idd;

                }
            }
            var idd2 = hdvalu + "," + txtsdate + "," + txtedate + "";
            $.ajax({
                type: "POST",
                url: "AddEvent.aspx/GetEvents",
                data: "{query: '" + idd2 + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert("Failure : " + response.d);
                },
                error: function (response) {
                    alert("Error : " + response.d);
                }
            });
        }

        function OnSuccess(response) {

            if (response.d == "false") {
                document.getElementById("<%=divgrdShowHide.ClientID %>").style.display = "none";
            }
            else {
                document.getElementById("<%=divgrdShowHide.ClientID %>").style.display = "block";
            }
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var users = xml.find("Table1");
            //create a new row from the last row of gridview
            var row = $("[id*=GridView1] tr:last-child").clone(true);
            //remove the lst row created by binding the dummy row from code behind on page load

            $("[id*=GridView1] tr").not($("[id*=GridView1] tr:first-child")).remove();
            var count = 1;
            $.each(users, function () {

                //var users = $(this);
                $("td", row).eq(0).html($(this).find("Assets").text());
                //$("td", row).eq(1).html($(this).find("Start_Date").text());
                //$("td", row).eq(2).html($(this).find("End_Date").text());
                $("td", row).eq(1).html('<a href="#" onclick="clldemo(' + $(this).find("See_More").text() + ');" >More Info</a>');
                $("[id*=GridView1]").append(row);
                //define the background stryle of newly created row         
                if (count == 1 || (count % 2 != 0)) {
                    $(row).css("");
                }
                else {
                    $(row).css("");
                }
                count = count + 1;
                row = $("[id*=GridView1] tr:last-child").clone(true);
            });
        }
    </script>
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
            top: 11%;
            left: 25%;
            width: 60%;
            height: 50%;
            padding: 16px;
            border: 16px solid orange;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
    </style>
    <script type="text/javascript">
        //Function to allow only numbers to textbox
        function validate(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            //var phn = document.getElementById('txtPhn');
            //comparing pressed keycodes
            if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
                return false;
            }
            else {
                //Condition to check textbox contains ten numbers or not
                //                   if (phn.value.length < 10) {
                //                       return true;
                //                   }
                //                   else {
                //                       return false;
                //                   }
            }
        }
    </script>
    <script type="text/javascript">
        function onBtnClickInventory() {
            var txtQty = document.getElementById("<%=txtInvQty.ClientID %>").value;
            var txtInvDescp = document.getElementById("<%=txtInvDescp.ClientID %>").value;

            var e = document.getElementById("<%=ddlInventory.ClientID %>");
            var ddlInventorytext = e.options[e.selectedIndex].text;
            var ddlInventoryvalue = e.options[e.selectedIndex].value;
            if (ddlInventoryvalue == 0) {

                alert("Please Select Inventory.");
                return false;

            }
            else if (txtQty)
            { }
            else {
                alert("Please Enter Inventory Quantity.");
                document.getElementById("<%=txtInvQty.ClientID %>").focus();
                return false;

            }
            //                                            if (txtInvDescp)
            //                                            { }
            //                                            else {
            //                                                alert("Please Enter Description.. ");
            //                                                document.getElementById("<%=txtInvDescp.ClientID %>").focus();
            //                                                return false;

            //                                            }




        }
    </script>
    <script type="text/javascript">

        function date() {

            var ddlselect = document.getElementById("<%=ddluser.ClientID %>");
            //var ddluserinfo = ddluser.options[ddluser.selectedIndex];
            debugger;
            var ddluservalue = ddlselect.options[ddlselect.selectedIndex].value;
            var txtnotidate1 = document.getElementById("<%=txtnotidate.ClientID %>").value;
            var txtdamt1 = document.getElementById("<%=txtnoti.ClientID %>").value;
            var Sdatenoti = new Date(document.getElementById("<%=txtStartDate.ClientID %>").value);
            var txtnotidate = new Date(document.getElementById("<%=txtnotidate.ClientID %>").value);


            if (ddluservalue == 0) {
                alert('Please Select User.');
                //document.getElementById("<%=txtnotidate.ClientID %>").focus();
                document.getElementById("<%=ddluser.ClientID %>").focus();
                return false;
            }
            if (txtdamt1) {

            }
            else {
                alert('Please Enter Description.');
                document.getElementById("<%=txtnoti.ClientID %>").focus();
                return false;
            }
            if (txtnotidate1) {
            }
            else {
                alert('Please Enter Notification Date.');
                document.getElementById("<%=txtnotidate.ClientID %>").focus();
                return false;
                ///return true;
            }


            if (txtnotidate > Sdatenoti) {
                document.getElementById("<%=txtnotidate.ClientID %>").focus();
                alert("Notification Date Can not be Greater Than Event Date.");
                return false;

            }
            var rowscount = $("#<%=gvuser.ClientID %> tr").length;

            if (rowscount > 5) {
                alert("Can not add more then five Notification.");

                document.getElementById("<%=txtnotidate.ClientID %>").value = "";
                document.getElementById("<%=txtnoti.ClientID %>").value = "";
                document.getElementById("<%=ddluser.ClientID %>").selectedIndex = 0;
                return false;
            }
            //return false;





        }

    </script>
    
    <script type="text/javascript">
        function onddluser() {
            var ddlid = document.getElementById("<%=ddluser.ClientID %>").value;
            if (ddlid == 0) {

                document.getElementById("<%=txtnoti.ClientID %>").value = ""
                document.getElementById("<%=txtnotidate.ClientID %>").value = ""

            }

        }

    </script>
    <%--<script type="text/javascript">

        function cal() {


            var tamt1 = document.getElementById("<%=txttamt.ClientID %>").value;
            var tamt = isNaN(parseFloat(tamt1)) ? 0 : parseFloat(tamt1);
            var damt1 = document.getElementById("<%=txtdamt.ClientID %>").value;
            var damt = isNaN(parseFloat(damt1)) ? 0 : parseFloat(damt1);





            var famt;
            if (damt == "" || damt == 0) {
                //                                       alert(tamt);
                //                                       alert(damt);
                famt = parseFloat(tamt);


                document.getElementById("<%=txtbamt.ClientID %>").value = famt.toFixed(2);
                document.getElementById("<%=hdnbamt.ClientID %>").value = famt.toFixed(2);
            }
            else if (tamt != "" && damt != "") {
                if (parseInt(tamt) && parseInt(damt)) {
                    try {
                        if (tamt != "" && damt != "") {
                            famt = parseFloat(tamt) - parseFloat(damt);
                            document.getElementById("<%=txtbamt.ClientID %>").value = famt.toFixed(2);
                            document.getElementById("<%=hdnbamt.ClientID %>").value = famt.toFixed(2);
                        }

                    }
                    catch (er) {
                        alert("error");
                    }
                }



                else {
                    alert("Invalid value");
                  

                }

            }
            else {
               
            }

        }

    </script>--%>
    <script type="text/javascript">
        function amtcheck1() {
            var totalamount = document.getElementById("<%=txttamt.ClientID %>").value;
            var totalamountFinl = isNaN(parseFloat(totalamount)) ? 0 : parseFloat(totalamount);

            var Depositamount = document.getElementById("<%=txtdamt.ClientID %>").value;
            var Depositamountfinl = isNaN(parseFloat(Depositamount)) ? 0 : parseFloat(Depositamount);
            var famt;

            if ((totalamountFinl) && (Depositamountfinl)) {
               
              
                famt = parseFloat(totalamountFinl) - parseFloat(Depositamountfinl);
                document.getElementById("<%=txtbamt.ClientID %>").value = famt.toFixed(2);
                 document.getElementById("<%=hdnbamt.ClientID %>").value = famt.toFixed(2);
                return false;

            }
            else   if (totalamountFinl < Depositamountfinl) {
                
                document.getElementById("<%=txttamt.ClientID %>").value = "";
                
                  
                document.getElementById("<%=txttamt.ClientID %>").focus();   
                alert("Total Billable Amount Should Be Greator or Equal To Paid Amount.");

                return false;
            }
            else {
                famt = parseFloat(totalamountFinl) - parseFloat(Depositamountfinl);
                document.getElementById("<%=txtbamt.ClientID %>").value = famt.toFixed(2);
                    document.getElementById("<%=hdnbamt.ClientID %>").value = famt.toFixed(2);


            }
              


        }
    </script>
   
    <script type="text/javascript">
        function amtcheck2() {
            var totalamount = document.getElementById("<%=txttamt.ClientID %>").value;
            var totalamountFinl = isNaN(parseFloat(totalamount)) ? 0 : parseFloat(totalamount);

            var Depositamount = document.getElementById("<%=txtdamt.ClientID %>").value;
            var Depositamountfinl = isNaN(parseFloat(Depositamount)) ? 0 : parseFloat(Depositamount);
            var famt;

            if ((totalamountFinl) && (Depositamountfinl)) {
                if (Depositamountfinl > totalamountFinl) {
                    document.getElementById("<%=txtdamt.ClientID %>").value = "";
                    document.getElementById("<%=txtbamt.ClientID %>").value = "";
                    document.getElementById("<%=txtbamt.ClientID %>").innerHTML = "";
                    document.getElementById("<%=txtdamt.ClientID %>").focus();
                    alert("Paid Amount Should Be Lesser Or Equal To Total Billable Amount.");

                    return false;
                }
                else {
                    famt = parseFloat(totalamountFinl) - parseFloat(Depositamountfinl);
                    document.getElementById("<%=txtbamt.ClientID %>").value = famt.toFixed(2);
                     document.getElementById("<%=hdnbamt.ClientID %>").value = famt.toFixed(2);
                  
                }


            }
            else {
                famt = parseFloat(totalamountFinl) - parseFloat(Depositamountfinl);
                document.getElementById("<%=txtbamt.ClientID %>").value = famt.toFixed(2);
                  document.getElementById("<%=hdnbamt.ClientID %>").value = famt.toFixed(2);

            }


        }
    </script>
    
    <script src="Scripts/jquery-1.7.1.min.js" ></script>
    <script src="jquery-ui.min.js" ></script> 
    <script type="text/javascript">

        function getpromoter() { //This function call on text change.
            debugger;
            var id = document.getElementById("<%=ddlpromoter.ClientID %>").value;
            $.ajax({
                type: "POST",
                url: "AddEvent.aspx/getpromoterdata", // this for calling the web method function in cs code.   
                data: '{ id:' + id + '} ',// user name or email value  
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response);
                }
            });


            // function OnSuccess  
            function OnSuccess(response) {

                var data = response.d.split("~");


                document.getElementById("<%=txtFname.ClientID%>").value = data[0];
                document.getElementById("<%=txtLname.ClientID%>").value = data[1];
                document.getElementById("<%=txtEmail.ClientID%>").value = data[2];
                document.getElementById("<%=txtPhone.ClientID%>").value = data[3];
                document.getElementById("<%=lblpid.ClientID%>").value = data[4];
                // document.getElementById("<%=chaddnewpro.ClientID%>").disabled = true;
                document.getElementById("<%=chaddnewpro.ClientID%>").checked = false;

                //                                    document.getElementById("<%=txtFname.ClientID %>").disabled = true;
                //                                    document.getElementById("<%=txtLname.ClientID%>").disabled = true;
                //                                    document.getElementById("<%=txtEmail.ClientID%>").disabled = true;
                //                                    document.getElementById("<%=txtPhone.ClientID%>").disabled = true;

                document.getElementById("<%=txtFname.ClientID %>").readOnly = true;
                document.getElementById("<%=txtLname.ClientID%>").readOnly = true;
                document.getElementById("<%=txtEmail.ClientID%>").readOnly = true;
                document.getElementById("<%=txtPhone.ClientID%>").readOnly = true;
                //document.getElementById("<%=lblpid.ClientID%>").disabled = true;


            }
        }

    </script>
    <%--<script type="text/javascript">

        function getpromoter() {

            var proid = document.getElementById("<%=ddlpromoter.ClientID %>").value;

            if (proid == '0') {
                alert(proid);
                document.getElementById("<%=txtFname.ClientID %>").value = "";
                document.getElementById("<%=txtLname.ClientID%>").value = "";
                document.getElementById("<%=txtEmail.ClientID%>").value = "";
                document.getElementById("<%=txtPhone.ClientID%>").value = "";
                document.getElementById("<%=lblpid.ClientID%>").value = "";
                document.getElementById("<%=chaddnewpro.ClientID%>").checked = false;
                document.getElementById("<%=hdnpromsg.ClientID%>").value = "";
                alert(document.getElementById("<%=hdnpromsg.ClientID%>").value);
                document.getElementById("<%=lblpid.ClientID%>").value = ""


            }
            else if (proid) {
                {
                    PageMethods.getpromoterdata(proid, onsuccess, onfail);
                }
                function onsuccess(value) {

                    var data = value.split("~");

                    document.getElementById("<%=txtFname.ClientID%>").value = data[0];
                    document.getElementById("<%=txtLname.ClientID%>").value = data[1];
                    document.getElementById("<%=txtEmail.ClientID%>").value = data[2];
                    document.getElementById("<%=txtPhone.ClientID%>").value = data[3];
                    document.getElementById("<%=lblpid.ClientID%>").value = data[4];
                    // document.getElementById("<%=chaddnewpro.ClientID%>").disabled = true;
                    document.getElementById("<%=chaddnewpro.ClientID%>").checked = false;

                    //                                    document.getElementById("<%=txtFname.ClientID %>").disabled = true;
                    //                                    document.getElementById("<%=txtLname.ClientID%>").disabled = true;
                    //                                    document.getElementById("<%=txtEmail.ClientID%>").disabled = true;
                    //                                    document.getElementById("<%=txtPhone.ClientID%>").disabled = true;

                    document.getElementById("<%=txtFname.ClientID %>").readOnly = true;
                    document.getElementById("<%=txtLname.ClientID%>").readOnly = true;
                    document.getElementById("<%=txtEmail.ClientID%>").readOnly = true;
                    document.getElementById("<%=txtPhone.ClientID%>").readOnly = true;
                    //document.getElementById("<%=lblpid.ClientID%>").disabled = true;
                }
                function onfail() {

                    alert("Error");
                }


            }
            else { }


    }


    </script>--%>
    <script type="text/javascript">
        function onckeckchange() {
            var select = document.getElementById("<%=chaddnewpro.ClientID %>");
            var rbnChekExClient = document.getElementById("<%=rbtnExisClient.ClientID %>");
            var select1 = document.getElementById("<%=ddlpromoter.ClientID %>");

            var answer1 = select1.options[select1.selectedIndex].text;

            document.getElementById("<%=lblpromsg.ClientID%>").innerHTML = "";

            if (select.checked == true) {

                document.getElementById("<%=ddlpromoter.ClientID %>").style.display = "none";
                document.getElementById("<%=txtFname.ClientID %>").value = "";
                document.getElementById("<%=txtLname.ClientID%>").value = "";
                document.getElementById("<%=txtEmail.ClientID%>").value = "";
                document.getElementById("<%=txtPhone.ClientID%>").value = "";
                document.getElementById("<%=lblpid.ClientID%>").value = "";
                //                                document.getElementById("<%=txtFname.ClientID %>").disabled = false;
                //                                document.getElementById("<%=txtLname.ClientID%>").disabled = false;
                //                                document.getElementById("<%=txtEmail.ClientID%>").disabled = false;
                //                                document.getElementById("<%=txtPhone.ClientID%>").disabled = false;
                document.getElementById("<%=txtFname.ClientID %>").readOnly = false;
                document.getElementById("<%=txtLname.ClientID%>").readOnly = false;
                document.getElementById("<%=txtEmail.ClientID%>").readOnly = false;
                document.getElementById("<%=txtPhone.ClientID%>").readOnly = false;
                var defl = document.getElementById("<%=ddlpromoter.ClientID %>");

                document.getElementById("<%=ddlpromoter.ClientID %>").selectedIndex = 0;




            }
            //                            if (select.checked == false) {


            //                                document.getElementById("<%=txtFname.ClientID %>").value = "";
            //                                document.getElementById("<%=txtLname.ClientID%>").value = "";
            //                                document.getElementById("<%=txtEmail.ClientID%>").value = "";
            //                                document.getElementById("<%=txtPhone.ClientID%>").value = "";
            //                                document.getElementById("<%=lblpid.ClientID%>").value = "";
            //                                document.getElementById("<%=txtFname.ClientID %>").disabled = false;
            //                                document.getElementById("<%=txtLname.ClientID%>").disabled = false;
            //                                document.getElementById("<%=txtEmail.ClientID%>").disabled = false;
            //                                document.getElementById("<%=txtPhone.ClientID%>").disabled = false;


            //                            }
            if (rbnChekExClient.checked == true) {
                document.getElementById("<%=ddlpromoter.ClientID %>").style.display = "block";
                //                                document.getElementById("<%=txtFname.ClientID %>").value = "";
                //                                document.getElementById("<%=txtLname.ClientID%>").value = "";
                //                                document.getElementById("<%=txtEmail.ClientID%>").value = "";
                //                                document.getElementById("<%=txtPhone.ClientID%>").value = "";
                document.getElementById("<%=lblpid.ClientID%>").value = "";
                //                                document.getElementById("<%=txtFname.ClientID %>").setAttribute('disabled', true);
                //                                document.getElementById("<%=txtLname.ClientID%>").setAttribute('disabled', true);
                //                                document.getElementById("<%=txtEmail.ClientID%>").setAttribute('disabled', true);
                //                                document.getElementById("<%=txtPhone.ClientID%>").setAttribute('disabled', true);
                document.getElementById("<%=txtFname.ClientID %>").readOnly = true;
                document.getElementById("<%=txtLname.ClientID%>").readOnly = true;
                document.getElementById("<%=txtEmail.ClientID%>").readOnly = true;
                document.getElementById("<%=txtPhone.ClientID%>").readOnly = true;
                document.getElementById("<%=hdnpromsg.ClientID%>").value = "";


            }
        }

    </script>
    <script type="text/javascript">

        function ontxtchg() {
            document.getElementById("<%=chaddnewpro.ClientID%>").checked = true;
            document.getElementById("<%=lblpid.ClientID%>").value = "";
            document.getElementById("<%=lblpromsg.ClientID%>").value = "";

            var fname = document.getElementById("<%=txtFname.ClientID %>").value;
            var lname = document.getElementById("<%=txtLname.ClientID%>").value;
            var clmail = document.getElementById("<%=txtEmail.ClientID%>").value;
            var hdnpromsg = document.getElementById("<%=hdnpromsg.ClientID%>");

            if ((document.getElementById("<%=chaddnewpro.ClientID%>").checked == true) && (fname != "") && (lname != "") && (clmail != "")) {
                document.getElementById("<%=lblpid.ClientID%>").value = "";

                var cinfo;
                if ((fname) && (lname) && (clmail)) {

                    cinfo = fname + "," + lname + "," + clmail + "";
                    PageMethods.checkeClient(cinfo, onSucess, onError);

                    function onSucess(result) {
                        if (result != "yy") {
                            // alert(result);
                            var h = document.getElementById("<%=hdnpromsg.ClientID%>").value = '1';

                            document.getElementById("<%=txtEmail.ClientID%>").focus();
                            document.getElementById("<%=lblpromsg.ClientID%>").innerHTML = "Client Already Exists:-" + " " + fname + "," + lname + "," + clmail;

                        }
                        if (result == "yy") {
                            // alert(result);

                            document.getElementById("<%=hdnpromsg.ClientID%>").value = "";
                            document.getElementById("<%=lblpromsg.ClientID%>").innerHTML = "";
                        }
                    }
                    function onError(result) {
                        return false;
                    }
                }

            }
        }

    </script>
    <script type="text/javascript">
        function onChangeDiv() {
            debugger;
            var rbnNew = document.getElementById("<%=rbnAddNewInvoce.ClientID%>");
            var rbnAddExisInvoce = document.getElementById("<%=rbnAddExisInvoce.ClientID%>");
            if (rbnNew.checked == true) {
                var eleExisingInvoice = document.getElementById("<%=divExisingInvoice.ClientID%>");
                var eleDivNewInvoice = document.getElementById("<%=divNewInvoice.ClientID%>");
                eleExisingInvoice.style.display = "none";
                eleDivNewInvoice.style.display = "block";
                document.getElementById("<%=ddlattach.ClientID%>").selectedIndex = 0;
                document.getElementById("<%=lblattachname.ClientID%>").innerHTML = "";
                document.getElementById("<%=spantick.ClientID%>").style.display = "none";
                document.getElementById("<%=hdnAttchInvoice.ClientID%>").value = '0';


                return false;


            }
            if (rbnAddExisInvoce.checked == true) {
                var eleExisingInvoice = document.getElementById("<%=divExisingInvoice.ClientID%>");
                var eleDivNewInvoice = document.getElementById("<%=divNewInvoice.ClientID%>");
                eleExisingInvoice.style.display = "block";
                eleDivNewInvoice.style.display = "none";
                document.getElementById("<%=FileUploadInserInvoice.ClientID %>").value = "";
                document.getElementById("<%=txtInvoiceRemarks.ClientID%>").value = "";
                document.getElementById("<%=hdnAttchInvoice.ClientID%>").value = '0';
                // document.getElementById("<%=FileUploadInserInvoice.ClientID %>").innerHTML = document.getElementById("aattach1").innerHTML;
                return false;

            }

        }


    </script>
    <script type="text/javascript">

        function attachment() {
            var drop1 = document.getElementById("<%=ddlstatus.ClientID %>");
            var inid1 = drop1.options[drop1.selectedIndex].value;
            if (inid1 == '2') {
                document.getElementById("<%=ddlstatus.ClientID %>").style.border = "3px solid Red";
            }
            if (inid1 == '1') {
                document.getElementById("<%=ddlstatus.ClientID %>").style.border = "3px solid Green";
            }
            if (inid1 == '0') {
                document.getElementById("<%=ddlstatus.ClientID %>").style.border = "3px solid  #a9acae";
            }
            var ddl = document.getElementById("<%=ddlattach.ClientID %>");

            var invoicename = ddl.options[ddl.selectedIndex].text;
            var inid = ddl.options[ddl.selectedIndex].value;


            if (!(inid == '0')) {


                document.getElementById("<%=lblattachid.ClientID %>").value = inid;


                document.getElementById("<%=lblattachname.ClientID %>").innerHTML = invoicename;

            }
            else {

                document.getElementById("<%=lblattachid.ClientID %>").innerHTML = "0";

                document.getElementById("<%=lblattachname.ClientID %>").innerHTML = "";

            }
            document.getElementById("<%=spantick.ClientID %>").style.display = "None";
        }

        function gettick() {

            if (document.getElementById("<%=lblattachname.ClientID %>").innerHTML) {

                document.getElementById("<%=spantick.ClientID %>").style.display = "inline";
                document.getElementById("<%=hdnAttchInvoice.ClientID%>").value = '1';
            }
            else {

                alert("Select File Name First.");
            }


        }
    </script>
    <script type="text/javascript">

        function clearFileInputField(tagId) {

            document.getElementById(tagId).innerHTML = document.getElementById(tagId).innerHTML;
            if (tagId == 'uploadFile_div') {

                document.getElementById("<%=att1.ClientID%>").style.display = "none";
                //document.getElementById("<%=attach1.ClientID %>").disabled = false;

            }
            if (tagId == 'div11') {
                document.getElementById("<%=att2.ClientID%>").style.display = "none";
                //document.getElementById("<%=attach2.ClientID %>").disabled = false;

            }
            if (tagId == 'div222') {
                document.getElementById("<%=att3.ClientID%>").style.display = "none";
                //document.getElementById("<%=attach3.ClientID %>").disabled = false;

            }
            if (tagId == 'Div3') {
                document.getElementById("<%=att4.ClientID%>").style.display = "none";
                //document.getElementById("<%=attach4.ClientID %>").disabled = false;

            }



        }

    </script>
    <script type="text/javascript">
        function fileselect() {
            var uploadedFile = document.getElementById("<%=attach1.ClientID%>");
            var fileSize = uploadedFile.files[0].size;
            //alert(fileSize);
            if (fileSize > 4194304) {
                alert("File size should be Less Than 4Mb.");

                document.getElementById("<%=attach1.ClientID%>").value = "";
                return false;

            }

            var at1 = document.getElementById("<%=attach1.ClientID %>").value;
            if (at1) {
                document.getElementById("<%=att1.ClientID%>").style.display = "block";
                //document.getElementById("<%=attach1.ClientID %>").disabled = true;

            }
            else {
                document.getElementById("<%=att1.ClientID%>").style.display = "none";

            }

        }
    </script>
    <script type="text/javascript">
        function fileselect2() {
            var uploadedFile = document.getElementById("<%=attach2.ClientID%>");
            var fileSize = uploadedFile.files[0].size;

            if (fileSize > 4194304) {
                alert("File size should be Less Than 4Mb.");

                document.getElementById("<%=attach2.ClientID%>").value = "";
                return false;

            }
            var at2 = document.getElementById("<%=attach2.ClientID %>").value;
            if (at2) {
                document.getElementById("<%=att2.ClientID%>").style.display = "block";
                //document.getElementById("<%=attach2.ClientID %>").disabled = true;

            }
            else {
                document.getElementById("<%=att2.ClientID%>").style.display = "none";
            }

        }
    </script>
    <script type="text/javascript">
        function fileselect3() {
            var uploadedFile = document.getElementById("<%=attach3.ClientID%>");
            var fileSize = uploadedFile.files[0].size;

            if (fileSize > 4194304) {
                alert("File size should be Less Than 4Mb.");

                document.getElementById("<%=attach3.ClientID%>").value = "";
                return false;

            }
            var at1 = document.getElementById("<%=attach3.ClientID %>").value;
            if (at1) {
                document.getElementById("<%=att3.ClientID%>").style.display = "block";
                //document.getElementById("<%=attach3.ClientID %>").disabled = true;

            }
            else {
                document.getElementById("<%=att3.ClientID%>").style.display = "none";
            }

        }
    </script>
    <script type="text/javascript">
        function fileselect4() {
            var uploadedFile = document.getElementById("<%=attach4.ClientID%>");
            var fileSize = uploadedFile.files[0].size;

            if (fileSize > 4194304) {
                alert("File size should be Less Than 4Mb.");

                document.getElementById("<%=attach4.ClientID%>").value = "";
                return false;

            }
            var at1 = document.getElementById("<%=attach4.ClientID %>").value;
            if (at1) {
                document.getElementById("<%=att4.ClientID%>").style.display = "block";
                //document.getElementById("<%=attach4.ClientID %>").disabled = true;

            }
            else {
                document.getElementById("<%=att4.ClientID%>").style.display = "none";
            }

        }
    </script>
    <%--<script type="text/javascript">
                        function fileselect5() {
                            var uploadedFile = document.getElementById("<%=attach5.ClientID%>");
                            var fileSize = uploadedFile.files[0].size;

                            if (fileSize > 4194304) {
                                alert("File size should be Less Than 4Mb.");

                                document.getElementById("<%=attach5.ClientID%>").value = "";
                                return false;

                            }
                            var at1 = document.getElementById("<%=attach5.ClientID %>").value;
                            if (at1) {
                                document.getElementById("<%=att5.ClientID%>").style.display = "block";
                                //document.getElementById("<%=attach5.ClientID %>").disabled = true;

                            }
                            else {
                                document.getElementById("<%=att5.ClientID%>").style.display = "none";
                            }

                        }
                    </script>--%>
    <script type="text/javascript">
        function formresetAddevent() {

            //document.getElementById("form1").reset();
            document.getElementById("<%=txtETitle.ClientID %>").value = "";
            document.getElementById("<%=txtStartDate.ClientID %>").value = "";
            document.getElementById("<%=txtEndDate.ClientID %>").value = "";

            var inputs = document.getElementsByTagName("input");
            for (var i in inputs)
                if (inputs[i].type == "checkbox") inputs[i].checked = false;
            var elements = document.getElementsByTagName('select');
            for (var i = 0; i < elements.length; i++) {
                elements[i].selectedIndex = 0;
            }

            document.getElementById("<%=txtFname.ClientID %>").value = "";
            document.getElementById("<%=txtLname.ClientID %>").value = "";
            document.getElementById("<%=txtEmail.ClientID %>").value = "";
            document.getElementById("<%=txtPhone.ClientID %>").value = "";


            document.getElementById("<%=txtRDate1.ClientID %>").value = "";
            document.getElementById("<%=txtRDate2.ClientID %>").value = "";
            document.getElementById("<%=txtRDate3.ClientID %>").value = "";
            document.getElementById("<%=txtRDate4.ClientID %>").value = "";


            document.getElementById("<%=txttamt.ClientID %>").value = "";
            document.getElementById("<%=txtdamt.ClientID %>").value = "";
            document.getElementById("<%=txtbamt.ClientID %>").value = "";

            document.getElementById("<%=txtnoti.ClientID %>").value = "";
            document.getElementById("<%=txtnotidate.ClientID %>").value = "";


            document.getElementById("<%=txtNotes.ClientID %>").value = "";
            document.getElementById("<%=attach1.ClientID %>").innerHTML = document.getElementById("aattach1").innerHTML;
            document.getelementbyid("<%=attach2.ClientID %>").innerhtml = document.getelementbyid("aattach1").innerhtml;
            document.getelementbyid("<%=attach3.ClientID %>").innerhtml = document.getelementbyid("aattach1").innerhtml;
            document.getelementbyid("<%=attach4.ClientID %>").innerhtml = document.getelementbyid("aattach1").innerhtml;


            document.getElementById("<%=ddlstartTime.ClientID %>").selectedIndex = 0;
            document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0
            document.getElementById("<%=ddlInventory.ClientID %>").selectedIndex = 0
            document.getElementById("<%=txtInvQty.ClientID %>").value = "";
            document.getElementById("<%=txtInvDescp.ClientID %>").value = "";

            document.getElementById("<%=gvuser.ClientID %>").outerHTML = "";
            document.getElementById("<%=grdInventory.ClientID %>").outerHTML = "";

            return false;


        }
    </script>
    <script type="text/javascript">
        function validatedata() {
            var e = document.getElementById("<%=ddlstartTime.ClientID %>");
            var ddltimetext = e.options[e.selectedIndex].text;
            var ddltimevalue = e.options[e.selectedIndex].value;


            var T2 = document.getElementById("<%=ddlEndTime.ClientID %>");
            var ddltimetextt2 = T2.options[T2.selectedIndex].text;
            var ddltimevalue2 = T2.options[T2.selectedIndex].value;

            var dtStart = new Date("1/1/2007 " + ddltimevalue);
            var dtEnd = new Date("1/1/2007 " + ddltimevalue2);


            var Sdate = new Date(document.getElementById("<%=txtStartDate.ClientID %>").value);
            var Edate = new Date(document.getElementById("<%=txtEndDate.ClientID %>").value);
            var chkBox1 = document.getElementById("<%=chklistgrnd.ClientID%>");
            var options1 = chkBox1.getElementsByTagName('input');

            var eventname = document.getElementById("<%=txtETitle.ClientID %>").value;
            eventname = eventname.toString().trim();
            var txtFname = document.getElementById("<%=txtFname.ClientID%>").value;
            txtFname = txtFname.toString().trim();

            var txtLname = document.getElementById("<%=txtLname.ClientID%>").value;
            txtLname = txtLname.toString().trim();
            var txtEmail = document.getElementById("<%=txtEmail.ClientID%>").value;
            txtEmail = txtEmail.toString().trim();
            var chaddnewpro = document.getElementById("<%=chaddnewpro.ClientID%>");
            var newrbncheck = document.getElementById("<%=rbnAddExisInvoce.ClientID %>");
            var emailRegex = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            //alert(Sdate);
            if (eventname) { }


            else {
                document.getElementById("<%=txtETitle.ClientID %>").focus();
                alert("Please Enter Event Name.");
                return false;
            }


            if (Sdate == "Invalid Date") {
                alert("Please Select Event Start Date.");
                document.getElementById("<%=txtStartDate.ClientID %>").focus();
                return false;
            }
            //            else {
            //                alert("Please Select Event Start Date");
            //                document.getElementById("<%=txtStartDate.ClientID %>").focus();
            //                return false;
            //            }
            if (Edate == "Invalid Date") {

                alert("Please Select Event End Date.");
                document.getElementById("<%=txtEndDate.ClientID %>").focus();
                return false;
            }
            //            else
            //            {
            //             alert("Please Select Event  End Date");
            //                document.getElementById("<%=txtEndDate.ClientID %>").focus();
            //                return false;
            //            }
            if (Sdate > Edate) {
                alert("Start Date Should Be Equal Or Less Than End Date.");

                document.getElementById("<%=txtStartDate.ClientID%>").value = "";

                return false;
            }
            else if (Edate < Sdate) {

                alert("End Date Should Be Greater Or Equal To Start Date.");
                //document.getElementById('txtEndDate').innerHTML = "";
                //document.getElementById('txtEndDate').innerText = "";
                document.getElementById("<%=txtEndDate.ClientID%>").value = "";
                return false;
            }
        var checkvalue = 0;
        for (var i = 0; i < options1.length; i++) {
            if (options1[i].checked) {
                options1[i].checked;
                checkvalue = 1;
                //return true;
            }

        }

        if (checkvalue == 0) {
            alert("Please Select Atleast One Venue/Asset.");
            document.getElementById("<%=chklistgrnd.ClientID%>").focus();
            return false;
        }

        if ((ddltimevalue != "Select") && (ddltimevalue2 != "Select") && (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value)) {

                var TimeDiff = dtEnd.getTime() - dtStart.getTime();
                if (TimeDiff < 0) {
                    document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                    alert("End Time Cannot Be Lesser Than Start Time.");

                    return false;
                }
            }
            else if ((ddltimevalue != "Select") && (ddltimevalue2 != "Select") && (document.getElementById("<%=txtStartDate.ClientID %>").value == document.getElementById("<%=txtEndDate.ClientID %>").value)) {

            var TimeDiff = dtEnd.getTime() - dtStart.getTime();
            if (TimeDiff == 0) {
                document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
                alert("Start Time And End Time Can Not Same.");

                return false;
            }
        }

    if ((ddltimevalue != "Select") && (ddltimevalue2 == "Select")) {
        document.getElementById("<%=ddlEndTime.ClientID %>").selectedIndex = 0;
        document.getElementById("<%=ddlEndTime.ClientID %>").focus();
        alert("Please Select End Time.");
        return false;

    }
    if ((ddltimevalue == "Select") && (ddltimevalue2 != "Select")) {
        document.getElementById("<%=ddlstartTime.ClientID %>").selectedIndex = 0;
        document.getElementById("<%=ddlstartTime.ClientID %>").focus();
        alert("Please Select Start Time.");
        return false;

    }
    if (txtFname)
    { }
    else {
        alert("Please Enter First Name.");
        document.getElementById("<%=txtFname.ClientID%>").focus();
        return false;
    }
    if (txtLname)
    { }
    else {
        alert("Please Enter Last Name.");
        document.getElementById("<%=txtLname.ClientID%>").focus();
            return false;
        }
        if (txtEmail)
        { }
        else {
            alert("Please Enter Email-Id.");
            document.getElementById("<%=txtEmail.ClientID%>").focus();
            return false;
        }
        if (!txtEmail.match(emailRegex)) {
            document.getElementById("<%=txtEmail.ClientID%>").focus();
            alert("Please Enter Valid Email-Id.");

            return false;
        }
        else {

        }

        if (newrbncheck.checked == true) {
            var a1 = document.getElementById("<%=ddlattach.ClientID %>");

                var lblattachname = document.getElementById("<%=hdnAttchInvoice.ClientID%>").value;
                var a2 = a1.options[a1.selectedIndex].value;
                if ((a2 > 0) && (lblattachname == "0")) {
                    alert("Please Attach Invoice.")
                    return false;
                }


            }

            //}
        }
    </script>
    <div id="light" style="height: 420px; border-color: #E0E0E0;" align="center" class="white_content">
        <img style="float: left;" alt="Dean" src="images/logo.png" />
        <div style="width: 100%; padding-bottom: 5px;">
            &nbsp; <a style="float: right;" href="javascript:void()" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                <img src="img/cross_icon.png" width="15px" height="15px" style="float: right;" /></a>
            <br />
            <br />
          <%--  <br />
            <br />--%>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true" Font-Names="Arial"
                Font-Size="10pt" HeaderStyle-BackColor="GrayText" HeaderStyle-ForeColor="White"
                Width="570px">
                <Columns>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="clear"></div>

    <div id="full-width">
        <div class="container">
            <div class="row">
                <div class="col-xs-12" style="padding: 0px;">
                    <div class="event-col">
                        <div class="col-sm-3">
                            <div class="event-col-left-head">
                                <p>Venue</p>
                            </div>
                            <div class="event-col-left">
                                <div class="event-col-left-col-status">

                                    <div class="event-col-left-col-status-col">
                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div id="divgrdShowHide" runat="server" style="display: none">
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" GridLines="None">
                                                        <Columns>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>


                                    </div>


                                </div>
                                <div class="event-col-left-col-1">
                                    <p>Event Title</p>

                                    <asp:TextBox ID="txtETitle" runat="server" autocomplete="off" AutoCompleteType="None"
                                        CssClass="event-col-left-col-1-input"></asp:TextBox>
                                    <div class="clear"></div>
                                    <p>Start Date</p>

                                    <asp:TextBox ID="txtStartDate" runat="server" autocomplete="off" AutoCompleteType="None"
                                        onChange="return check2()" CssClass="event-col-left-col-1-input"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtStartDate"
                                        PopupButtonID="txtStartDate" runat="server">
                                    </asp:CalendarExtender>
                                    <div class="clear"></div>
                                    <p>Start Time</p>
                                    <asp:DropDownList ID="ddlstartTime" Width="120px" CssClass="textbox" onChange="return time1()"
                                        runat="server">
                                    </asp:DropDownList>


                                    <div class="clear"></div>
                                    <p></p>
                                    <p>End Date</p>

                                    <asp:TextBox ID="txtEndDate" runat="server" autocomplete="off" AutoCompleteType="None"
                                        CssClass="event-col-left-col-1-input" onChange="return check1()"></asp:TextBox>
                                    <div class="clear"></div>
                                    <p>End Time</p>
                                    <asp:DropDownList ID="ddlEndTime" Width="120px" CssClass="event-col-left-col-1-check" onChange="return time2()"
                                        runat="server">
                                    </asp:DropDownList>
                                    <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtEndDate" PopupButtonID="txtEndDate"
                                        runat="server">
                                    </asp:CalendarExtender>


                                    <div class="clear"></div>
                                    <p>Status</p>
                                    <asp:DropDownList CssClass="event-col-left-col-1-check" runat="server" ID="ddlstatus" onChange="attachment()"
                                        ClientIDMode="Static" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Confirmed"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Hold"></asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="event-col-left-col-2">
                                    <h1>Venues/Assets </h1>
                                    <div class="clear"></div>
                                    <div class="event-col-left-col-2-list">

                                        <%-- <asp:CheckBoxList ID="chklistgrnd" runat="server" AutoPostBack="false" ToolTip="Please Select Start Date and End Date First"
                                            OnClick="getcheckchang ()" RepeatColumns="2" RepeatDirection="Horizontal">
                                        </asp:CheckBoxList>--%>
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                            <ContentTemplate>
                                                <div class="event-col-left-col-2-list-text">
                                                    <asp:CheckBoxList ID="chklistgrnd" runat="server" AutoPostBack="false" CssClass="event-col-left-col-2-list-check" ToolTip="Please Select Start Date and End Date First"
                                                        OnClick="getcheckchang()" RepeatDirection="Vertical">
                                                    </asp:CheckBoxList>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>


                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="col-sm-6">
                            <div class="event-col-mid-main">
                                <div class="event-col-mid-head">
                                    <p>Inventory</p>
                                </div>
                                <div class="event-col-mid-main-col">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>

                                            <div class="event-col-mid" style="padding-top: 15px;">
                                                <div class="col-sm-3">

                                                    <asp:DropDownList ID="ddlInventory" runat="server" AppendDataBoundItems="true" CssClass="event-col-left-col-1-check">
                                                        <asp:ListItem Value="0">Select Inventory</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="Label1BalaceInvey" runat="server" Text="Available:" ForeColor="Green"
                                                        Visible="false"></asp:Label>
                                                    <asp:Label ID="lblBalanceInvqty" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                                                    &nbsp;&nbsp;
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txtInvQty" runat="server" placeholder="Qty Only Numeric.." onkeypress="return validate(event)"
                                                        CssClass="event-col-left-col-1-input" oncopy="return false" onpaste="return false" oncut="return false"></asp:TextBox>


                                                </div>
                                                <div class="col-sm-3">

                                                    <asp:TextBox ID="txtInvDescp" runat="server" placeholder="QtyDescription.." CssClass="event-col-left-col-1-input"></asp:TextBox>

                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="event-col-more">


                                                        <p>
                                                            <asp:Button ID="btnAddInventory" runat="server" OnClientClick="return onBtnClickInventory();"
                                                                Text="Add Inventory" OnClick="btnAddInventory_Click" Style="color: #fff; font-size: 12px; text-align: center; background: #272f45; line-height: 15px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 2px 10px; float: left; margin-left: 20px;" />
                                                        </p>

                                                    </div>
                                                    
                                                </div>
                                                <div style="float:left; width:100%;">
                                                <asp:GridView ID="grdInventory" runat="server" AutoGenerateColumns="False" Width="100%"
                                                    GridLines="None" AllowPaging="True" OnRowCommand="grdInventory_RowCommand" CellPadding="4" ForeColor="#333333">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Name" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblInventoryId" runat="server" Text='<%#Eval("inventoryId") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Inventory Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblInventoryName" runat="server" Text='<%#Eval("inventorName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Quantity">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblInventoryQty" runat="server" Text='<%#Eval("invertoryQty") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Description" ControlStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblInventoryDesc" runat="server" Text='<%#Eval("invertoryDescp") %>' Style="width: 120px; word-wrap: break-word;"></asp:Label>
                                                            </ItemTemplate>
                                                            <ControlStyle Width="100px" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="btnInventory" CommandArgument="<%#Container.DataItemIndex %>"
                                                                    CommandName="dltinventory" ImageUrl="~/img/cross_icon.png" Height="10px" Width="10px" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#999999" />
                                                    <EmptyDataRowStyle BackColor="#990000" BorderColor="#D8D8D8" ForeColor="White" HorizontalAlign="Center"
                                                        VerticalAlign="Middle" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Names="Arial,Helvetica,sans-serif" Font-Size="13px"
                                                        ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle Font-Names="Arial,Helvetica,sans-serif" Font-Size="12px"
                                                        Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <SelectedRowStyle BorderColor="#006666" BorderStyle="Solid" BorderWidth="1px" BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                </asp:GridView>
                                            </div>
                                            </div>


                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="clear"></div>

                                    <div class="event-col-mid-clients">
                                        <p>Add Clients</p>
                                        <div class="event-col-mid-clients-mid">
                                            <div class="col-sm-6">

                                                <asp:RadioButton ID="chaddnewpro" runat="server" onchange="onckeckchange()" Checked="true"
                                                    GroupName="ck1" CssClass="" />
                                                New Client
                                            </div>
                                            <div class="col-sm-6">

                                                <asp:RadioButton ID="rbtnExisClient" runat="server" onchange="onckeckchange()" GroupName="ck1" />
                                               Existing Client
                                            </div>
                                            <div class="clear"></div>

                                            <asp:HiddenField ID="lblpid" ClientIDMode="Static" runat="server" />
                                            <asp:DropDownList runat="server" onChange="return getpromoter()" AppendDataBoundItems="true"
                                                Style="width: 270px; margin-top:20px; display: none; float:right; margin-right:20px;" CssClass="textbox" ID="ddlpromoter">
                                                <asp:ListItem Text="Select Client" Value="0">Select Client</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblpromsg" runat="server" Text="" ForeColor="Red" Font-Size="Small"></asp:Label>
                                            <asp:HiddenField ID="hdnpromsg" runat="server" />

                                        </div>
                                        <div class="clear"></div>
                                        <div class="event-col-mid-clients-mid-col">

                                            <div class="col-sm-6">
                                                <div class="event-col-mid-clients-mid-col-input">
                                                    <p>First Name</p>

                                                    <asp:TextBox ID="txtFname" runat="server" onchange="return ontxtchg();" CssClass="event-col-mid-clients-mid-col-input-main"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="event-col-mid-clients-mid-col-input">
                                                    <p>Last Name</p>

                                                    <asp:TextBox ID="txtLname" runat="server" onchange="return ontxtchg();" CssClass="event-col-mid-clients-mid-col-input-main"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="event-col-mid-clients-mid-col-input">
                                                    <p>Email</p>

                                                    <asp:TextBox ID="txtEmail" runat="server" onchange="return ontxtchg();" CssClass="event-col-mid-clients-mid-col-input-main"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="event-col-mid-clients-mid-col-input">
                                                    <p>Phone</p>

                                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="event-col-mid-clients-mid-col-input-main"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="clear"></div>
                                        <div class="event-col-mid-clients-mid-col-mail">


                                            <asp:CheckBox ID="chkMailClint" runat="server"></asp:CheckBox>
                                            &nbsp;&nbsp;Email To Client
                            
                                        </div>
                                        <div class="clear"></div>
                                        <%-- <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                            <ContentTemplate>--%>
                                        <div class="event-col-mid-clients-mid-col-add-invoice-col">
                                            <p>Add Invoice</p>
                                            <div class="event-col-mid-clients-mid-col-add-invoice">
                                                <div class="col-sm-6">
                                                    <div class="event-col-mid-clients-mid-col-add-invoice-left">

                                                        <asp:RadioButton ID="rbnAddNewInvoce" runat="server" onchange="return  onChangeDiv();"
                                                            GroupName="rk1" />
                                                        <p>Add a New Invoice&nbsp;&nbsp;</p>

                                                    </div>

                                                    <div class="event-col-mid-clients-mid-col-add-invoice-right">
                                                    </div>

                                                    <div class="event-col-mid-clients-mid-col-add-invoice-right" style="margin-bottom: 5px; float: right;">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="event-col-mid-clients-mid-col-add-invoice-left">

                                                        <asp:RadioButton ID="rbnAddExisInvoce" runat="server" onchange="return  onChangeDiv();"
                                                            GroupName="rk1" />
                                                        <p>Add An Existing Invoice&nbsp;&nbsp;</p>
                                                        <asp:HiddenField ID="hdnAttchInvoice" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="event-col-mid-clients-mid-col-add-invoice-right">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                        <ContentTemplate>
                                                            <div id="divExisingInvoice" runat="server" style="display: none; margin-left: 20px; width: 100%;">
                                                                <span style="float:right; width:250px; margin-right:50px; margin-bottom:20px;">
                                                                    <asp:DropDownList runat="server" ID="ddlattach" onChange="attachment()" ClientIDMode="Static"
                                                                        CssClass="textbox" AppendDataBoundItems="true">
                                                                        <asp:ListItem Value="0" Text="Select File"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:HiddenField ID="lblattachid" ClientIDMode="Static" runat="server" />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span onclick="gettick()" style="background-color: #CCCCCC; cursor: pointer; border: thin solid #666666; padding:5px; float:left;">Attach</span>
                                                                <br />
                                                                <br />
                                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span id="spantick" runat="server" style="color: #003300; display: none; font-family: Arial, Helvetica, sans-serif; font-size: 20px; font-weight: bold">&#10004;</span>
                                                                <asp:Label runat="server" ID="lblattachname" ClientIDMode="Static" ForeColor="#006699"></asp:Label></span>
                                                            </div>
                                                            <div id="divNewInvoice" runat="server" style="display: none; margin-left: 20px; width: 100%;">
                                                                <asp:FileUpload ID="upattach" runat="server" Style="display: none" />
                                                                <%--   <script type="text/javascript">
                                    function ontxtInvoicechange() {

                                        document.getElementById("<%=lblErrorInvoice.ClientID %>").innerHTML = "";
                                    }
                                
                                </script>--%>
                                                                <div>
                                                                    <asp:Label ID="lblErrorInvoice" runat="server" Text="" ForeColor="Red" Font-Size="Small"></asp:Label>
                                                                </div>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/pdf.png" />
                                                                            <asp:FileUpload ID="FileUploadInserInvoice" runat="server" placeholder="Description.." />
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUploadInserInvoice"
                                                                                ErrorMessage="Please select a .pdf  file only" ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F))|((d|D)(o|O)(c|C)))$"
                                                                                ForeColor="#990000" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                        <tr>
                                                                            <td>&nbsp;
                                                    
                                                                            </td>
                                                                        </tr>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="txtInvoiceRemarks" runat="server" onchange="ontxtInvoicechange()"
                                                                                TextMode="MultiLine" Height="80px" style=" width:100%; padding:5px; border:1px #ccc solid;" ClientIDMode="Static" CssClass="textbox" placeholder="Remarks *"></asp:TextBox>
                                                                        </td>
                                                                        <td>&nbsp;
                                                
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="BtnAddInvoice" runat="server" Text="Add invoice" class="send_btns"
                                                                                OnClick="BtnAddInvoice_Click" Style="display: none" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="clear">
                                                                <%-- <asp:LinkButton ID="LnkShowInvoice" runat="server" OnClientClick="onChangeDiv(); return false;">Add New Invoice</asp:LinkButton>--%>
                                                            </div>
                                                        </ContentTemplate>

                                                    </asp:UpdatePanel>


                                                </div>
                                                <div class="event-col-mid-clients-mid-col-add-invoice-right" style="float: right; margin-top: 3px;">
                                                    <%-- <span style="background-color: #CCCCCC;
                                            padding: 5px 15px 5px 15px; cursor: pointer; border: thin solid #666666" onclick="gettick()">Attach</span>--%>
                                                </div>

                                            </div>
                                        </div>
                                        <%--  </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                        <div class="clear"></div>



                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>


                                         

                                        <div class="event-col-Payment-Details-mid-Add-Notification">
                                            <div class="event-col-Payment-Details-mid-Add-Notification-text">
                                                <p>Add Notification</p>
                                            </div>

                                            <div class="event-col-Payment-Details-mid-Add-Notification-input">
                                                <asp:DropDownList ID="ddluser" CssClass="textbox" AppendDataBoundItems="true" onchange="onddluser();" runat="server" Style="width: 45%; height: 33%; float: left; margin-right: 20px; margin-bottom:8px;">
                                                    <asp:ListItem Value="0">Select Notification</asp:ListItem>
                                                </asp:DropDownList>


                                                <asp:TextBox runat="server" placeholder="Date" CssClass="event-col-Payment-Details-mid-Add-Notification-input-main" ID="txtnotidate" Style="width: 200px; height: 20px; float: left;"></asp:TextBox>

                                                <asp:TextBox runat="server" placeholder="Description" CssClass="event-col-Payment-Details-mid-Add-Notification-input-main" Height="50px" Width="200px" ID="txtnoti"></asp:TextBox>

                                                <asp:CalendarExtender ID="CalendarExtender6" TargetControlID="txtnotidate" PopupButtonID="txtnotidate" runat="server">
                                                </asp:CalendarExtender>
                                                <asp:Button runat="server" ID="btnnoti" OnClientClick=" return date();"
                                                    Text="Add" OnClick="btnnoti_Click" Style="color: #fff; font-size: 12px; text-align: center; background: #272f45; line-height: 15px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 2px 10px; margin-top: 10px; float: left; margin-left: 20px;" />
                                            </div>


                                            <%-- <span style="background-color: #CCCCCC; display: none; float: right; margin-top: 10px; padding: 3px 5px 3px 5px; margin-right: 10px; cursor: pointer; color: #333333; font-size: small"
                                                onclick="myfunction()">Add 123</span>--%>

                                            <div style="text-align: right; margin-top: 8px; margin-right: 9px;">

                                                <%-- OnClick="btnnoti_Click"--%>
                                                <br />
                                                <asp:HiddenField ID="hdngridcount" runat="server" />
                                                <div>
                                                    <asp:GridView ID="gvuser" runat="server" AllowPaging="True" AutoGenerateColumns="false"
                                                        OnRowCommand="gvuser_RowCommand"
                                                        Width="100%" BackColor="White" BorderColor="#336699" BorderStyle="Solid" BorderWidth="1px"
                                                        GridLines="Horizontal">
                                                        <AlternatingRowStyle BackColor="#98BADC" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Name">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="lbluserid" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                                    <asp:Label runat="server" ID="lblusername" Text='<%#Eval("User") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="lbldesc" Text='<%#Eval("Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="lbldate" Text='<%#Eval("Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ID="btndlt" CommandArgument="<%#Container.DataItemIndex %>"
                                                                        CommandName="dlt" ImageUrl="~/img/cross_icon.png" Height="10px" Width="10px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <EmptyDataRowStyle BackColor="#990000" BorderColor="#D8D8D8" ForeColor="White" HorizontalAlign="Center"
                                                            VerticalAlign="Middle" />
                                                        <HeaderStyle BackColor="#336699" Font-Names="Arial,Helvetica,sans-serif" Font-Size="13px"
                                                            ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <RowStyle Font-Names="Arial,Helvetica,sans-serif" Font-Size="12px" ForeColor="#333333"
                                                            Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <SelectedRowStyle BorderColor="#006666" BorderStyle="Solid" BorderWidth="1px" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                               </ContentTemplate>
                                        </asp:UpdatePanel>
                                        </div>




                                    </div>



                                </div>
                            </div>

                        </div>
                        <div class="col-sm-3">
                            <div class="event-col-Payment-Details">
                                <div class="event-col-Payment-Details-head">
                                    <p style="float: left;">Payment Details&nbsp;&nbsp;</p>
                                    <asp:DropDownList runat="server" Style="width: 40%; float: left;" AppendDataBoundItems="true" CssClass="textbox" ID="ddlcurr">
                                        <asp:ListItem>USD</asp:ListItem>
                                        <asp:ListItem>Euro</asp:ListItem>
                                        <asp:ListItem>INR</asp:ListItem>
                                        <asp:ListItem>Yen</asp:ListItem>
                                       
                                    </asp:DropDownList>

                                </div>
                                <div class="event-col-Payment-Details-mid">

                                    <div class="event-col-Payment-Details-mid-text">
                                        <div class="event-col-Payment-Details-mid-text-input">
                                            <p>Total Billable Amount </p>
                                        </div>

                                        <asp:TextBox ID="txttamt"  onkeyup="return amtcheck1()" onchange="return amtcheck1()" runat="server" CssClass="event-col-Payment-Details-mid-text-input-main" placeholder="Amount Only Numeric.." onkeypress="return validate(event)" oncopy="return false" onpaste="return false" oncut="return false"></asp:TextBox>
                                        <div class="clear"></div>
                                        <div class="event-col-Payment-Details-mid-text-input">
                                            <p>Paid Amount</p>
                                        </div>

                                        <asp:TextBox ID="txtdamt" onkeyup="return amtcheck2()" onchange="return amtcheck2()" runat="server" CssClass="event-col-Payment-Details-mid-text-input-main" placeholder="Amount Only Numeric.." onkeypress="return validate(event)" oncopy="return false" onpaste="return false" oncut="return false"></asp:TextBox>
                                        <div class="clear"></div>
                                        <div class="event-col-Payment-Details-mid-text-input">
                                            <p>Payable</p>
                                        </div>

                                        <asp:TextBox ID="txtbamt" ReadOnly="true" runat="server"  CssClass="event-col-Payment-Details-mid-text-input-main" placeholder="Amount Only Numeric.." onkeypress="return validate(event)" oncopy="return false" onpaste="return false" oncut="return false"></asp:TextBox>
                                        <asp:HiddenField ID="hdnbamt" runat="server" />
                                        <asp:TextBox ID="txtOBR" runat="server" Visible="false" ClientIDMode="Static" CssClass="date_insert add"></asp:TextBox>
                                    </div>

                                    <div class="clear"></div>
                                    <div class="event-col-mid-clients-mid-col-add-attachment-col">
                                        <p>Add Attachments</p>
                                        <div class="event-col-mid-clients-mid-col-add-attachment-main">

                                            <div class="event-col-mid-clients-mid-col-attachment">
                                                <div class="event-col-mid-clients-mid-col-attachment-left">
                                                    <p>1.</p>
                                                </div>
                                                <div class="event-col-mid-clients-mid-col-attachment-mid">
                                                    <div id="uploadFile_div">

                                                        <asp:FileUpload ID="attach1" runat="server" Style="color: Blue;" onchange="fileselect();" />
                                                        <a onclick="if (!confirm('Are you sure you want delete?')) return false; clearFileInputField('uploadFile_div')"
                                                            href="javascript:noAction();" id="att1" runat="server" style="display: none">Clear</a>
                                                    </div>



                                                </div>

                                            </div>


                                            <div class="event-col-mid-clients-mid-col-attachment">
                                                <div class="event-col-mid-clients-mid-col-attachment-left">
                                                    <p>2.</p>
                                                </div>
                                                <div class="event-col-mid-clients-mid-col-attachment-mid">


                                                    <div id="div11">

                                                        <asp:FileUpload ID="attach2" runat="server" Style="color: Blue;" onchange="fileselect2();" />
                                                        <a onclick="if (!confirm('Are you sure you want delete?')) return false; clearFileInputField('div11')"
                                                            href="javascript:noAction();" id="att2" runat="server" style="display: none">Clear</a>
                                                    </div>



                                                </div>
                                            </div>

                                            <div class="event-col-mid-clients-mid-col-attachment">
                                                <div class="event-col-mid-clients-mid-col-attachment-left">
                                                    <p>3.</p>
                                                </div>
                                                <div class="event-col-mid-clients-mid-col-attachment-mid">


                                                    <div id="div222">

                                                        <asp:FileUpload ID="attach3" runat="server" Style="color: Blue;" onchange="fileselect3();" />
                                                        <a onclick="if (!confirm('Are you sure you want delete?')) return false; clearFileInputField('div222')"
                                                            href="javascript:noAction();" id="att3" runat="server" style="display: none">Clear</a>
                                                    </div>
                                                </div>


                                            </div>

                                            <div class="event-col-mid-clients-mid-col-attachment">
                                                <div class="event-col-mid-clients-mid-col-attachment-left">
                                                    <p>4.</p>
                                                </div>
                                                <div class="event-col-mid-clients-mid-col-attachment-mid">
                                                    <div id="Div3">

                                                        <asp:FileUpload ID="attach4" runat="server" Style="color: Blue;" onchange="fileselect4();" />
                                                        <a onclick="if (!confirm('Are you sure you want delete?')) return false; clearFileInputField('Div3')"
                                                            href="javascript:noAction();" id="att4" runat="server" style="display: none">Clear</a>
                                                    </div>




                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                    <div class="event-col-Payment-Details-mid-Add-Notes">

                                        <p>Add Notes</p>

                                        <div class="clear"></div>
                                        <div class="event-col-Payment-Details-mid-Add-Notes-input">


                                            <asp:TextBox ID="txtNotes" runat="server" CssClass="event-col-Payment-Details-mid-Add-Notes-input-main" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div class="clear"></div>
                                        <div class="event-col-Payment-Details-mid-Add-Notes-button">
                                            <div class="event-col-more">

                                                <asp:Button ID="btndone1" runat="server" Text="Submit" Style="color: #fff; font-size: 12px; text-align: center; background: #272f45; line-height: 15px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 2px 10px; float: left; margin-left: 20px;" OnClientClick="return validatedata();"
                                                    OnClick="btndone1_Click" />
                                            </div>
                                        </div>
                                        <div class="event-col-Payment-Details-mid-Add-Notes-button">
                                            <div class="event-col-more">
                                                <%--	<p><a href="#">Reset</a></p>--%>
                                                <asp:Button ID="btnreset" runat="server" Style="color: #fff; font-size: 12px; text-align: center; background: #272f45; line-height: 15px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 2px 10px; float: left; margin-left: 20px;"
                                                    Text="Reset" OnClientClick="return formresetAddevent()" OnClick="btnreset_Click" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id="fade" class="black_overlay">
    </div>
    <div style="display: none">
        <h2 class="popup_main_heading">Reminders Checklist</h2>
        <div class="reminder_check_left">
            <asp:CheckBox ID="rdMainEx" onchange="chkk()" runat="server" CssClass="check_round"
                GroupName="E" />
            <label>
                Contract Received</label>
            <div class="clear">
            </div>
            <asp:CheckBox ID="rdInsurance" onchange="chkk()" runat="server" CssClass="check_round"
                GroupName="E" />
            <label>
                Certificate Of Insurance</label>
            <div class="clear">
            </div>
            <asp:CheckBox ID="rdlay" onchange="chkk()" runat="server" CssClass="check_round"
                GroupName="E" />
            <label>
                Layout</label>
            <div class="clear">
            </div>
            <asp:CheckBox ID="rdReminder" runat="server" onchange="chkk()" CssClass="check_round"
                GroupName="E" />
            <label>
                Operational Balance Received</label>
            <div class="clear">
            </div>
        </div>
        <div class="reminder_check_right">
            <label>
                Date</label>
            <asp:TextBox ID="txtRDate1" runat="server" Enabled="false" CssClass="date_insert add"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtRDate1"
                PopupButtonID="txtRDate1">
            </asp:CalendarExtender>
            <div class="clear">
            </div>
            <label>
                Date</label>
            <asp:TextBox ID="txtRDate2" runat="server" Enabled="false" CssClass="date_insert add"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender4" TargetControlID="txtRDate2" PopupButtonID="txtRDate2"
                runat="server">
            </asp:CalendarExtender>
            <div class="clear">
            </div>
            <label>
                Date</label>
            <asp:TextBox ID="txtRDate3" runat="server" Enabled="false" CssClass="date_insert add"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender5" TargetControlID="txtRDate3" PopupButtonID="txtRDate3"
                runat="server">
            </asp:CalendarExtender>
            <div class="clear">
            </div>
            <label>
                Date</label>
            <asp:TextBox ID="txtRDate4" runat="server" Enabled="false" CssClass="date_insert add"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender7" TargetControlID="txtRDate4" PopupButtonID="txtRDate4"
                runat="server">
            </asp:CalendarExtender>
            <div class="clear">
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
