<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Admin1.aspx.cs" Inherits="EbookingWebProject.Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
 <%--   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
 <%--<script type="text/javascript">
     $("#table tr").click(function () {
         $(this).addClass('selected').siblings().removeClass('selected');
         var value = $(this).find('td:first').html();
         alert(value);
     });

     $('.ok').on('click', function (e) {
         alert($("#table tr.selected td:first").html());
     });
 </script>--%>
   <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>--%>

<%--<script type="text/javascript">
    window.onload = function () {
        debugger;
        $(function () {
            $.ajax({
                type: "POST",
                url: "Admin.aspx/FillGridAdmin",
                data: '{}',
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

        });

        function OnSuccess(response) {

            debugger;
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var users = xml.find("Table");
            $("#Table tr").click(function () {
                debugger;
                $(this).addClass('selected').siblings().removeClass('selected');
                var value = $(this).find('td:first').html();
                alert(value);
            });

            $('.ok').on('click', function (e) {
                alert($("#Table tr.selected td:first").html());
            });
            var row = $("[id*=grdAdmin] tr:last-child").clone(true);
            $("[id*=grdAdmin] tr").not($("[id*=grdAdmin] tr:first-child")).remove();
            var count = 1;
            $.each(users, function () {
                //var users = $(this);
                $("td", row).eq(0).html($(this).find("id").text());
                $("td", row).eq(1).html($(this).find("fname").text());
                $("td", row).eq(2).html($(this).find("lname").text());
                $("td", row).eq(3).html($(this).find("email").text());
                $("td", row).eq(4).html($(this).find("phone").text());
                $("td", row).eq(5).html($(this).find("pass").text());
                $("td", row).eq(6).html($(this).find("userrole").text());
                $("td", row).eq(7).html('<input type="button" name="OK" class="ok" value="OK"/>');

                $("[id*=grdAdmin]").append(row);

                //define the background stryle of newly created row           
                if (count == 1 || (count % 2 != 0)) {
                    $(row).css("background-color", "#ffffff");
                }
                else {
                    $(row).css("background-color", "#98BADC");
                }
                count = count + 1;
                row = $("[id*=grdAdmin] tr:last-child").clone(true);
            });


        }
    }

</script>--%>
        <asp:HiddenField ID="hdnemailid" runat="server" />
<%--<script src="Scripts/jquery-1.7.1.min.js" ></script> --%>
     <script src="jquery-ui.min.js" ></script> 
<script type="text/javascript">

    function UserOrEmailAvailability() { //This function call on text change.

        $.ajax({
            type: "POST",
            url: "Admin.aspx/checkmail", // this for calling the web method function in cs code.  
            data: '{useremail: "' + $("#<%=txtemail.ClientID%>")[0].value + '" }', // user name or email value  
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response);
            }
        });
    }

    // function OnSuccess  
    function OnSuccess(response) {
        var msg = $("#<%=lblid.ClientID%>")[0];
        switch (response.d) {
            case "true":
                msg.style.display = "block";
                msg.style.color = "red";
                msg.innerHTML = "Email already exists.";
                document.getElementById("<%=txtemail.ClientID %>").focus();
                document.getElementById("<%=hdnemailid.ClientID %>").value = "0";
                break;
            case "false":
                //                msg.style.display = "block";
                //                msg.style.color = "green";
                //                msg.innerHTML = "Email Available";
                document.getElementById("<%=hdnemailid.ClientID %>").value = "";
                msg.innerHTML = "";
                break;
        }
    }

    </script>
        <asp:HiddenField ID="hdnpassword" runat="server" />
     <asp:HiddenField ID="hdnpwdvalue" runat="server" />
<script type="text/javascript">
    function calme(test) {
        var data = test.split(",");
        document.getElementById("<%=txtadminId.ClientID %>").value = data[0];
        document.getElementById("<%=txtfname.ClientID %>").value = data[1];
        document.getElementById("<%=txtLname.ClientID %>").value = data[2];
        document.getElementById("<%=txtemail.ClientID %>").value = data[3];

        document.getElementById("<%=txtphone.ClientID %>").value = data[4];
        document.getElementById("<%=hdnpassword.ClientID %>").value = data[5];

        document.getElementById("<%=ddlrole.ClientID %>").value = data[6];
        document.getElementById("<%=btnsave.ClientID %>").value = "UPDATE";
        //document.getElementById("<%=txtemail.ClientID %>").disabled = true;
        document.getElementById("<%=divchpassword.ClientID %>").style.display = "none";
        document.getElementById("<%=lnkpwd.ClientID %>").style.display = "block";
        document.getElementById("<%=lblid.ClientID %>").innerHTML = "";
        return false;
    }
