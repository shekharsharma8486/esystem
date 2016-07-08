<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="EbookingWebProject.AccessInfo1" %>
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
    <link href="css/SearchBox.css" rel="stylesheet" />
<style type="text/javascript">
        #search, #submit
        {
            float: left;
        }
        
        #search
        {
            padding: 5px 9px;
            height: 23px;
            width: 380px;
            border: 1px solid #a4c3ca;
            font: normal 13px 'trebuchet MS' , arial, helvetica;
            background: #f1f1f1;
            border-radius: 50px 3px 3px 50px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);
        }
        
        /* ----------------------- */
        
        #submit
        {
            background-color: #6cbb6b;
            background-image: linear-gradient(#95d788, #6cbb6b);
            border-radius: 3px 50px 50px 3px;
            border-width: 1px;
            border-style: solid;
            border-color: #7eba7c #578e57 #447d43;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            height: 35px;
            margin: 0 0 0 10px;
            padding: 0;
            width: 90px;
            cursor: pointer;
            font: bold 14px Arial, Helvetica;
            color: #23441e;
            text-shadow: 0 1px 0 rgba(255,255,255,0.5);
        }
        
        #submit:hover
        {
            background-color: #95d788;
            background-image: linear-gradient(#6cbb6b, #95d788);
        }
        
        #submit:active
        {
            background: #95d788;
            outline: none;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
        }
        
        #submit::-moz-focus-inner
        {
            border: 0; /* Small centering fix for Firefox */
        }
    </style>
    <script type="text/javascript">
        function calme(test) {

            var data = test.split(",");

            document.getElementById("<%=txtPageName.ClientID %>").readOnly = true;
            document.getElementById("<%=txtid.ClientID %>").readOnly = true;
            document.getElementById("<%=ddlselectRole.ClientID %>").disabled = true;
            document.getElementById("<%=btnsave.ClientID %>").disabled = false;
            document.getElementById("<%=txtid.ClientID %>").value = data[0];
            document.getElementById("<%=hdnPage.ClientID %>").value = data[0];

            document.getElementById("<%=ddlselectRole.ClientID %>").value = data[1];
            document.getElementById("<%=txtPageName.ClientID %>").value = data[2];

            if (data[3] == "True") {
                document.getElementById("<%=ckPageAccess.ClientID %>").checked = true;
            }
            if (data[3] == "False") {
                document.getElementById("<%=ckPageAccess.ClientID %>").checked = false;
            }
            if (data[4] == "True") {
                document.getElementById("<%=chPageEdit.ClientID %>").checked = true;
            }
            if (data[4] == "False") {
                document.getElementById("<%=chPageEdit.ClientID %>").checked = false;
            }

            if (data[5] == "True") {
                document.getElementById("<%=chPageUpdate.ClientID %>").checked = true;
            }
            if (data[5] == "False") {
                document.getElementById("<%=chPageUpdate.ClientID %>").checked = false;
            }
            if (data[6] == "True") {
                document.getElementById("<%=chPageDetele.ClientID %>").checked = true;
            }
            if (data[6] == "False") {
                document.getElementById("<%=chPageDetele.ClientID %>").checked = false;
            }
            document.getElementById("<%=btnsave.ClientID %>").value = "Update";




        }
</script>
    <script type="text/javascript">
        function reloadPage() {


            document.getElementById("<%=txtPageName.ClientID %>").readOnly = true;
            document.getElementById("<%=txtPageName.ClientID %>").value = "";
            document.getElementById("<%=txtid.ClientID %>").readOnly = true;
            document.getElementById("<%=ddlselectRole.ClientID %>").disabled = true;
            document.getElementById("<%=ddlselectRole.ClientID %>").selectedIndex = 0;
            document.getElementById("<%=btnsave.ClientID %>").disabled = true;
            document.getElementById("<%=btnsave.ClientID %>").value = "Update Access";
            document.getElementById("<%=hdnPage.ClientID %>").value = "0";
            document.getElementById("<%=ckPageAccess.ClientID %>").checked = false;

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
                                            <p>Update Access</p>
                                              <asp:HiddenField ID="hdnPage" runat="server" />
                                            <asp:Label ID="lblid" runat="server" ForeColor="Red" Text="" Style="position: fixed; margin-top: -1px;"></asp:Label>

                                        </div>
                                         <div class="manage-col-left">
                                         <div style=" color: green;display:none;">
                <asp:Label ID="Label1" runat="server" Visible="False"><span>&#10004;</span> New Page added</asp:Label>
            </div>
                                        <div style="display:none;">
                <asp:TextBox ID="txtid" ClientIDMode="Static" onchange="txtonchange();" placeholder="ID *"
                   CssClass="manage-col-left-input-main" runat="server" ></asp:TextBox>
            </div>
                                          <asp:DropDownList ID="ddlselectRole" runat="server" CssClass="manage-col-left-input-main" Enabled="false"
                    style="height:42px;" >
                 <asp:ListItem Text="--Select--" Value="0">--Select--</asp:ListItem>
                 <asp:ListItem Text="Admin" Value="Admin">Admin</asp:ListItem>
                 <asp:ListItem Text="Manager" Value="Manager">Manager</asp:ListItem>
                 <asp:ListItem Text="Staff" Value="Staff">Staff</asp:ListItem>
                 </asp:DropDownList>

                                      

                                            
                                            <asp:Label ID="lbladded" runat="server" Style="display: none"><span>&#10004;</span> New Promoter added</asp:Label>
                                            <%-- <input type="text" value="First Name *" name="na" class="manage-col-left-input-main">--%>
                                             <asp:TextBox ID="txtPageName" ClientIDMode="Static" onchange="txtonchange();" CssClass="manage-col-left-input-main" 
                    placeholder="Page Name*" runat="server"></asp:TextBox>
                                            <div class="clear"></div><br />
                                             Access Page <asp:CheckBox ID="ckPageAccess" runat="server" />
                                            <div style="display:none;">
              Access Edit <asp:CheckBox ID="chPageEdit" runat="server" CssClass="manage-col-left-input-main" />
            </div>
                                             <div style="display:none;">
              Access Update <asp:CheckBox ID="chPageUpdate" runat="server" CssClass="manage-col-left-input-main" />
            </div>
                                            <div style="display:none;">
              Access Delete <asp:CheckBox ID="chPageDetele" runat="server"  CssClass="manage-col-left-input-main"/>
            </div>
                                            <%-- <input type="text" value="Last Name *" name="na" class="manage-col-left-input-main">--%>
                                             <div class="clear"></div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                  
                                                    <asp:Button ID="btnsave"  runat="server" Text="Update Access" OnClick="btnsave_Click" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                  
                                                    <asp:Button ID="btnCancel"  runat="server" Text="Cancel" OnClientClick="return  reloadPage();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="float:left;"> Page Access Information</p>
                                                 Select Role:-  <asp:DropDownList ID="ddlrole" runat="server" CssClass="textbox" 
                      onselectedindexchanged="ddlrole_SelectedIndexChanged" AutoPostBack="true">
                 <asp:ListItem Text="--Select--" Value="0">--Select--</asp:ListItem>
                 <asp:ListItem Text="Admin" Value="Admin">Admin</asp:ListItem>
                 <asp:ListItem Text="Manager" Value="Manager">Manager</asp:ListItem>
                 <asp:ListItem Text="Staff" Value="Staff">Staff</asp:ListItem>
                 </asp:DropDownList>
                                          <%-- <div style=" float:right; margin-right:20px;"><p style="color:#fff; float:left;">Search</p> &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="First name, Last name, Email,Phone" value="" size="40" style="border-right:10px; border:1px #990000 solid;" />
                                               <asp:Button ID="btnsearch" runat="server"  Text="Go" style="color:#272f45; width:40px; font-size:12px; text-align:center; background:#fff; line-height:12px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px;  margin-left:10px; border-radius:5px; padding:3px; height:20px; float:right;" OnClick="btnsearch_Click" />
                                            </div>--%>
                                            </div>
                                            <%--<div class="manage-col-mid">

                                        <div class="manage-col-mid-full-name">
                                            <p>Full Name</p>
                                        </div>

                                        <div class="manage-col-mid-email">
                                            <p>Email Id</p>
                                        </div>
                                        <div class="manage-col-mid-phone">
                                            <p>Phone</p>
                                        </div>
                                        <div class="manage-col-mid-edit">
                                            <p>Edit</p>
                                        </div>
                                        <div class="manage-col-mid-delete">
                                            <p>Delete</p>
                                        </div>




                                    </div>--%>
                                            <div class="clear"></div>
                                             <div class="manage-col-left" style="padding:0px;">
                                            <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" Width="100%" 
                                                GridLines="Horizontal" EmptyDataText="No Record Found"
                                                AllowPaging="true" onpageindexchanging="GridView1_PageIndexChanging" 
                                                 ShowFooter="false" CssClass="grid"  PageSize="9">
                                                <PagerStyle CssClass="cssPager" />

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid" style="background:none;  width:100%;">

                                                                <div class="manage-col-mid-full-name">
                                                                    <p>Role</p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>Page Name</p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>Access</p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                    <p>Edit</p>
                                                                </div>
                                                               




                                                            </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <div class="">
                                                                <div class="manage-col-mid-full-name">
                                                                    <p>
                                                                        <asp:Label ID="lblid" runat="server" Text='<%# Bind("Id")%>' style="display:none;"></asp:Label>

                                                                         <asp:Label ID="lblRole" runat="server" Text='<%# Bind("Role")%>'></asp:Label>
                                                                    </p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>
                                                                        <asp:Label ID="lblPageName" runat="server" Text='<%# Bind("PageName")%>'></asp:Label></p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>
                                                                        <asp:CheckBox ID="chkaccess" runat="server"  Checked='<%# Convert.ToBoolean(Eval("Access")) %>' Enabled="false"/></p>
                                                                      <asp:CheckBox  ID="chkEdit" runat="server"  Checked='<%# Convert.ToBoolean(Eval("EditAccess")) %>' Enabled="false" style="display:none;" />
                                                                    <asp:CheckBox ID="chkUpdate" runat="server"  Checked='<%# Convert.ToBoolean(Eval("UpdateAccess")) %>' Enabled="false" style="display:none;"/>
                                                                                                 <asp:CheckBox ID="chkDelete" runat="server"  Checked='<%# Convert.ToBoolean(Eval("DeleteAccess")) %>' Enabled="false" style="display:none;"/>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                     <a  href="#" onclick="calme('<%#Eval("Id")+","+Eval("Role")+","+Eval("PageName")+","+Convert.ToBoolean(Eval("Access"))+","+Convert.ToBoolean(Eval("EditAccess"))+","+Convert.ToBoolean(Eval("UpdateAccess"))+","+Convert.ToBoolean(Eval("DeleteAccess"))%>')">
                                                                        <asp:Image ID="Image1" ImageUrl="images/edit-notes.png" runat="server" /></a>
                                                                </div>
                                                                
                                                            </div></
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>




                                        </div>
</div>
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
