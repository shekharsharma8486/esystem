<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EbookingWebProject.Home2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    

   

<link href='AddCalenderInfo/fullcalendar.css' rel='stylesheet' />
    <link href='AddCalenderInfo/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='AddCalenderInfo/lib/moment.min.js'></script>
    <script src='AddCalenderInfo/lib/jquery.min.js'></script>
    <script src='AddCalenderInfo/fullcalendar.min.js'></script>


    <style type="text/css">
        .li
        {
            cursor: pointer;
        }
    </style>

 


    <script type="text/javascript">



        jQuery(document).ready(function () {

            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: "{}",
                url: "Home.aspx/GetEvents",
                dataType: "json",
                success: function (data) {
             
                    $('div[id*=calendar]').fullCalendar({

                        header: {
                            //left: 'prev,next ',
                            //center: 'title',
                            //right: 'today12'
                          
                            left: 'prevYear,prev,next,nextYear today',
                            center: 'title',
                            right: 'month,basicWeek,basicDay',
                            allDay: true,
                           
                           
                            //right: 'month,basicWeek,agendaDay',
                           


                        },
                       
                        editable: false,
                        eventLimit:2,
                       // eventLimitText: "More..",
                        selectable: true,
                       
                       
                       
                        events: $.map(data.d, function (item, i) {

                            var event = new Object();
                            event.id = item.EventID;
                            event.start = new Date(item.StartDate);
                            event.end = new Date(item.EndDate);
                            event.title = item.EventName;
                            event.color = item.color;
                            event.url = "Details.aspx?id=" + item.EventID;
                            return event;

                        })

                    });
                   
                    //$("div[id=loading]").hide();
                    //$("div[id=fullcal]").show();


                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        });

    </script>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <script type="text/javascript">
        function setddl2()
        {
          
            document.getElementById("<%=ddlStatusSearch1.ClientID %>").selectedIndex = 0;

        }

    </script>

    <script type="text/javascript">
        function setddl1() {
          
         
            document.getElementById("<%=ddlStatusSearch.ClientID %>").selectedIndex = 0;

        }

    </script>
   
  

    
    













    
    
    
    <div class="container"  style="padding-bottom:0px; margin-bottom:-5px;">
        <div class="row" style="padding-bottom:0px; margin-bottom:0px;">
            <div class="col-xs-12" style="padding-left: 0px;">
                <div class="col-sm-3" style="padding-left: 0px;">
                    <div id="home-left">
                        <div id="home-left-head" style="background:url(images/left-head-bg-img.jpg) repeat-x;">
                            <p>Upcoming Bookings</p>
                        </div>
                        <div class="clear"></div>
                        <div id="home-left-head-search">
                            
                        <p style="float: left; width:92%; border-bottom:1px #e6e6e6 solid; padding-bottom:10px; margin-bottom:10px;">
                                Sort by  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:DropDownList ID="ddlStatusSearch1" AutoPostBack="true" CssClass="home-left-head-search-bg" runat="server" onchange="setddl1();" OnSelectedIndexChanged="ddlStatusSearch1_SelectedIndexChanged"  >
                                         <asp:ListItem Text="Bookings" Value="3">Bookings</asp:ListItem>
                                         <asp:ListItem Text="Promoters" Value="4">Promoters</asp:ListItem>
                                         <asp:ListItem Text="Date Desc" Value="5">Date Desc</asp:ListItem>
                                     </asp:DropDownList>
                                   
                                <%-- <asp:TextBox ID="txtSearchBox" placeholder="Search here..." runat="server" AutoPostBack="true" OnTextChanged="txtSearchBox_TextChanged" onfocus="txtSearchBox_TextChanged" onkeyUp="txtSearchBox_TextChanged" ></asp:TextBox>--%>
                            </p>
                        <div class="clear"></div>
                            <p style="float: left; border-bottom:1px #e6e6e6 solid; padding-bottom:10px; width:92%;">
                                Sort By Status :&nbsp;
                                     <asp:DropDownList ID="ddlStatusSearch" runat="server" CssClass="home-left-head-search-bg" onchange="setddl2()" AutoPostBack="true"   OnSelectedIndexChanged="ddlStatusSearch_SelectedIndexChanged">
                                         <asp:ListItem Text="No Status" Value="0">All </asp:ListItem>
                                         <asp:ListItem Text="Confirmed" Value="1">Confirmed</asp:ListItem>
                                         <asp:ListItem Text="Hold" Value="2">Hold</asp:ListItem>
                                     </asp:DropDownList>
                                <%-- <asp:TextBox ID="txtSearchBox" placeholder="Search here..." runat="server" AutoPostBack="true" OnTextChanged="txtSearchBox_TextChanged" onfocus="txtSearchBox_TextChanged" onkeyUp="txtSearchBox_TextChanged" ></asp:TextBox>--%>
                            </p>
                        </div>
                        <div class="clear"></div>
                        <div id="home-left-col-main">

                         


                           
                            <div id="home-left-col-main-full">
                                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                <asp:Repeater ID="Repeater5" runat="server">
                                    <ItemTemplate>
                                        <div id="home-left-col-2">
                                            <div id="home-left-col-left-2" >
                                                <p>
                                                   
                                                    <a href="Details.aspx?id=<%#Eval("id")%>"  target="_self">
                                                        
                                                        
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("etitle")%>' style="width: 250px;word-wrap: break-word;"></asp:Label>
                                                        </a><br>
                                                  
                                                    <span><%#Eval("E_startdate")%>  </span> 
                                                </p>
                                            </div>
                                            <div id="home-left-col-right-2">
                                                <p><%#Eval("status")%><br />
                                            <span><%#Eval("PromoterName")%></span></p>
                                                
                                              

                                                
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <table>
        <tr id="trEmpty" runat="server" visible="false">
            <td colspan = "3">
                No records found.
            </td>
        </tr>
        </table>
    </FooterTemplate>
                                </asp:Repeater>
                                     </ContentTemplate>
                                       <Triggers>
                                           <asp:AsyncPostBackTrigger ControlID="ddlStatusSearch" EventName="SelectedIndexChanged" />
                                           <asp:AsyncPostBackTrigger ControlID="ddlStatusSearch1" EventName="SelectedIndexChanged" />
                                       </Triggers>
                            </asp:UpdatePanel>
                                <%--<div id="home-left-col">
                            	<div id="home-left-col-left">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ">
                                <p>Stayover</p>
                                </div>
                            </div>--%>



                                <%--<div id="home-left-col-2">
                            	<div id="home-left-col-left-2">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-2">
                                <p>Stayover</p>
                                </div>
                            </div>--%>





                                <%--<div id="home-left-col-3">
                            	<div id="home-left-col-left-3">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-3">
                                <p>Stayover</p>
                                </div>
                            </div>--%>




                                <%--<div id="home-left-col-4">
                            	<div id="home-left-col-left-4">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-4">
                                <p>Stayover</p>
                                </div>
                            </div>--%>



                                <%--<div id="home-left-col-5">
                            	<div id="home-left-col-left-5">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-5">
                                <p>Stayover</p>
                                </div>
                            </div>


<div id="home-left-col-6">
                            	<div id="home-left-col-left-6">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-6">
                                <p>Stayover</p>
                                </div>
                            </div>




<div id="home-left-col-7">
                            	<div id="home-left-col-left-7">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-7">
                                <p>Stayover</p>
                                </div>
                            </div>


<div id="home-left-col-8">
                            	<div id="home-left-col-left-8">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-8">
                                <p>Stayover</p>
                                </div>
                            </div>


<div id="home-left-col-9">
                            	<div id="home-left-col-left-9">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-9">
                                <p>Stayover</p>
                                </div>
                            </div>
<div id="home-left-col-10">
                            	<div id="home-left-col-left-10">
                                	<p>Jonathan Tumer<br><span>202 GRDLX</span></p>
                                </div>
                                <div id="home-left-col-righ-10">
                                <p>Stayover</p>
                                </div>
                            </div>--%>
                            </div>





                        </div>
                        
                    </div>
                </div>
                <div class="col-sm-9" style="padding-right: 0px;">
                    <div id="home-right">
                        <div id="home-right-head">
                            <div id="home-right-head-navi">
                                <div id='calendar' style="border-bottom:1px #ccc solid;"></div>
                            </div>

                        </div>
                        <div id="home-right-head-right">
                        </div>
                         <div class="clear"></div>
        <div class="col-sm-3">
            <div id="home-right-check-box">
                <p>
                    <img src="images/indicator-icon.png">&nbsp;&nbsp;<span style="color:Green;font-weight:bold;">Confirmed</span></p>
            </div>
        </div>
        <div class="col-sm-3">
            <div id="home-right-check-box2">
                <p>
                    <img src="images/indicator-icon-3.png">&nbsp;&nbsp;<span style="color:red;font-weight:bold;">Hold</span></p>
            </div>
        </div>
        <div class="col-sm-3">
            <div id="home-right-check-box3">
                <p>
                    <img src="images/indicator-icon-2.png">&nbsp;&nbsp;<span style="color:gray;font-weight:bold;">No Status</span></p></p>
            </div>
        </div>
                    </div>

                    <div class="clear"></div>

                </div>

            </div>


            <div class="clear"></div>
            
            
        </div>
       
    </div>

    </div>
                </div>
            
           
            </div></div>
          
 <%--<div class="footer-col"><p>© All rights reserved by Deaninfotech Pvt Ltd.</p></div>--%>
</asp:Content>
