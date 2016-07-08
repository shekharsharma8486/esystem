<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EbookingWebProject.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Booking Systems | Best Event Planning System - Dean </title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

    <meta name="google-site-verification" content="Czr1pHzRUzbpzB3WgHwQt8LfAI9GY62wnSUjpIm35wg" />
    <script type="text/javascript">
        function showdiv1() {

            document.getElementById("light1").style.display = "block";
            document.getElementById("fade1").style.display = "block";
            document.getElementById("fade1").style.display = "block";
            $("#txtQname").text('');
            $("#txtQEmail").text('');
            $("#txtQCtnt").text('');
            $("#txtQuery").text('');

            $("#txtQname").val('');
            $("#txtQEmail").val('');
            $("#txtQCtnt").val('');
            $("#txtQuery").val('');
            return false;
        }
    </script>
    <script type="text/javascript">
        function showdiv() {

            document.getElementById("light").style.display = "block";
            document.getElementById("fade").style.display = "block";
            document.getElementById("fade").style.display = "block";
            $("#lblid").val('');
            $("#lblerror2").val('');
            $("#lblerror2").text('');
            $("#resetPwd").val('');
            return false;
        }
    </script>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        function empty() {

            if ($("#resetPwd").val() == '') {

                $("#lblid").show();
                $("#lblid").html("Please Enter Email Id.!!!");
                $("#lblid").fadeOut(4000);
                return false;

            }
            else if ($("#resetPwd").val() != '') {
                var email = document.getElementById("<%=resetPwd.ClientID %>").value.trim();
                var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                var valid = emailReg.test(email);
                if (email) {
                    if (!valid) {

                        $("#lblid").show();
                        $("#lblid").html("invalid email format..!!!");
                        $("#lblid").fadeOut(4000);

                        document.getElementById("<%=resetPwd.ClientID %>").focus();


                return false;
            }
        }

    }
    else {

        return true;
    }
}
    </script>
    <script type="text/javascript">
        function empty1() {




            if ($("#txtQname").val() == '') {

                $("#lbleerro3").show();
                $("#lbleerro3").html("Please Enter Name.!!!");
                $("#lbleerro3").fadeOut(4000);
                return false;

            }
            if ($("#txtQEmail").val() == '') {

                $("#lbleerro3").show();
                $("#lbleerro3").html("Please Enter Email Id.!!!");
                $("#lbleerro3").fadeOut(4000);
                return false;

            }
            else if ($("#txtQEmail").val() != '') {
                var email = document.getElementById("<%=txtQEmail.ClientID %>").value.trim();
                var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                var valid = emailReg.test(email);
                if (email) {
                    if (!valid) {

                        $("#lbleerro3").show();
                        $("#lbleerro3").html("invalid email format..!!!");
                        $("#lbleerro3").fadeOut(4000);

                        document.getElementById("<%=txtQEmail.ClientID %>").focus();


                        return false;
                    }
                }

            }

        if ($("#txtQCtnt").val() == '') {

            $("#lbleerro3").show();
            $("#lbleerro3").html("Please Enter Contact No.");
            $("#lbleerro3").fadeOut(4000);
            return false;

        }
        if ($("#txtQuery").val() == '') {

            $("#lbleerro3").show();
            $("#lbleerro3").html("Please Enter Your Query.");
            $("#lbleerro3").fadeOut(4000);
            return false;

        }
    }
    </script>
    <%--<script type="text/javascript">
        window.onload = function () {
            debugger;
            jQuery.ajax({
                url: '//freegeoip.net/json/',
                type: 'POST',
                crossDomain: true,
                dataType: 'jsonp',
                success: function (location) {
                    alert(location.region_name);
                    alert(location.areacode);
                    alert(location.ip);
                    alert(location.zipcode);
                    alert(location.longitude);
                    alert(location.latitude);
                    alert(location.country_name);
                    // example where I update content on the page.
                    jQuery('#hdncity').html(location.city);

                    //jQuery('#hdncountryname').html(location.region_code);
                    jQuery('#hdnregionname').html(location.region_name);
                    jQuery('#areacode').html(location.areacode);
                    jQuery('#hdnIp').html(location.ip);
                    jQuery('#hdnzipcode').html(location.zipcode);
                    jQuery('#hdnlongitude').html(location.longitude);
                    jQuery('#hdnlatitude').html(location.latitude);
                    jQuery('#hdncountryname').html(location.country_name);
                    //jQuery('#country-code').html(location.country_code);
                }
            });
        }
    </script>--%>
    <script language="JavaScript" src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
           // alert("Your location is: " + geoplugin_countryName() + ", " + geoplugin_region() + ", " + geoplugin_city() + ", " + geoplugin_longitude() + ", " + geoplugin_latitude() + ", " + geoplugin_request());
           
            document.getElementById("hdnregionname").value = geoplugin_region();
            document.getElementById("hdncity").value = geoplugin_city();
            document.getElementById("hdnIp").value = geoplugin_request();
            document.getElementById("hdnlongitude").value = geoplugin_longitude();
            document.getElementById("hdnlatitude").value = geoplugin_latitude();
           document.getElementById("hdncountryname").value = geoplugin_countryName();
           
            //jQuery('#areacode').html(geoplugin_city());
            //jQuery('#hdnIp').html(geoplugin_request());
            ////jQuery('#hdnzipcode').html(location.zipcode);
            //jQuery('#hdnlongitude').html(geoplugin_longitude());
            //jQuery('#hdnlatitude').html(geoplugin_latitude());
            //jQuery('#hdncountryname').html(geoplugin_countryName());
           
        });
    </script>
    <%--<script type="text/javascript">
        window.onload = function () {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "http://www.telize.com/jsonip?callback=DisplayIP";
            document.getElementsByTagName("head")[0].appendChild(script);
        };
        function DisplayIP(response) {
            document.getElementById("hdId").value = response.ip;
        }
    </script>--%>
   <%-- <script type="text/javascript">
        jQuery.ajax({
            url: '//freegeoip.net/json/',
            type: 'POST',
            crossDomain: true,
            dataType: 'jsonp',
            success: function (location) {
                alert(location.region_name);
                alert(location.areacode);
                alert(location.ip);
                alert(location.zipcode);
                alert(location.longitude);
                alert(location.latitude);
                alert(location.country_name);
                // example where I update content on the page.
                jQuery('#hdncity').val(location.city);

                //jQuery('#hdncountryname').html(location.region_code);
                jQuery('#hdnregionname').val(location.region_name);
                jQuery('#areacode').val(location.areacode);
                jQuery('#hdnIp').val(location.ip);
                jQuery('#hdnzipcode').val(location.zipcode);
                jQuery('#hdnlongitude').val(location.longitude);
                jQuery('#hdnlatitude').val(location.latitude);
                jQuery('#hdncountryname').val(location.country_name);
                //jQuery('#country-code').html(location.country_code);
            }
        });
    </script>--%>
    <script type="text/javascript">
        function CheckFormValidation() {
            //var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/; 0
            var emailRegex = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
            var name = document.getElementById('Text2').value;
            var email = document.getElementById('Text1').value;
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            if (name == "") {
                alert("Please Enter your Name");
                return false;
            }
            else if (email == "") {
                alert("Please Enter Email");
                return false;
            }
            else if (username == "") {
                alert("Please Enter User Name");
                return false;
            }
            else if (password == "") {
                alert("Please Enter Password");
                return false;
            }
            else if (!email.match(emailRegex)) {
                alert("Invalid Email id");
                return false;
            }
            else {
                return true;
            }

        }
    </script>




    <link href="css/master.css" rel="stylesheet" type="text/css" />

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />


    <script src="js/bootstrap.js" type="text/javascript"></script>

    <script src="js/npm.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>



    <script type="text/javascript">

        $(document).ready(function () {
            $("#btnSendCancel").click(function () {

                $("#resetPwd").val('');
                document.getElementById("light").style.display = "none";
                document.getElementById("fade").style.display = "none";

                return false;

            });
        });

    </script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#btncanceldone").click(function () {

                $("#txtQname").val('');
                $("#txtQEmail").val('');
                $("#txtQCtnt").val('');
                $("#txtQuery").val('');
                document.getElementById("light1").style.display = "none";
                document.getElementById("fade1").style.display = "none";

                return false;

            });
        });

    </script>


    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        function emailvalidation() {
            var email = document.getElementById("<%=resetPwd.ClientID %>").value.trim();
            var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            var valid = emailReg.test(email);
            if (email) {
                if (!valid) {

                    $("#lblid").show();
                    $("#lblid").html("invalid email format..!!!");
                    $("#lblid").fadeOut(4000);

                    document.getElementById("<%=resetPwd.ClientID %>").focus();


                     return false;
                 }
             }

         }
    </script>
    <script type="text/javascript">
        function loadpwd() {
            document.getElementById("password").defaultValue = "test";
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdncity" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdncountryname" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnregionname" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnzipcode" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnlatitude" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnlongitude" ClientIDMode="Static" runat="server" />

        <asp:HiddenField ID="hdnIp" runat="server" />
        <div id="light1" class="white_content1 login-popup">
            <h2 style="text-align: center !important;">Enter Your Details:</h2>
            <table style="margin-top: 40px; width: 100%;">
                <tr>

                    <asp:Label ID="lbleerro3" runat="server" ClientIDMode="Static" ForeColor="Red" Font-Size="Small" Text="" Style="position: fixed; margin-top: 5px;"></asp:Label>
                    <td class="popup-for-width">

                        <asp:Label ID="Label3" CssClass="label-for-popup" runat="server" Text="Name:-"></asp:Label>

                    </td>

                    <td class="popup-for-width">
                        <input name="na" size="25" id="txtQname" runat="server" placeholder="Your Name" type="text" autocomplete="off" />
                    </td>

                </tr>
                <tr>
                    <td class="popup-for-width">

                        <asp:Label ID="Label4" CssClass="label-for-popup" runat="server" Text="Email:-"></asp:Label>

                    </td>

                    <td class="popup-for-width">
                        <input name="na" size="25" id="txtQEmail" runat="server" placeholder="Your Email" type="text" autocomplete="off" />
                    </td>
                </tr>
                <tr>
                    <td class="popup-for-width">

                        <asp:Label ID="Label5" CssClass="label-for-popup" runat="server" Text="Contact No:-"></asp:Label>

                    </td>

                    <td class="popup-for-width">
                        <input name="na" size="25" id="txtQCtnt" runat="server" placeholder="Your Contact No" type="text" autocomplete="off" />
                    </td>
                </tr>
                <tr>
                    <td class="popup-for-width">

                        <asp:Label ID="Label6" CssClass="label-for-popup" runat="server" Text="Query:-"></asp:Label>

                    </td>

                    <td class="popup-for-width">

                        <textarea name="na" size="25" placeholder="Your Query" id="txtQuery" runat="server" style="padding: 10px; border: 1px #ccc solid; margin-bottom: 10px; border-radius: 5px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="popup-for-width">
                        <asp:Button ID="btnquery" runat="server" CssClass="mid-col-right-input-right-batton" Text="Send Query" OnClientClick="return empty1()" OnClick="btnSendPwd_Click1" /></td>
                    <td class="popup-for-width">
                        <asp:Button ID="btncanceldone" ClientIDMode="Static" runat="server" CssClass="mid-col-right-input-right-batton" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="light" class="white_content login-popup">
            <table style="margin-top: 40px; width: 100%;">
                <tr>
                    <asp:Label ID="lblid" runat="server" ClientIDMode="Static" ForeColor="Red" Font-Size="Small" Text="" Style="position: fixed; margin-top: 5px;"></asp:Label>
                    <td class="popup-for-width">
                        <asp:Label ID="Label1" CssClass="label-for-popup2" runat="server" Text="Enter Registered Email Id"></asp:Label>

                    </td>

                    <td class="popup-for-width">
                        <input name="na" size="25" id="resetPwd" runat="server" placeholder="Email Id" onchange="return emailvalidation();" type="text" autocomplete="off" />
                    </td>
                </tr>
            </table>
            <table style="margin: 70px 0 0 0; float: left; width: 100%;">
                <tr>
                    <td class="popup-for-width">
                        <asp:Button ID="btnSendPwd" runat="server" CssClass="mid-col-right-input-right-batton" Text="Send Password" OnClientClick="return empty()" OnClick="btnSendPwd_Click" /></td>
                    <td class="popup-for-width">
                        <asp:Button ID="btnSendCancel" ClientIDMode="Static" runat="server" CssClass="mid-col-right-input-right-batton" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="hdId" runat="server"></asp:HiddenField>
        <script src="Scripts/bootstrap.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <%-- <script src="js/bootstrap.js" type="text/javascript"></script>

<script src="js/npm.js" type="text/javascript"></script>--%>
        <div id="wrapper">
            <div id="header">

                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="col-sm-4">
                                <div id="header-logo">
                                    <a href="http://www.deaninfotech.com/" target="_new">
                                        <img src="images/logo.png" width="134" height="47"></a>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div id="header-right">
                                    <p>E-Booking System</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div id="mid-col">
                            <div class="col-sm-6">
                                <div id="mid-col-left">
                                    <div id="mid-col-left-img">
                                        <img src="images/img-1.jpg">
                                    </div>
                                    <div id="mid-col-left-list">
                                        <ul>
                                            <li><a href="#">Set up your assets in just few minutes</a></li>
                                            <li><a href="#" style="cursor: default">Multi-user license</a></li>
                                            <li><a href="#" style="cursor: default">Unlimited product, venues setup</a></li>
                                            <li><a href="#" style="cursor: default">Easy to use interface</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div id="mid-col-right">
                                    <h1 style="float: left;">Let us know you </h1>
                                    &nbsp;&nbsp;&nbsp;&nbsp; <a href="#" id="A1" runat="server" onclick="return showdiv1();" style="float: left; line-height: 40px; margin-top: 14px; padding-left: 30px;">Enquiry Now</a>
                                    <br />
                                    <asp:Label ID="lblerror1" runat="server" ForeColor="Red" Visible="false" Text="UserName and Password do not match."></asp:Label>
                                    <asp:Label ID="lblerror2" runat="server" ClientIDMode="Static" ForeColor="Red" Text=""></asp:Label>
                                    <div class="clear"></div>
                                    <div id="mid-col-right-input">
                                        <div id="mid-col-right-input-left">
                                            <img src="images/user-name.jpg "></div>
                                        <div id="mid-col-right-input-right-col">

                                            <input name="na" placeholder="Name" id="Text2" runat="server" type="text" size="25" />
                                        </div>
                                    </div>
                                    <div id="mid-col-right-input2">
                                        <div id="mid-col-right-input2-left">
                                            <img src="images/email.jpg"></div>
                                        <div id="mid-col-right-input-right-col">
                                            <input type="text" name="na" placeholder="Email Address" size="25" id="Text1" runat="server" />

                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                    <h1>Login </h1>
                                    <div id="mid-col-right-input3">
                                        <div id="mid-col-right-input3-left">
                                            <img src="images/user-name.jpg"></div>
                                        <div id="mid-col-right-input-right-col">
                                            <input type="text" name="na" placeholder="User Name" size="25" id="username" value="test" runat="server" readonly="false" />

                                        </div>
                                    </div>
                                    <div id="mid-col-right-input4">
                                        <div id="mid-col-right-input4-left">
                                            <img src="images/password.jpg"></div>
                                        <div id="mid-col-right-input-right-col">

                                            <%-- <input placeholder="Password" size="25"
                                                        id="password" name="na" value="test" onkeypress="checkCaps(event)" autocomplete="off" runat="server"
                                                        type="password"  />--%>
                                            <input name="na" size="25" id="password" runat="server" value="test" autocomplete="off" readonly="false" />
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                    <br />
                                    <asp:Button ID="btnlogin" runat="server" CssClass="mid-col-right-input-right-batton" Text="Login into E-Booking"
                                        OnClick="btnlogin_Click" OnClientClick="return CheckFormValidation()" />

                                    <a href="#" id="btnForgetPwd1" runat="server" onclick="return showdiv();" style="font-size: 12px; line-height: 40px; margin-top: 70px; padding-left: 10px;">Forgot Password</a>


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div id="fade" class="black_overlay">
            </div>
            <div id="fade1" class="black_overlay1">
            </div>
            <div class="clear"></div>
            <div id="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <p>Copyright © Dean Infotech Pvt. Ltd.  All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
