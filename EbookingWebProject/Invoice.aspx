<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="EbookingWebProject.Invoice1" %>

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
    <script type="text/javascript">
        function checkValidate() {
            var remarks = document.getElementById("<%=txtremarks.ClientID %>").value.trim();
        if (remarks)
        { }
        else {

            document.getElementById("<%=lblid.ClientID %>").innerHTML = "Please Enter Remarks.";

            return false;
        }
    }

    </script>
    <script type="text/javascript">
        function clrtext() {
            document.getElementById("<%=lblid.ClientID %>").innerHTML = "";
        document.getElementById("<%=lblerror.ClientID %>").innerHTML = "";

        return false;
    }
    </script>
    <asp:Panel ID="Panel2" runat="server" DefaultButton="Button1">
     <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <div class="clear"></div>

                <div id="full-width">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12" style="padding: 0px;">
                                <div class="manage-col">
                                    <div class="col-sm-3">

                                        <div class="manage-col-left-head">
                                            <p>Add New Invoice</p>


                                        </div>

                                        <div class="manage-col-left">

                                            <asp:Label ID="lblid" Text="" runat="server" ForeColor="Red" Style="position: fixed"></asp:Label>
                                            <asp:Label ID="lbladded" runat="server" Text="" Style="display: none"><span>&#10004;</span> New Invoice added</asp:Label>
                                            <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="#990000"> Select PDF file first</asp:Label>
                                            <%-- <input type="text" value="First Name *" name="na" class="manage-col-left-input-main">--%>
                                            <div class="clear"></div>


                                            <div class="clear"></div>
                                            <div class="clear"></div>


                                            <div class="clear"></div>
                                            <br />
                                            <br />
                                            <br />
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/pdf.png" />
                                            <asp:FileUpload ID="fuinvoice" runat="server" onchange="clrtext()" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fuinvoice"
                                                ErrorMessage="Please select a .pdf  file only" ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F))|((d|D)(o|O)(c|C)))$"
                                                ForeColor="#990000" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                            <div class="clear"></div>




                                            <asp:TextBox ID="txtremarks" TextMode="MultiLine" Height="100px" ClientIDMode="Static" onchange="clrtext()"
                                                CssClass="manage-col-left-input-main" placeholder="Remarks *" runat="server"></asp:TextBox>



                                            <div class="clear"></div>


                                            <div class="clear"></div>


                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                    <asp:Button ID="Button1" runat="server" OnClientClick="return checkValidate()"
                                                        Text="Add Invoice" OnClick="btnsave_Click" Style="color: #fff; font-size: 12px; text-align: center; background: #272f45; line-height: 22px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px 10px;" />

                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">

                                                    <%-- <asp:Button ID="btnCancel"  runat="server" Text="Cancel" OnClientClick="return clearText();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" />--%>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">
                                            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsearch">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="float: left;">All Invoice </p>
                                                <div style="float: right; margin-right: 20px;">
                                                    <p style="color: #fff; float: left;">Search</p>
                                                    &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="File name, Remarks" value="" size="40" style="border-right: 10px; border: 1px #990000 solid;" />
                                                    <asp:Button ID="btnsearch" runat="server" Text="Go" Style="color: #272f45; width: 40px; font-size: 12px; text-align: center; background: #fff; line-height: 12px; border: 1px #900 solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; margin-left: 10px; border-radius: 5px; padding: 3px; height: 20px; float: right;" OnClick="btnsearch_Click" />
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
                                                AllowPaging="True" OnPageIndexChanging="grduser_PageIndexChanging" ShowFooter="false" CssClass="grid">
                                                <PagerStyle CssClass="cssPager" />

                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid" style="background: none; width: 100%;">

                                                                <div class="manage-col-mid-full-name">
                                                                    <p>Invoice Name</p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>Remarks</p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>Created On</p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                    <p>Download</p>
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
                                                                        <asp:Label runat="server" ID="lblitemname"><%#Eval("invoicename") %> </asp:Label>
                                                                    </p>
                                                                </div>

                                                                <div class="manage-col-mid-email">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblremarks"><%#Eval("remarks") %></asp:Label>
                                                                    </p>
                                                                </div>
                                                                <div class="manage-col-mid-phone">
                                                                    <p>
                                                                        <asp:Label runat="server" ID="lblcreatedate"><%#Eval("createdate") %></asp:Label>
                                                                    </p>
                                                                </div>
                                                                <div class="manage-col-mid-edit">
                                                                    <asp:LinkButton runat="server" ID="LinkButton2" CommandName="editt" CommandArgument='<%#Eval("id")%>'>Download</asp:LinkButton>
                                                                </div>
                                                                <div class="manage-col-mid-delete">
                                                                    <asp:ImageButton ID="lnkdlt" runat="server" ImageUrl="images/Delete_Icon.png" CommandName="del" OnClientClick="return confirm('Are you sure?')"
                                                                        CommandArgument='<%#Eval("id")+","+Eval("invoicepath")%>' OnClick="deletefile" />


                                                                </div>
                                                            </div>
                                                            </
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
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

    </asp:Panel>
</asp:Content>
