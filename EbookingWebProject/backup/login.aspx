<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EbookingWebProject.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Online Booking Systems | Best Event Planning System - Dean </title>
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

    <link rel="shortcut icon" href="images/deanheader.jpg">
    <link rel="icon" type="image/gif" href="images/deanheader.jpg" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/sfdc190_global.css">
    <script type="text/javascript">
        window.onload = function () {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "http://www.telize.com/jsonip?callback=DisplayIP";
            document.getElementsByTagName("head")[0].appendChild(script);
        };
        function DisplayIP(response) {
            document.getElementById("hdId").value = response.ip;
        }
    </script>
    <script type="text/javascript">
        function CheckFormValidation() {
            var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/; 0
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
    <style type="text/css">
        a
        {
            color: #0b7aae;
        }
        
        input.primary, .button, .btnPrimary
        {
            background: #3198d8;
            border: 1px solid #4176ba;
        }
        
        .button, .button, .btnPrimary, .btnPrimary
        {
            border: 1px solid, #1c78b1 (0.11,0.471,0.694);
            background: #2e8ec9;
            background: -moz-linear-gradient(bottom, #2789c7 0%, #3f9fd9 100%);
            background: -webkit-gradient(linear, left bottom, left top, color-stop(0%,#2789c7), color-stop(100%,#3f9fd9));
            background: -webkit-linear-gradient(bottom, #2789c7 0%,#3f9fd9 100%);
            background: -o-linear-gradient(bottom, #2789c7 0%,#3f9fd9 100%);
            background: -ms-linear-gradient(bottom, #2789c7 0%,#3f9fd9 100%);
            background: linear-gradient(bottom, #2789c7 0%, #3f9fd9 100%) bottom (0.153,0.537,0.78) to top(0.247,0.624,0.851)filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3f9fd9', endColorstr='#2789c7',GradientType=0 );
        }
        
        .button:hover, .button:focus, .btnPrimary:hover, .btnPrimary:focus
        {
            background: #278ac7 ( 0.153, 0.541, 0.78);
        }
        
        body
        {
            background-color: #2a94d6;
        }
        
        #footer, #footer a
        {
            color: #ffffff;
        }
        
        #content
        {
            background-color: #ffffff;
        }
        
        #content
        {
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            padding: 10px;
        }
        
        #left_side
        {
            float: left;
            width: 320px;
        }
        
        #right_side
        {
            text-align: left;
            vertical-align: top;
            padding-left: 545px;
            padding-top: 20px;
            font-size: 18px;
            color: #000;
        }
        
        .p
        {
            color: #61380B;
            text-shadow: 1px 0.1px #0080FF;
        }
    </style>
    <script type="text/javascript">
        if (self == top) { document.documentElement.style.visibility = 'visible'; } else { document.write = ''; top.location = self.location; setTimeout(function () { document.body.innerHTML = ''; }, 1); window.self.onload = function (evt) { document.body.innerHTML = ''; }; }</script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hdId" runat="server" />
    <div id="login" style="margin-top: 20px;">
        <div id="login_wrapper">
            <%--style="background-image: url('http://www.deaninfotech.com/images/features1.PNG'); background-repeat: no-repeat; background-size: 100% 100%;"--%>
            <center>
                <%--font-weight: 900; font-size: 40px; color: #0080FF; text-shadow: 1px 2px #FF8000;--%>
                <p style="font-weight: 1125; font-weight: bold; font-size: 40px; color: #0080FF;">
                    E-Booking System</p>
            </center>
            <div id="left_side" style="padding: 0px 50px 50px 50px; margin-top: -25px;">
                <div id="login_component">
                    <div id="logo_wrapper">
                        <a href="http://www.deaninfotech.com/">
                            <img id="logo" class="logo_dean" src="images/logo.png" alt="Dean" border="0"></a>
                    </div>
                    <div id="loginwidget">
                        <div id="manageheader" class="loginbox_container">
                            <div id="backFromEdit">
                                <a href="javascript:void(0);" onclick="LoginHint.dismissEdit();" id="hint_back_edit">
                                    Back</a></div>
                            <br>
                            <div id="managetitle">
                                Manage your user names:</div>
                            <div id="editscale">
                                <div id="editlist">
                                </div>
                            </div>
                        </div>
                        <div id="loginformarea">
                            <div id="idscale" class="loginbox_container">
                                <div id="hinttop">
                                    <div id="notMydomain" style="display: none;">
                                        <a href="javascript:void(0);" onclick="DomainSwitcher.dismissCustomDomain();" id="hint_back_domain">
                                            Back</a></div>
                                    <div id="hints" style="display: none;">
                                        <a style="display: inline;" href="javascript:void(0);" onclick="LoginHint.showChooser();"
                                            id="hint_back_chooser">Back</a></div>
                                    <div id="loginwith" style="display: none;">
                                        Select a user name:</div>
                                    <div id="edit" style="display: none;">
                                        <a href="javascript:void(0);" onclick="LoginHint.showEdit();">Edit</a></div>
                                </div>
                                <div id="chooser" style="display: none;">
                                    <div id="idlist">
                                    </div>
                                    <div id="another" style="display: none;">
                                        <a href="javascript:void(0);" onclick="LoginHint.useNewIdentity();">Login with a different
                                            user name</a></div>
                                </div>
                                <div id="mydomainContainer" style="display: none;">
                                    <div class="loginbox_container" id="div1" runat="server">
                                        <div onclick="document.getElementById('mydomain').value = ''; this.style.display='none'; document.getElementById('mydomain').focus();"
                                            id="clrDomain" class="clrField" style="display: none;">
                                            &nbsp;</div>
                                        <form onsubmit="DomainSwitcher.handleMyDomain();return false;">
                                        <div class="identity first">
                                            <label for="mydomain" class="zen-assistiveText">
                                                Custom domain prefix</label><input style="border: 1px solid rgb(255, 0, 0);" placeholder="Enter your custom domain"
                                                    class="input identityinput" name="mydomain" id="mydomain" onkeyup="DomainSwitcher.updateMyDomain(this, event);"
                                                    type="text"></div>
                                        </form>
                                        <div id="mydomain_preview" class="loginbox_container">
                                        </div>
                                        <div class="loginbox_container">
                                            <input id="mydomain_suffix" value=".my.Dean.com" type="hidden"><input id="community_suffix"
                                                value=".na6.force.com" type="hidden">
                                            <button class="button" id="mydomainContinue" name="Continue" onclick="DomainSwitcher.handleMyDomain();">
                                                <span class="label">Continue</span></button></div>
                                        <div class="loginbox_container" id="mydomain_help">
                                        </div>
                                    </div>
                                </div>
                                <div style="display: inline;" id="theloginform">
                                    <input id="pqs" name="pqs" value="?locale=in" type="hidden"><fieldset style="display: none">
                                        <input name="un" value="" type="hidden">
                                        <input name="width" value="" type="hidden">
                                        <input name="height" value="" type="hidden">
                                        <input name="hasRememberUn" value="true" type="hidden">
                                        <input id="login_startUrl" name="startURL" value="" type="hidden">
                                        <input name="loginURL" value="null" type="hidden">
                                        <input name="loginType" value="" type="hidden">
                                        <input name="useSecure" value="true" type="hidden">
                                        <input name="local" value="" type="hidden">
                                        <input name="lt" value="standard" type="hidden">
                                        <input name="qs" value="" type="hidden">
                                        <input name="locale" value="in" type="hidden">
                                        <input name="oauth_token" value="" type="hidden">
                                        <input name="oauth_callback" value="" type="hidden">
                                        <input name="login" value="" type="hidden">
                                        <input name="serverid" value="" type="hidden">
                                        <input name="display" value="page" type="hidden">
                                    </fieldset>
                                    <p style="text-shadow: 1px 0.1px #0080FF; font-size: 17px;">
                                        Let us know you:
                                    </p>
                                    <asp:Label ID="lblerror1" runat="server" ForeColor="Red" Visible="false" Text="UserName and Password do not match."></asp:Label>
                                    <div class="loginbox_container" onclick="document.login.username.focus();">
                                        <div onclick="LoginHint.clearUsr();" id="Div4" class="clrField" style="display: none;">
                                            &nbsp;</div>
                                        <div class="identity first" style="margin-bottom: 10px;">
                                            <label for="username" class="zen-assistiveText">
                                                Name</label><span class="t"><img id="Img2" src="images/user188.png" alt="Name" class="thumbnail"
                                                    title="User Name" height="28" width="28"></span><input style="margin-bottom: 10px;"
                                                        placeholder="Name" class="input identityinput" name="username" id="Text2" runat="server"
                                                        type="text"></div>
                                    </div>
                                    <div class="loginbox_container" onclick="document.login.username.focus();">
                                        <div onclick="LoginHint.clearUsr();" id="Div3" class="clrField" style="display: none;">
                                            &nbsp;</div>
                                        <div class="identity first" style="margin-bottom: 10px;">
                                            <label for="username" class="zen-assistiveText">
                                                Email Address</label><span class="t"><img id="Img1" src="images/user188.png" alt="Email Address"
                                                    class="thumbnail" title="User Name" height="28" width="28"></span><input style="margin-bottom: 10px;"
                                                        placeholder="Email Address" class="input identityinput" name="username" id="Text1"
                                                        runat="server" type="text"></div>
                                    </div>
                                    <p style="text-shadow: 1px 0.1px #0080FF; font-size: 17px;">
                                        Login:
                                    </p>
                                    <div class="loginbox_container" onclick="document.login.username.focus();">
                                        <div onclick="LoginHint.clearUsr();" id="clrUsr" class="clrField" style="display: none;">
                                            &nbsp;</div>
                                        <div class="identity first" style="margin-bottom: 10px;">
                                            <label for="username" class="zen-assistiveText">
                                                User Name</label><span class="t"><img id="loginthumb" src="images/user188.png" alt="User Name"
                                                    class="thumbnail" title="User Name" height="28" width="28"></span><input style="margin-bottom: 10px;"
                                                        placeholder="User Name" class="input identityinput" name="username" id="username"
                                                        runat="server" type="text"></div>
                                    </div>
                                    <div id="div2" runat="server" class="loginbox_container" onclick="document.login.password.focus();">
                                        <div id="clrPw" class="clrField">
                                            &nbsp;</div>
                                        <div class="identity last">
                                            <label for="password" class="zen-assistiveText">
                                                Password</label><span class="t"><img src="images/lock188.png" alt="Password" class="thumbnail"
                                                    title="Password" height="28" width="28"></span><input placeholder="Password" class="input identityinput"
                                                        id="password" name="pw" onkeypress="checkCaps(event)" autocomplete="off" runat="server"
                                                        type="password"></div>
                                    </div>
                                    <div id="pwcaps" class="loginbox_container" style="display: none">
                                        <img src="images/warning16.png" id="pwcapsicon" alt="Caps Lock is ON!" height="16"
                                            width="16">
                                        Caps Lock is ON!</div>
                                    <p style="font-size: 11px;">
                                        Username: test &nbsp;&nbsp;Password: test</p>
                                    <div class="loginbox_container">
                                        <asp:Button ID="btnlogin" runat="server" CssClass="button" Text="Login into E-Booking"
                                            Style="width: 379px; margin-top: 10px;" OnClick="btnlogin_Click" OnClientClick="return CheckFormValidation()" />
                                        <%--<input type="button" value="Login into EBooking" class="button" style="width: 379px;margin-top: 10px;" />--%>
                                    </div>
                                    <script>                                        LoginHint.getSavedIdentities(false);</script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="right_side" style="margin-top: -25px;">
                <img src="http://www.deaninfotech.com/images/domains/features.PNG" style="border: 2px solid  blue;"
                    width="380" height="260" />
                <p class="p">
                    <img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG"></img>
                    Set up your assets in just few minutes</p>
                <p class="p">
                    <img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG" />
                    Multi-user license</p>
                <p class="p">
                    <img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG" />
                    Unlimited product, venues setup</p>
                <p class="p">
                    <img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG" />
                    Easy to use interface</p>
                <%--<p class="p"><img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG"/> Unlimited events or booking</p>
                                            <p class="p"><img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG"/> Perfect asset rental tracker</p>
                                            <p class="p"><img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG"/> Great support-always happy to help our customers</p>
                                            <p class="p"><img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG"/> Webbased-access from anywhere</p>
                                            <p class="p"><img height="28px" src="http://www.deaninfotech.com/images/tick3.PNG"/> Multi-domain usability</p>
                --%>
            </div>
        </div>
        <div id="footer" style="color: Black;">
            Copyright © 2000-2014 deaninfotech.com, inc. All rights reserved.</div>
    </div>
    </form>
</body>
</html>
