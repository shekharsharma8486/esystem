<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="EbookingWebProject.Promoter1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";
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
        function valid() {
            debugger;
            document.getElementById("<%=lbladded.ClientID %>").style.display = "none";
            document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";
            var name = document.getElementById("<%=txtfname.ClientID %>").value.trim();
            var lname = document.getElementById("<%=txtlname.ClientID %>").value.trim();
            var email = document.getElementById("<%=txtemail.ClientID %>").value.trim();
            var phone = document.getElementById("<%=txtphone.ClientID %>").value.trim();
            var cemail = document.getElementById("<%=txtcemail.ClientID %>").value.trim();
            var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            var valid = emailReg.test(email);




            if (name) {
                // document.getElementById("<%=txtfname.ClientID %>").style.borderColor = "green";
            }
            else {
                // document.getElementById("<%=txtfname.ClientID %>").style.borderColor = '#e52213';
                document.getElementById("<%=lblid.ClientID %>").innerHTML = 'Please Enter Fname.';
                document.getElementById("<%=txtfname.ClientID %>").focus();

                return false;
            }
            if (lname) { }
            else {

                // document.getElementById("<%=txtlname.ClientID %>").style.borderColor = '#e52213';
                document.getElementById("<%=lblid.ClientID %>").innerHTML = 'Please Enter lname.';
                document.getElementById("<%=txtlname.ClientID %>").focus();
                return false;
            }
            if (email) {
                if (!valid) {

                    document.getElementById("<%=lblid.ClientID %>").innerHTML = 'invalid email format..!!!';
                    document.getElementById("<%=txtemail.ClientID %>").focus();
                    //document.getElementById("<%=txtemail.ClientID %>").style.borderColor = '#e52213';

                    return false;
                } else {

                }
            }
            else {

                document.getElementById("<%=lblid.ClientID %>").innerHTML = 'Please Enter EmailId.';
                document.getElementById("<%=txtemail.ClientID %>").focus();
                // document.getElementById("<%=txtemail.ClientID %>").style.borderColor = '#e52213';
                return false;

            }
            if (cemail) { }
            else {
                //document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = '#e52213';
                document.getElementById("<%=lblid.ClientID %>").innerHTML = 'Please Enter Confirm EmailId.';
                document.getElementById("<%=txtcemail.ClientID %>").focus();
                // document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = '#e52213';
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID %>").value == document.getElementById("<%=txtcemail.ClientID %>").value)
            { }
            else {

                // document.getElementById("<%=txtemail.ClientID %>").style.borderColor = '#e52213';
                // document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = '#e52213';
                document.getElementById("<%=lblid.ClientID %>").innerHTML = 'Email-id and Confirm Email-id MissMatch..!!.';
                document.getElementById("<%=txtcemail.ClientID %>").focus();

                return false;
            }


            if (phone) { }
            else {
                //document.getElementById("<%=txtphone.ClientID %>").style.borderColor = '#e52213';
                // document.getElementById("<%=txtphone.ClientID %>").style.borderColor = '#e52213';
                document.getElementById("<%=lblid.ClientID %>").innerHTML = 'Please Enter Phone Number.';
                document.getElementById("<%=txtphone.ClientID %>").focus();

                return false;
            }





        }


    </script>
    <script type="text/javascript">
        function txtonchange() {
            var name = document.getElementById("<%=txtfname.ClientID %>").value;
            var lname = document.getElementById("<%=txtlname.ClientID %>").value;
            var email = document.getElementById("<%=txtemail.ClientID %>").value;
            var phone = document.getElementById("<%=txtphone.ClientID %>").value;
            var cemail = document.getElementById("<%=txtcemail.ClientID %>").value;
            document.getElementById("<%=lblid.ClientID %>").innerHTML = "";
            document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";




            if (name) {

            }
            else {

                return false;
            }
            if (lname) {
                //                document.getElementById("<%=txtlname.ClientID %>").style.borderColor = "green";
            }
            else {
                // document.getElementById("<%=txtlname.ClientID %>").style.borderColor = '#e52213';
                return false;
            }
            if (email) {
                // document.getElementById("<%=txtemail.ClientID %>").style.borderColor = 'green';
            }
            else {
                // document.getElementById("<%=txtemail.ClientID %>").style.borderColor = '#e52213';
                return false;
            }
            if (cemail) {
                //  document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = 'green';
            }
            else {
                // document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = '#e52213';
                return false;
            }
            if (email == cemail) {
                // document.getElementById("<%=txtemail.ClientID %>").style.borderColor = 'green';
                // document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = 'green';

            }
            else {
                //document.getElementById("<%=txtemail.ClientID %>").style.borderColor = '#e52213';
                //// document.getElementById("<%=txtcemail.ClientID %>").style.borderColor = '#e52213';
            }
            if (phone) {
                //document.getElementById("<%=txtphone.ClientID %>").style.borderColor = 'green';

            }
            else {
                // document.getElementById("<%=txtphone.ClientID %>").style.borderColor = '#e52213';
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function clearText() {

            document.getElementById("<%=txtfname.ClientID %>").value = "";
            document.getElementById("<%=txtlname.ClientID %>").value = "";
            document.getElementById("<%=txtemail.ClientID %>").value = "";
            document.getElementById("<%=txtphone.ClientID %>").value = "";
            document.getElementById("<%=txtcemail.ClientID %>").value = "";
            document.getElementById("<%=lblid.ClientID %>").value = "";
            document.getElementById("<%=lblid.ClientID %>").innerHTML = "";

            document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";
            document.getElementById("<%=lbladded.ClientID %>").value = "";
            document.getElementById("<%=hdbPromtId.ClientID %>").value = "";
            document.getElementById("<%=lbladded.ClientID %>").style.display = "none";
            document.getElementById("<%=lblid.ClientID %>").innerHTML = "";

            document.getElementById("<%=hdbPromtId.ClientID %>").value = "0";
            document.getElementById("<%=btnsave.ClientID %>").value = "Add Client"

            return false;

        }

    </script>
    <script type="text/javascript">
        function calme1(test) {

            var data = test.split(",");
            document.getElementById("<%=lblid.ClientID %>").value = data[0];
            document.getElementById("<%=hdbPromtId.ClientID %>").value = data[0];
            document.getElementById("<%=txtfname.ClientID %>").value = data[1];
            document.getElementById("<%=txtlname.ClientID %>").value = data[2];
            document.getElementById("<%=txtemail.ClientID %>").value = data[3];
            document.getElementById("<%=txtcemail.ClientID %>").value = data[3];
            document.getElementById("<%=txtphone.ClientID %>").value = data[4];
            document.getElementById("<%=btnsave.ClientID %>").value = "Update";
            document.getElementById("<%=lbladded.ClientID %>").style.display = "none";
            document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";
            document.getElementById("<%=lblid.ClientID %>").innerHTML = "";


            return false;
        }
    </script>
    
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
                                            <p>Add New Client</p>
                                            <asp:Label ID="lblid" runat="server" ForeColor="Red" Text="" Style="position: fixed; margin-top: -1px;"></asp:Label>

                                        </div>

                                        <div class="manage-col-left">

                                            <asp:HiddenField ID="hdbPromtId" runat="server" />
                                            <asp:Label ID="lbladded" runat="server" Style="display: none"><span>&#10004;</span> New Promoter added</asp:Label>
                                            <%-- <input type="text" value="First Name *" name="na" class="manage-col-left-input-main">--%>
                                            <asp:TextBox ID="txtfname" ClientIDMode="Static" onchange="txtonchange();" placeholder="First name *"
                                                CssClass="manage-col-left-input-main" runat="server"></asp:TextBox>
                                            <div class="clear"></div>
                                            <asp:TextBox ID="txtlname" ClientIDMode="Static" onchange="txtonchange();" placeholder="Last name"
                                                CssClass="manage-col-left-input-main" runat="server"></asp:TextBox>
                                            <%-- <input type="text" value="Last Name *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <asp:TextBox ID="txtemail" ClientIDMode="Static" onchange="txtonchange();" CssClass="manage-col-left-input-main"
                                                placeholder="Email id *" runat="server"></asp:TextBox>
                                            <%-- <input type="text" value="Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <asp:TextBox ID="txtcemail" onchange="txtonchange();" ClientIDMode="Static" CssClass="manage-col-left-input-main"
                                                placeholder="Confirm Email id *" runat="server"></asp:TextBox>
                                            <%--  <input type="text" value="Confirm Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <asp:TextBox ID="txtphone" ClientIDMode="Static" onchange="txtonchange();" CssClass="manage-col-left-input-main"
                                                placeholder="Phone number Only Numeric *" runat="server" onkeypress="return validate(event)"></asp:TextBox>
                                            <%-- <input type="text" value="Phone Number Only Numeric *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                  
                                                    <asp:Button ID="btnsave" OnClientClick="return valid();" runat="server" Text="Add Client" OnClick="btnsave_Click" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                  
                                                    <asp:Button ID="btnCancel"  runat="server" Text="Cancel" OnClientClick="return clearText();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">
                                          <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsearch">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="float:left;"> All Client </p>
                                           <div style=" float:right; margin-right:20px;"><p style="color:#fff; float:left;">Search</p> &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="First name, Last name, Email,Phone" value="" size="40" style="border-right:10px; border:1px #990000 solid;" />
                                               <asp:Button ID="btnsearch" runat="server"  Text="Go" style="color:#272f45; width:40px; font-size:12px; text-align:center; background:#fff; line-height:12px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px;  margin-left:10px; border-radius:5px; padding:3px; height:20px; float:right;" OnClick="btnsearch_Click" />
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
                                            <asp:GridView ID="grduser" AutoGenerateColumns="false" runat="server" Width="100%"
                                                GridLines="Horizontal" EmptyDataText="No Record Found" OnRowCommand="grduser_RowCommand"
                                                AllowPaging="True" OnPageIndexChanging="grduser_PageIndexChanging" ShowFooter="false" CssClass="grid" >
                                                <PagerStyle CssClass="cssPager" />

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid" style="background:none; width:100%;">

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
                                                                        <asp:Label runat="server" ID="lblname"><%#Eval("fname") +" "+Eval("lname") %></asp:Label></p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblemail"><%#Eval("email") %></asp:Label></p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblphone"><%#Eval("phone") %></asp:Label></p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                    <a href="#" onclick="calme1('<%#Eval("id")+","+Eval("fname")+","+Eval("lname")+","+Eval("email")+","+Eval("phone")%>')">
                                                                        <asp:Image ID="Image1" ImageUrl="images/edit-notes.png" runat="server" /></a>
                                                                </div>
                                                                <div class="manage-col-mid-delete">
                                                                    <asp:ImageButton ID="lnkdlt" runat="server" CommandName="del" CommandArgument='<%#Eval("id")%>' ImageUrl="images/Delete_Icon.png" OnClientClick="return confirm('Are you sure?')" />
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
