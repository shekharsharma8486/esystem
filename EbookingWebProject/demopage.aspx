<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demopage.aspx.cs" Inherits="EbookingWebProject.demopage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link href="HomeCss/css/master.css" rel="stylesheet" type="text/css" />

<link href="HomeCss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="HomeCss/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="HomeCss/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
<link href="HomeCss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="HomeCss/css/font-awesome.css" rel="stylesheet" type="text/css" />

<script src="js/bootstrap.js" type="text/javascript"></script>
    <link href='AddCalenderInfo/fullcalendar.css' rel='stylesheet' />
    <link href='AddCalenderInfo/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='AddCalenderInfo/lib/moment.min.js'></script>
    <script src='AddCalenderInfo/lib/jquery.min.js'></script>
    <script src='AddCalenderInfo/fullcalendar.min.js'></script>
      
     <script src='jquery-ui.min.js'></script>
    <link href='jquery-ui.css' rel="stylesheet" type="text/css" />

    

    


    


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
                url: "demopage.aspx/GetEvents",
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


                        },
                        editable: true,
                        //eventLimit: true,
                        eventLimit: 2,
                        editable: true,
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
   
    <script type="text/javascript">
        function setddl2() {

            document.getElementById("<%=ddlStatusSearch1.ClientID %>").selectedIndex = 0;

        }

    </script>

    <script type="text/javascript">
        function setddl1() {


            document.getElementById("<%=ddlStatusSearch.ClientID %>").selectedIndex = 0;

        }

    </script>
   
   
</head>
<body>
    <form id="form1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
    <div>
         <asp:HiddenField ID="HiddenField1" runat="server" />
      <div id="header-home">
    <div class="container">
    	
        	<div class="row">
            <div class="col-xs-12">
            <div class="col-sm-3">
            <div id="header-home-right">
                	<ul>
                    <li><a href="#" style="font-size:14px;">	E-Booking</a></li>
            </ul>
            </div>
            </div>
             <div class="col-sm-6"></div>
            <div class="col-sm-3">
            	<div id="header-home-right-main">
                	<ul>
                    <li><a href="#">Welcome Admin</a></li>
                    <li><a href="#"><img src="images/home.png" width="14" height="15"></a></li>
                     <li><a href="#"><img src="images/booking-icon2.png" width="14" height="15"></a></li>
                      <li><a href="#"><img src="images/PixelKit_location_icon.png" width="14" height="15"></a></li>
					  <li><a href="#"><img src="images/bell2.png" width="14" height="15"></a></li>
                      <li><a href="#">
                       <%--   <img src="images/logout.png" width="14" height="15">--%>
                         
                          <asp:ImageButton ID="LinkButton2" ImageUrl="images/logout.png" width="14" height="15" runat="server" />
                          </a></li>
                    
                    </ul>
                </div>
            </div>
            
            </div></div>
            </div></div>
              <div class="clear"></div>
              <div id="navigation">
    <div class="container">
            <div class="row" style="padding:0px; margin:0px;">
            <nav class="navbar navbar-default  addClassPanel fixed" role="navigation" style="border:none;">