</script>
<script type="text/javascript">
    function updateAdmin() {
        var txtadminId = document.getElementById("<%=txtadminId.ClientID %>").value;
        var txtfname = document.getElementById("<%=txtfname.ClientID %>").value.trim();
        var txtLname = document.getElementById("<%=txtLname.ClientID %>").value.trim();
        var txtemail = document.getElementById("<%=txtemail.ClientID %>").value.trim();
        var txtphone = document.getElementById("<%=txtphone.ClientID %>").value.trim();
        var txtpwd = document.getElementById("<%=txtpwd.ClientID %>").value.trim();
        var txtConfirmpwd = document.getElementById("<%=txtconfirmpwd.ClientID %>").value.trim();

        var ddlrole = document.getElementById("<%=ddlrole.ClientID %>").value;
        var btnvalue = document.getElementById("<%=btnsave.ClientID %>").value;
        var lblerrormsg = document.getElementById("<%=hdnemailid.ClientID %>").value;
        var emailRegex = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        // document.getElementById("<%=txtemail.ClientID %>").disabled = true;
        if (txtfname)
        { }
        else {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter First Name.';
            document.getElementById("<%=txtfname.ClientID %>").focus();
            return false;
        }
        if (txtLname)
        { }
        else {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Last Name.';
            document.getElementById("<%=txtLname.ClientID %>").focus();
            return false;
        }
        if (txtemail)
        { }
        else {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Email.';
            document.getElementById("<%=txtemail.ClientID %>").focus();
            return false;
        }
        if (lblerrormsg) {

            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Email Already Exists.';
            document.getElementById("<%=txtemail.ClientID %>").focus();
            return false;
        }
        else {

        }
        if (!txtemail.match(emailRegex)) {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Invalid Email id';
            document.getElementById("<%=txtemail.ClientID %>").focus();
            return false;
        }
        else {

        }
        if (txtphone)
        { }
        else {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Phone Number.';
            document.getElementById("<%=txtphone.ClientID %>").focus();
            return false;
        }
        if (document.getElementById("<%=btnsave.ClientID %>").value == 'UPDATE') {
            if (document.getElementById("<%=hdnpwdvalue.ClientID %>").value == "1") {
                if (txtpwd)
                { }
                else {
                    document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Password.';
                    document.getElementById("<%=txtpwd.ClientID %>").focus();
                    return false;
                }

                if (txtConfirmpwd)
                { }
                else {
                    document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Confirm Password.';
                document.getElementById("<%=txtconfirmpwd.ClientID %>").focus();
                return false;
            }
        }
        else {

        }

    }
    else {
        if (txtpwd)
        { }
        else {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Password.';
                document.getElementById("<%=txtpwd.ClientID %>").focus();
                return false;
            }

            if (txtConfirmpwd)
            { }
            else {
                document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Enter Confirm Password.';
                document.getElementById("<%=txtconfirmpwd.ClientID %>").focus();
                return false;
            }
        }
        if (document.getElementById("<%=txtpwd.ClientID %>").value != document.getElementById("<%=txtconfirmpwd.ClientID %>").value) {

            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Password did not Match.';
            document.getElementById("<%=txtconfirmpwd.ClientID %>").focus();
            return false;
        }
        else {

        }



        if (ddlrole == '0') {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = '*Please Select Role.';
            //document.getElementById("<%=ddlrole.ClientID %>").selectedIndex = 0;
            return false;
        }
        else {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = "";

        }
        var Admininfo = txtadminId + "," + txtfname + "," + txtLname + "," + txtemail + "," + txtphone + "," + txtpwd + "," + ddlrole + "," + btnvalue;
        PageMethods.UpdateAdminInfo(Admininfo, onsuccess, onfail);
        function onsuccess(value) {
            location.reload();

        }
        function onfail() {

            alert("Error");
        }
        return false;


    }
</script>
<script type="text/javascript">
    function onchangecl() {
        document.getElementById("<%=lblid.ClientID %>").innerHTML = "";
        return false;
    }

</script>
<script type="text/javascript">
    function deleteadmin(text) {
        PageMethods.DeleteAdminInfo(text, onsuccess, onfail);
        function onsuccess(value) {
            location.reload();

        }
        function onfail() {

            alert("Error");
        }
        return false;
    }
