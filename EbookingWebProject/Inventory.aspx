<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="EbookingWebProject.Inventory1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function txtvalid() {
            debugger;
            var itemName = document.getElementById("<%=txtitemname.ClientID %>").value.trim();
                    var txtquantity = document.getElementById("<%=txtquantity.ClientID %>").value.trim();
                    var txtremarks = document.getElementById("<%=txtremarks.ClientID %>").value.trim();
                    var lbladded = document.getElementById("<%=lbladded.ClientID %>");
                    var lblid = document.getElementById("<%=lblid.ClientID %>"); //for update inventory

                    if (itemName)
                    { }
                    else {
                        document.getElementById("<%=txtitemname.ClientID %>").focus();
                        document.getElementById("<%=lbladded.ClientID %>").style.display = "block";
                        document.getElementById("<%=lbladded.ClientID %>").style.color = "Red";
                        document.getElementById("<%=lbladded.ClientID %>").innerHTML = "Please Enter Item Name.";
                        return false;
                    }
                    if (txtquantity)
                    { }
                    else {
                        document.getElementById("<%=txtquantity.ClientID %>").focus();
                        lbladded.innerHTML = "Please Enter Item Quantity.";
                        return false;
                    }
                    if (txtremarks)
                    { }
                    else {
                        document.getElementById("<%=txtremarks.ClientID %>").focus();
                        lbladded.innerHTML = "Please Enter Remarks.";
                        return false;
                    }


                }
            </script>
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
                function oncanceltxt() {
                    debugger;
                    document.getElementById("<%=txtitemname.ClientID %>").value = "";
                    document.getElementById("<%=txtquantity.ClientID %>").value = "";
                    document.getElementById("<%=txtremarks.ClientID %>").value = "";

                    document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";

                    document.getElementById("<%=lblid.ClientID %>").innerHTML = ""; //for update inventory
                    document.getElementById("<%=hdnidauto.ClientID %>").value = "0";
                    document.getElementById("<%=btnsave.ClientID %>").value = "Add Inventory";

                    return false;

                }
            </script>
            <script type="text/javascript">
                function onch() {

                    document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";

                    return false;

                }
            </script>
            <script type="text/javascript">
                function calme(test) {

                    var data = test.split(",");
                    document.getElementById("<%=lblid.ClientID %>").value = data[0];
                    document.getElementById("<%=txtitemname.ClientID %>").value = data[1];
                    document.getElementById("<%=txtquantity.ClientID %>").value = data[2];
                    document.getElementById("<%=txtremarks.ClientID %>").value = data[3];


                    document.getElementById("<%=btnsave.ClientID %>").value = "Update";
                    document.getElementById("<%=hdnidauto.ClientID %>").value = data[0];
                    document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";



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
                                            <p>Add New Inventory</p>
                                            <asp:Label ID="lblid" runat="server" ForeColor="Red" Text="" Style="position: fixed;"></asp:Label>

                                        </div>

                                        <div class="manage-col-left">
                                             <asp:HiddenField ID="hdnidauto" runat="server" />
                                          <asp:Label ID="lbladded" runat="server" Style="display: none; position: fixed"><span>&#10004;</span> New Inventory added</asp:Label>&nbsp;
                       
                                            <%-- <input type="text" value="First Name *" name="na" class="manage-col-left-input-main">--%>
                                              <asp:TextBox ID="txtitemname" ClientIDMode="Static" onchange="return onch();"  placeholder="Item name *" runat="server" CssClass="manage-col-left-input-main"></asp:TextBox>
                                            <div class="clear"></div>
                                             <asp:TextBox ID="txtquantity" ClientIDMode="Static" placeholder="Quantity Only Numeric.." CssClass="manage-col-left-input-main" onchange="return onchanhed();"   onkeypress="return validate(event)" runat="server" oncopy="return false" onpaste="return false" oncut="return false"></asp:TextBox>
                                            <%-- <input type="text" value="Last Name *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                            <asp:TextBox ID="txtremarks" ClientIDMode="Static"  onchange="return onch();"
                            placeholder="Remarks *"  CssClass="manage-col-left-input-main" runat="server"></asp:TextBox>
                                            <%-- <input type="text" value="Email Id *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>
                                           
                                         
                                            
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                    
                                                      <p><asp:Button ID="btnsave" CssClass="send_btns" OnClientClick="return txtvalid();" runat="server" Text="Add Inventory" OnClick="btnsave_Click" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" /></p>

                                                   
                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                   
                                               
                                              <p> <asp:Button ID="btnCancel" runat="server" Text="Cancel"  OnClientClick="return oncanceltxt();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;"
                             /></p>
                                                     </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">
                                          <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsearch">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="float:left;">All Inventory</p>
                                                  <div style=" float:right; margin-right:20px;"><p style="color:#fff; float:left;">Search</p> &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="Item name, Quantity, Remarks" value="" size="40" style="border-right:10px; border:1px #990000 solid;" />
                                               <asp:Button ID="btnsearch" runat="server"  Text="Go" style="color:#272f45; width:40px; font-size:12px; text-align:center; background:#fff; line-height:12px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px;  margin-left:10px; border-radius:5px; padding:3px; height:20px; float:right;" OnClick="btnsearch_Click"  />
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
                                            <asp:GridView ID="grduser" AutoGenerateColumns="false" runat="server" Width="100%" CssClass="grid"
                                                GridLines="Horizontal" EmptyDataText="No Record Found" OnRowCommand="grduser_RowCommand"
                                                AllowPaging="True" OnPageIndexChanging="grduser_PageIndexChanging" ShowFooter="false">
                                                <PagerStyle CssClass="cssPager" />
                                               
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid">

                                                                <div class="manage-col-mid-full-name">
                                                                    <p>Item Name</p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>Quantity</p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>Remarks</p>
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
                                                                         <asp:Label runat="server" style="display:none" ID="lblAutoid"><%#Eval("id")%>  </asp:Label>
                                        <asp:Label runat="server" ID="lblitemname"><%#Eval("itemname") %> </asp:Label></p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblquantity"><%#Eval("quantity") %></asp:Label></p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>
                                                                          <asp:Label runat="server" ID="lblremarks"><%#Eval("remarks") %></asp:Label></p>
                                                                      <asp:Label runat="server" style="display:none"  ID="lblcreatedate"><%#Eval("createdate") %></asp:Label>
                                                                </div>
                                                                <div class="manage-col-mid-edit">

                                                                     <a href="#" onclick="calme('<%#Eval("id")+","+Eval("itemname")+","+Eval("quantity")+","+Eval("remarks")%>')">
                                            <asp:Image ID="Image2" ImageUrl="images/edit-notes.png" runat="server" /></a>
                                                                   <%-- <a href="#" onclick="calme1('<%#Eval("id")+","+Eval("fname")+","+Eval("lname")+","+Eval("email")+","+Eval("phone")%>')">
                                                                        <asp:Image ID="Image1" ImageUrl="images/edit-notes.png" runat="server" /></a>--%>
                                                                </div>
                                                                <div class="manage-col-mid-delete">
<%--                                                                     <asp:LinkButton runat="server" ID="lnkdlt" CommandName="del" ImageUrl="images/Delete_Icon.png" OnClientClick="return confirm('Are you sure?')"  CommandArgument='<%#Eval("id")%>'></asp:LinkButton>--%>

                                                                      <asp:ImageButton ID="lnkdlt" runat="server" CommandName="del" CommandArgument='<%#Eval("id")%>' ImageUrl="images/Delete_Icon.png" OnClientClick="return confirm('Are you sure?')" />
                                                                   <%-- <asp:ImageButton ID="lnkdlt" runat="server" CommandName="del" CommandArgument='<%#Eval("id")%>' ImageUrl="images/Delete_Icon.png" OnClientClick="return confirm('Are you sure?')" />--%>
                                                                </div>
                                                            </div>
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
