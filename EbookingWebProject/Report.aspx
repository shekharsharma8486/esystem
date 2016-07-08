<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="EbookingWebProject.Report1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
<%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>--%>

   <%-- <script type="text/javascript" src = "../jquery-1.6.1.min.js"></script>--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>--%>

   <%-- <script src="Scripts/jquery-1.7.1.min.js" ></script> 
  <script src="lib/jquery.min.js" ></script>--%>
    <script src="jquery-ui.min.js" ></script> 
    <link href="jquery-ui.css" rel="stylesheet" type="text/css" /> 
    <script type="text/javascript">

        $(document).ready(function () {
            SearchText();
        });
        function SearchText() {
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "report.aspx/GetEmployeeName",
                        data: "{'empName':'" + document.getElementById('TextBox1').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No Match");
                        }
                    });
                }
            });
        }
    </script>  
   
    <script type="text/javascript">

        $(document).ready(function () {
            SearchTextArea();
        });
        function SearchTextArea() {
            $("#TextBox2").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "report.aspx/GetEventName",
                        data: "{'EventName':'" + document.getElementById('TextBox2').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No Match");
                        }
                    });
                }
            });
        }
    </script>
        <script type="text/javascript">

            function validinfomation() {
                var date1 = document.getElementById("<%=txtfrom.ClientID %>").value.trim();
                var date2 = document.getElementById("<%=txtto.ClientID %>").value.trim();

                if ((date1) && (date2)) {


                }
                else {
                    alert("Please Enter both Date's !");
                    return false;
                }
            }
                </script>
                <script type="text/javascript">
                    function check2() {

                        var Sdate = new Date(document.getElementById("<%=txtfrom.ClientID %>").value);
                        var Edate = new Date(document.getElementById("<%=txtto.ClientID %>").value);
                        if (Sdate) {
                            if ((Sdate) && (Edate)) {
                                if (Sdate > Edate) {
                                    alert("From Date Should Be Equal Or Less Than To Date.");
                                    document.getElementById("<%=txtfrom.ClientID %>").value = "";
                                    document.getElementById("<%=txtfrom.ClientID %>").focus();
                                    return false;
                                }
                            }
                        }

                    }

    </script>
    <script type="text/javascript">
        function check1() {
            var Sdate = new Date(document.getElementById("<%=txtfrom.ClientID %>").value);
            var Edate = new Date(document.getElementById("<%=txtto.ClientID %>").value);
            if (Edate) {
                if ((Sdate) && (Edate)) {
                    if (Edate < Sdate) {
                        alert("To Date Should Be Equal Or Greator Than From Date");
                        document.getElementById("<%=txtto.ClientID %>").value = "";
                        document.getElementById("<%=txtto.ClientID %>").focus();
                        return false;
                    }
                }
            }

        }
    </script>
    <asp:Panel ID="Panel2" runat="server" DefaultButton="btngo">
       <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <div class="clear"></div>

                <div id="full-width">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12" style="padding: 0px;">
                                <div class="manage-col">
                                    <div class="col-sm-3">

                                        <div class="manage-col-left-head">
                                            <p>Select Booking</p>
                                            <asp:Label ID="lblid" runat="server" ForeColor="Red" Text="" Style="position: fixed; margin-top: -1px;"></asp:Label>

                                        </div>

                                        <div class="manage-col-left">

                                            <asp:HiddenField ID="hdbPromtId" runat="server" />
                                            <asp:Label ID="lbladded" runat="server" Style="display: none"><span>&#10004;</span> New Promoter added</asp:Label>
                                            <%-- <input type="text" value="First Name *" name="na" class="manage-col-left-input-main">--%>
                                             <asp:TextBox runat="server"  placeholder="From Date"  ID="txtfrom" class="manage-col-left-input-main" ></asp:TextBox>
                                            <img id="img1" src="img/calendar.png" height="20px" style="float:right;  margin-top:-30px; margin-right:10px;" />
                            <asp:CalendarExtender ID="CalendarExtender1"  TargetControlID="txtfrom"  runat="server"
                                PopupButtonID="img1" PopupPosition="BottomRight">
                            </asp:CalendarExtender>
                                            <div class="clear"></div>
                                            <asp:TextBox runat="server" placeholder="To Date"  ID="txtto" class="manage-col-left-input-main"></asp:TextBox>
                                            
                                <img id="img2" src="img/calendar.png" height="20px" style="float:right; margin-top:-30px; margin-right:10px;" />
                            <asp:CalendarExtender ID="CalendarExtender2"  TargetControlID="txtto"   runat="server"
                                PopupButtonID="img2" PopupPosition="BottomRight">
                            </asp:CalendarExtender>
                                            <%-- <input type="text" value="Last Name *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                             <asp:DropDownList runat="server" ID="ddlstatus"  class="manage-col-left-input-main" style=" height:42px;">
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>Hold</asp:ListItem>
                                <asp:ListItem>Confirmed</asp:ListItem>
                            </asp:DropDownList>
                                            <%-- <input type="text" value="Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Client Name:"  ClientIDMode="Static" class="manage-col-left-input-main"></asp:TextBox>

                                            <%--  <input type="text" value="Confirm Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <asp:DropDownList ID="ddlseletAssert" runat="server" AppendDataBoundItems="true"  class="manage-col-left-input-main"  style=" height:42px;">
                                           <asp:ListItem Text="--Select--" Value="0">--Select Assets--</asp:ListItem>
                                       </asp:DropDownList>
                                            <br />
                                               <asp:TextBox ID="TextBox2" runat="server" placeholder="Event Name:"  ClientIDMode="Static" class="manage-col-left-input-main"></asp:TextBox>
                                            <%-- <input type="text" value="Phone Number Only Numeric *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">

                                                    <asp:Button runat="server" ID="btngo"  CssClass="btn" Text="Go"
                                OnClick="btngo_Click" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">

                                                   <%-- <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="return clearText();" Style="color: #fff; font-size: 12px; text-align: center; background: #272f45; line-height: 22px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px 10px;" />--%>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">
                                         <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsearch">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="float: left;">All Booking </p>
                                                <div style="float: right; margin-right: 20px;">
                                                    <p style="color: #fff; float: left;">Search</p>
                                                    &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="First name, Last name, Email,Phone" value="" size="40" style="border-right: 10px; border: 1px #990000 solid;" />
                                                    <asp:Button ID="btnsearch" runat="server" Text="Go" Style="color: #272f45; width: 40px; font-size: 12px; text-align: center; background: #fff; line-height: 12px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; margin-left: 10px; border-radius: 5px; padding: 3px; height: 20px; float: right;" OnClick="btnsearch_Click"  />
                                                </div>
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
                                            <asp:GridView ID="grd" AutoGenerateColumns="false" runat="server" Width="100%" PageSize="15"
                                                GridLines="Horizontal" EmptyDataText="No Record Found" 
                                                AllowPaging="True"  ShowFooter="false" CssClass="grid" OnPageIndexChanging="grd_PageIndexChanging"  OnRowDataBound="grd_RowDataBound">
                                                <PagerStyle CssClass="cssPager" />

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid" style="background: none;  width: 100%;">

                                                                <div class="manage-col-mid-full-name" style="width:10%;">
                                                                    <p >Title</p>
                                                                </div>

                                                                <div class="manage-col-mid-email"  style="width:10%;">
                                                                    <p >Start Date</p>
                                                                </div>
                                                                <div class="manage-col-mid-phone"  style="width:10%;">
                                                                    <p >End Date</p>
                                                                </div>
                                                                <div class="manage-col-mid-edit"  style="width:10%;">
                                                                    <p >Stat Time</p>
                                                                </div>
                                                                <div class="manage-col-mid-delete"  style="width:10%;">
                                                                    <p>End Time</p>
                                                                </div>
                                                                 <div class="manage-col-mid-delete"  style="width:14%;">
                                                                    <p>Promoter Name</p>
                                                                </div>
                                                                  <div class="manage-col-mid-delete"  style="width:10%;">
                                                                    <p>Notes</p>
                                                                </div>
                                                                <div class="manage-col-mid-delete"  style="width:10%;">
                                                                    <p>Status</p>
                                                                </div>
                                                                 <div class="manage-col-mid-delete"  style="width:12%;">
                                                                    <p >Export to PDF</p>
                                                                </div>





                                                            </div>
                                                        </HeaderTemplate>
                                                        
                                                        <ItemTemplate>

                                                            <div class="">
                                                                <div class="manage-col-mid-full-name"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                           <asp:Label runat="server" Visible="false" ID="lblid" Text='<%#Eval("id")%>'></asp:Label>
                                                                   <a style="color: #006699" href='Details.aspx?id=<%#Eval("id")%>'>
                                <%#Eval("Etitle")%></a>
                                                                         </p>
                                                                </div>

                                                                <div class="manage-col-mid-email"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                       <asp:Label runat="server" ID="lblsdate" Text='<%#Eval("E_startdate")%>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                                <div class="manage-col-mid-phone"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                      <asp:Label runat="server" ID="lbledate" Text='<%#Eval("E_enddate")%>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                                                <asp:Label runat="server" ID="lblstime" Text='<%#Eval("startTime")%>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                      <asp:Label runat="server" ID="lbletime" Text='<%#Eval("EndTime")%>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone"  style="width:14%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                       <asp:Label runat="server" ID="name" Text='<%#Eval("fname")  +" "+Eval("lname") %>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                      <asp:Label runat="server" ID="notes" Text='<%#Eval("notes")%>' style="width: 250px;word-wrap: break-word;"></asp:Label>
                                                                    </p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone"  style="width:10%;">
                                                                    <p  style="margin-bottom:1px  !important;">
                                                                       <asp:Label runat="server" ID="status" Text='<%#Eval("status")%>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                                 <div class="manage-col-mid-phone"  style="width:12%;">
                                                                    <p style="margin-bottom:1px  !important;">
                                                                     <asp:ImageButton ImageUrl="images/pdf.png" Height="20px" Width="20px" ID="pdf" runat="server"
                                CommandName="pdf" CommandArgument='<%# Eval("id") %>' OnClick="onclicked" />
                                                                    </p>
                                                                </div>
                                                                  
                                                                
                                                            </div>
                                                            
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>
                                            <%--<asp:GridView ID="grduser" AutoGenerateColumns="false" runat="server" Width="100%"
                                                GridLines="Horizontal" EmptyDataText="No Record Found" OnRowCommand="grduser_RowCommand"
                                                AllowPaging="True" OnPageIndexChanging="grduser_PageIndexChanging" ShowFooter="false" CssClass="grid">
                                                <PagerStyle CssClass="cssPager" />

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid" style="background: none; margin-left: -10px; width: 101%;">

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




                                                            </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <div class="">
                                                                <div class="manage-col-mid-full-name">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblname"><%#Eval("fname") +" "+Eval("lname") %></asp:Label>
                                                                    </p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblemail"><%#Eval("email") %></asp:Label>
                                                                    </p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblphone"><%#Eval("phone") %></asp:Label>
                                                                    </p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                    <a href="#" onclick="calme1('<%#Eval("id")+","+Eval("fname")+","+Eval("lname")+","+Eval("email")+","+Eval("phone")%>')">
                                                                        <asp:Image ID="Image1" ImageUrl="images/edit-notes.png" runat="server" /></a>
                                                                </div>
                                                                <div class="manage-col-mid-delete">
                                                                    <asp:ImageButton ID="lnkdlt" runat="server" CommandName="del" CommandArgument='<%#Eval("id")%>' ImageUrl="images/Delete_Icon.png" OnClientClick="return confirm('Are you sure?')" />
                                                                </div>
                                                            </div>
                                                            </
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>--%>


</div>

                                        </div>
                                             </asp:Panel>

                                    </div>



                                </div>

                            </div>
                        </div>
                    </div>
                </div>
          <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>

    </asp:Panel>
</asp:Content>