</script>
<script type="text/javascript">
    function cleartextvalue() {

        document.getElementById("<%=txtadminId.ClientID %>").value = "";
        document.getElementById("<%=txtfname.ClientID %>").value = "";
        document.getElementById("<%=txtLname.ClientID %>").value = "";
        document.getElementById("<%=txtemail.ClientID %>").value = "";
        document.getElementById("<%=txtphone.ClientID %>").value = "";
        document.getElementById("<%=txtpwd.ClientID %>").value = "";
        document.getElementById("<%=txtconfirmpwd.ClientID %>").value = "";
        document.getElementById("<%=ddlrole.ClientID %>").selectedIndex = "0";
        document.getElementById("<%=btnsave.ClientID %>").value = "Add Admin";
        document.getElementById("<%=hdnemailid.ClientID %>").value = "";
        document.getElementById("<%=divchpassword.ClientID %>").style.display = "block";
        document.getElementById("<%=lnkpwd.ClientID %>").style.display = "none";
        document.getElementById("<%=lblid.ClientID %>").innerHTML = "";
        document.getElementById("<%=A1.ClientID %>").style.display = "none";

        return false;


    }

</script>
<script type="text/javascript">
    function changepws() {
        document.getElementById("<%=divchpassword.ClientID %>").style.display = "block";
        document.getElementById("<%=txtconfirmpwd.ClientID %>").value = "";
        document.getElementById("<%=A1.ClientID %>").style.display = "block";
        document.getElementById("<%=lnkpwd.ClientID %>").style.display = "none";
        document.getElementById("<%=hdnpwdvalue.ClientID %>").value = "1";


        //alert(document.getElementById("<%=hdnpwdvalue.ClientID %>").value = "1");

        return false;

    }
</script>
    <script type="text/javascript">
        function cancelpwd() {
            document.getElementById("<%=hdnpwdvalue.ClientID %>").value = "0";
            //alert(document.getElementById("<%=hdnpwdvalue.ClientID %>").value = "0");
            document.getElementById("<%=lnkpwd.ClientID %>").style.display = "block";
            document.getElementById("<%=divchpassword.ClientID %>").style.display = "none";
            document.getElementById("<%=txtconfirmpwd.ClientID %>").value = "";
            document.getElementById("<%=txtpwd.ClientID %>").value = "";
            document.getElementById("<%=txtconfirmpwd.ClientID %>").innerHTML = "";


            return false;

        }