<div class="col-sm-1">
        
            
   		  <div class="navbar-header">
       		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                	<span class="sr-only">Toggle navigation</span>
                	<span class="icon-bar"></span>
                	<span class="icon-bar"></span>
                	<span class="icon-bar"></span>
            </button>
          <img src="images/logo.png" width="90" height="27">
           	</div></div>
            	<div class="col-sm-7">
                <div class="collapse navbar-collapse" id="navbar-collapse">
            		<ul class="nav navbar-nav navbar-right navbar-user">
                    
                		<li><a href="Home.aspx" class="active">Home</a></li>
                        <li ><a href="AddEvent.aspx"  >Event</a></li>


                        <!--<li ><a href="#" class="thickbox" >Manage</a></li>-->
                        <li class="dropdown">
                        	<a href="#" class="thickbox" >Manage</a>
                        	<ul class="dropdown-menu">
                            	<li><a href="Promoters.aspx" id="Promoters" class="active">
                                Promoters</a></li>
                               
 <li><a href="Inventory.aspx" id="Inventory">Inventory</a></li>
                               <li> <a href="Invoices.aspx" id="Invoices">Invoices</a></li>
                               <li> <a href="report.aspx" id="report">Reports</a></li>
                               <li> <a href="Add_location.aspx" id="Add_location">Venues/Assets</a></li>
                                                          
                            </ul>
                        	
                        </li>

                         <!--<li ><a href="#" class="thickbox thickbox" >Admin</a></li>-->
                        <li class="dropdown">
                        	<a href="#" class="thickbox thickbox" >Admin</a>
                        	<ul class="dropdown-menu">
                            	
                               
 <li><a href="Reminder.aspx" id="Reminder" class="active">
                                Reminder</a></li>
                               <li> <a href="Admin.aspx" id="Admin">Users</a></li>
                               <li> <a href="AccessInfo.aspx" id="AccessInfo">Access Info</a></li>
                              
                                                         
                            </ul>
                        	
                        </li>


                        
                    <li>    <a href="#" class="show_all2 thickbox" onmousemove="test22()" onclick="test12()"><span id="Schedule" runat="server" class="Menu">Schedule</span></a></li>  
                       
               		</ul><!-- /right-nav -->
                   </div> </div></nav></div>
                <div class="clear"></div>
           
            <div class="clear"></div>
        
            
            </div></div>
              <script src="js/jquery-1.7.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.bxslider.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(function () {
            bannerslider()
            portfolioSlider()
            testimonialSlider()

        });
	</script>
    
            
           
            
            <div class="clear"></div>
            <div id="full-width">
                <div class="container">
        <div class="row">
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
                                            <div id="home-left-col-left-2">
                                                <p>
                                                    <a href="Details.aspx?id=<%#Eval("id")%>">
                                                        <%#Eval("etitle")%></a><br>
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
                             
                            </div>





                        </div>
                        
                    </div>
                </div>
                <div class="col-sm-9" style="padding-right: 0px;">
                    <div id="home-right">
                        <div id="home-right-head">
                            <div id="home-right-head-navi">
                              
                                <div id='calendar' ></div>
                                   
                                    
                            </div>

                        </div>
                        <div id="home-right-head-right">
                        </div>
                         <div class="clear"></div>
        <div class="col-sm-3">
            <div id="home-right-check-box">
                <p>
                    <img src="images/indicator-icon.png">&nbsp;&nbsp;Demo text</p>
            </div>
        </div>
        <div class="col-sm-3">
            <div id="home-right-check-box2">
                <p>
                    <img src="images/indicator-icon-2.png">&nbsp;&nbsp;Demo text</p>
            </div>
        </div>
        <div class="col-sm-3">
            <div id="home-right-check-box3">
                <p>
                    <img src="images/indicator-icon-3.png">&nbsp;&nbsp;Demo text</p>
            </div>
        </div>
                    </div>

                    <div class="clear"></div>

                </div>

            </div>


            <div class="clear"></div>
            <div id="home-right-calender-navi-main">
                
                <%--<ul>
                                <li><a href="#" class="active">01</a></li>
                                <li><a href="#">02</a></li>
                                <li><a href="#">03</a></li>
                                <li><a href="#">04</a></li>
                                <li><a href="#">05</a></li>
                                 <li><a href="#">06</a></li>
                                  <li><a href="#" style="border-right:none;">07</a></li>
                                  <div class="clear"></div>
                                  <li><a href="#"  class="active">08</a></li>
                                <li><a href="#">09</a></li>
                                <li><a href="#">10</a></li>
                                <li><a href="#">11</a></li>
                                <li><a href="#">12</a></li>
                                 <li><a href="#">13</a></li>
                                  <li><a href="#" style="border-right:none;">14</a></li>
                                  <div class="clear"></div>
                                  <li><a href="#"  class="active">15</a></li>
                                <li><a href="#">16</a></li>
                                <li><a href="#">17</a></li>
                                <li><a href="#">18</a></li>
                                <li><a href="#">19</a></li>
                                 <li><a href="#">20</a></li>
                                  <li><a href="#" style="border-right:none;">21</a></li>
                                  <div class="clear"></div>
                                  <li><a href="#"  class="active">22</a></li>
                                <li><a href="#">23</a></li>
                                <li><a href="#">24</a></li>
                                <li><a href="#">25</a></li>
                                <li><a href="#">26</a></li>
                                 <li><a href="#">27</a></li>
                                  <li><a href="#" style="border-right:none;">28</a></li>
                                  <div class="clear"></div>
                                  <li><a href="#"  class="active">29</a></li>
                                <li><a href="#">30</a></li>
                                <li><a href="#">31</a></li>
                                <li><a href="#">00</a></li>
                                <li><a href="#">00</a></li>
                                 <li><a href="#">00</a></li>
                                  <li><a href="#" style="border-right:none;">00</a></li>
                                </ul>--%>
                                
            </div>
            
        </div>
       
    </div>

    </div>
    </form>
</body>
</html>