</script>
 <style type="text/css">
        .cssPager tr
        {
            padding-left: 8px; background:none !important;
            padding-right: 4px;
        }
    </style>
    <asp:Panel ID="Panel2" runat="server" DefaultButton="btnsave">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="clear"></div>

                <div id="full-width">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12" style="padding: 0px;">
                                <div class="manage-col">
                                    <div class="col-sm-3">

                                        <div class="manage-col-left-head">
                                            <p>Add New Admin/User</p>
                                            <asp:Label ID="lblid" runat="server" ForeColor="Red" Text="" Style="position: fixed; margin-top: -1px;"></asp:Label>

                                        </div>

                                        <div class="manage-col-left">

                                            <asp:HiddenField ID="hdbPromtId" runat="server" />
                                            <asp:Label ID="lbladded" runat="server" Style="display: none"><span>&#10004;</span> New Promoter added</asp:Label>
                                            <%-- <input type="text" value="First Name *" name="na" class="manage-col-left-input-main">--%>
                                           <asp:TextBox ID="txtadminId" runat="server" placeholder="Admin Id *" style="display:none"></asp:TextBox>
                <asp:TextBox ID="txtfname" ClientIDMode="Static" placeholder="First Name *" CssClass="manage-col-left-input-main" onchange="return onchangecl()"
                    runat="server"  ></asp:TextBox>
                                            <div class="clear"></div>
                                                           <asp:TextBox ID="txtLname" ClientIDMode="Static" placeholder="Last Name *" CssClass="manage-col-left-input-main" onchange="return onchangecl()"
                    runat="server"></asp:TextBox>
                                            <%-- <input type="text" value="Last Name *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                          <asp:TextBox ID="txtemail" ClientIDMode="Static" CssClass="manage-col-left-input-main" placeholder="Email *" onchange="UserOrEmailAvailability();"
                    runat="server"></asp:TextBox>
                                            <%-- <input type="text" value="Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            
                                            <%--  <input type="text" value="Confirm Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                           <asp:TextBox ID="txtphone" ClientIDMode="Static" CssClass="manage-col-left-input-main" placeholder="Phone *" onchange="return onchangecl()"
                    runat="server"></asp:TextBox>
                                            <%-- <input type="text" value="Phone Number Only Numeric *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                 <a  href="#" id="lnkpwd" runat="server" onclick="return changepws()" style="display:none;padding: 5px 5px 5px 5px; margin-top: 8px;">Change Password</a> 
                                             <div class="clear"></div>
                                            <div id="divchpassword" runat="server">
             <div >
                <asp:TextBox ID="txtpwd" ClientIDMode="Static" CssClass="manage-col-left-input-main" placeholder="Password *" TextMode="Password"  onchange="return onchangecl()"
                    runat="server"></asp:TextBox>
            </div>
            <div >
                <asp:TextBox ID="txtconfirmpwd" ClientIDMode="Static" CssClass="manage-col-left-input-main" placeholder="Confirm Password *" TextMode="Password" onchange="return onchangecl()"
                    runat="server"></asp:TextBox>
                  <a  href="#" id="A1" runat="server" onclick="return cancelpwd()" style="display:none;padding: 5px 5px 5px 5px; margin-top: 8px;">Cancel</a> 
            </div>
            </div>
                                             <div class="clear"></div>

                                             <asp:DropDownList ID="ddlrole" runat="server" CssClass="manage-col-left-input-main" style=" height:42px;">
                 <asp:ListItem Text="--Select--" Value="0">--Select--</asp:ListItem>
                 <asp:ListItem Text="Admin" Value="Admin">Admin</asp:ListItem>
                 <asp:ListItem Text="Manager" Value="Manager">Manager</asp:ListItem>
                 <asp:ListItem Text="Staff" Value="Staff">Staff</asp:ListItem>
                 </asp:DropDownList>
  <div class="clear"></div>


                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                  
                                                    <asp:Button ID="btnsave" OnClientClick="return updateAdmin();" runat="server" Text="Add Admin"  style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                  
                                                    <asp:Button ID="btncalcel"  runat="server" Text="Cancel" OnClientClick="return cleartextvalue();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">

                                        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsearch">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="float:left;"> All Admin/User </p>
                                           <div style=" float:right; margin-right:20px;"><p style="color:#fff; float:left;">Search</p> &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="First name, Last name, Email,Phone" value="" size="20" style="border-right:10px; border:1px #990000 solid;" />
                                               <asp:Button ID="btnsearch" runat="server"  Text="Go" style="color:#272f45; width:40px; font-size:12px; text-align:center; background:#fff; line-height:12px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px;  margin-left:10px; border-radius:5px; padding:3px; height:20px; float:right;" OnClick="btnsearch_Click" />
                                            </div>
                                            </div>
                                   
                                            <div class="clear"></div>
                                              <div class="manage-col-left" style="padding:0px;">
                                            <asp:GridView ID="grdAdmin"  AutoGenerateColumns="false"  runat="server" Width="100%"
                    BackColor="White" BorderColor="#336699" BorderStyle="Solid" BorderWidth="0px"
                    GridLines="Horizontal" EmptyDataText="No Record Found." 
                    AllowPaging="True"  ShowFooter="True" 
                    onpageindexchanging="grdAdmin_PageIndexChanging" 
                   PageSize="10"  CssClass="grid" >
                                                <PagerStyle CssClass="cssPager" />

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid" style="background:none;  width:100%;">

                                                                <div class="manage-col-mid-full-name" style="width:15%;">
                                                                    <p>Full Name</p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>Email</p>
                                                                </div>
                                                                <div class="manage-col-mid-phone"  style="width:12%;">
                                                                    <p>Phone</p>
                                                                </div>
                                                                  <div class="manage-col-mid-phone" style="display:none">
                                                                    <p>Password</p>
                                                                </div>
                                                                  <div class="manage-col-mid-phone">
                                                                    <p>User Role</p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                    <p>Edit</p>
                                                                </div>
                                                                <div class="manage-col-mid-delete">
                                                                    <p>Delete</p>
                                                                </div>




                                                            </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <div class="">
                                                                <div class="manage-col-mid-full-name" style="width:15%;">
                                                                    <p>
                                                                       <asp:Label runat="server" ID="lblquantity"><%#Eval("fname")%></asp:Label>

                                                                        <asp:Label runat="server" ID="lblremarks"><%#Eval("lname")%></asp:Label>

                                 <asp:Label runat="server" ID="lblitemname" style="display:none"  ><%#Eval("id") %>  </asp:Label>
                                                                    </p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblcreatedate"><%#Eval("email") %></asp:Label></p>
                                                                </div>
                                                                <div class="manage-col-mid-phone"  style="width:12%;">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="Label1"><%#Eval("phone")%></asp:Label></p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone" style="display:none">
                                                                    <p>
                                                                         <asp:Label runat="server" ID="Label2" style="display:none" ><%# Eval("pass")%></asp:Label></p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="Label3"><%#Eval("userrole")%></asp:Label></p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                       <a  href="#" onclick="calme('<%#Eval("id")+","+Eval("fname")+","+Eval("lname")+","+Eval("email")+","+Eval("phone")+","+Eval("pass")+","+Eval("userrole")%>')">Edit</a>
                                                                </div>
                                                                <div class="manage-col-mid-delete">
                                                                     <a href="#" onclick="if (!confirm('Are you sure you want delete?')) return false; deleteadmin('<%#Eval("id")%>')">Delete</a>
                                                                </div>
                                                            </div></
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>




                                        </div></div>
</asp:Panel>
                                    </div>



                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </asp:Panel>
</asp:Content>
