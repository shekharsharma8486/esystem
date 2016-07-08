<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EbookingWebProject.Details1" %>

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
    <asp:Label runat="server" ID="lblid" Style="display: none"></asp:Label>
     <script type="text/javascript">
         function ReDirect() {


             var ID = document.getElementById('<%=lblid.ClientID %>').innerHTML;
            // alert(ID);
            window.location = "EditEvent.aspx?id=" + ID + "";


        }
    </script>
    <div id="full-width">
        <div class="container">
            <div class="row">

                <div class="col-xs-12">
                    <div class="details-col-left-head">
                        <div class="details-col-left-head-text">
                            <p> <asp:Label runat="server" ID="lbltitle"></asp:Label></p>
                        </div>
                        <div style="width: 80px; float: right; background: #fff; border: 1px #272f45 solid; border-radius: 0 10px 10px 0; margin-top:2px;">
                           
                              <asp:ImageButton runat="server" ToolTip="Edit this event" Height="20px" Width="20px"
                            class="click1" ID="btnedit" ImageUrl="images/edit.jpg" OnClick="btnedit_Click" />


                            <asp:ImageButton runat="server" ToolTip="Delete this event" Height="20px" Width="20px"
                            class="click1" ID="btndlt" ImageUrl="images/delete.jpg" OnClick="btndlt_Click" OnClientClick="return confirm('Are you sure to delete this event?')" />
                            &nbsp;</div>
                    </div>
                    <div class="details-col">
                        <div class="col-sm-3">
                            <div class="details-col-part">

                                <div class="details-col-left">

                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Event owner  </p>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left">
                                                <p>Event owner  </p>
                                            </div>
                                            <div class="details-col-main-col-list-right">
                                                <p><asp:Label ID="lblEventOwner" runat="server" Text=""></asp:Label> </p>
                                            </div>
                                        </div>

                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left">
                                                <p>Event Created Date   </p>
                                            </div>
                                            <div class="details-col-main-col-list-right">
                                                <p> <asp:Label ID="lblEventCreatedDtae" runat="server" Text=""></asp:Label> </p>
                                            </div>
                                        </div>


                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left">
                                                <p>Event UpdatedBy  </p>
                                            </div>
                                            <div class="details-col-main-col-list-right">
                                                <p> <asp:Label ID="lblEventUpdatedBy" runat="server" Text=""></asp:Label> </p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left">
                                                <p>Event Updated Date  </p>
                                            </div>
                                            <div class="details-col-main-col-list-right">
                                                <p> <asp:Label ID="LBLEventUpdatedDate" runat="server" Text=""></asp:Label></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Event Details  </p>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Venues/Assets  </p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:Label ID="lblLocation" runat="server"></asp:Label> </p>
                                            </div>
                                        </div>

                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Start Date    </p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:Label ID="lblSdate" runat="server"></asp:Label>  </p>
                                            </div>
                                        </div>


                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>End date  </p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:Label ID="lblEdate" runat="server"></asp:Label> </p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Start time</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:Label ID="lblTime" runat="server" Style="display: none"></asp:Label>
                                <asp:Label ID="lblstarttime" runat="server"></asp:Label></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>End  time</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:Label ID="lblEndTime" runat="server"></asp:Label></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Status</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:Label ID="lblstatus" runat="server"></asp:Label></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Notes </p>
                                        </div>
                                        <div class="details-col-main-col-notes">
                                            <p>
                                               <asp:Label ID="lblNotes" runat="server" Text=""></asp:Label>
                                            </p>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="details-col-part">
                                <div class="details-col-mid-main">

                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Client(S)</p>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p><asp:Label ID="lblPname1" runat="server"></asp:Label>&nbsp;<asp:Label ID="lblPname11"
                                    runat="server"></asp:Label></p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:Label ID="lblPEmail2" runat="server"></asp:Label></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p> <asp:Label ID="lblPPhone3" runat="server"></asp:Label></p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:Label ID="lblClientConfirm" runat="server"></asp:Label></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Inventory</p>
                                        </div>
                                        <asp:GridView ID="GrdInventory" runat="server" Width="100%" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
<div class="details-col-main-col-list-left3">
                                                <p>Select Inventory</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Qty Only Numeric</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p>Qty Description</p>
                                            </div>

                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                          <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p><asp:Label runat="server" ID="lblitem" Text='<%#Eval("itemname") %>'></asp:Label></p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p><asp:Label runat="server" ID="Label1" Text='<%#Eval("quantity") %>'></asp:Label></p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:Label runat="server" ID="Lbldate" Text='<%#Eval("remarks") %>'></asp:Label></p>
                                            </div>
                                        </div>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                            </Columns>

                                        </asp:GridView>
                                        <div class="details-col-main-col-list">

                                            
                                        </div>
                                      
                                      <%--  <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Table, Chair</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>234</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p>Demo text demo text demo text</p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Table, Chair</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>234</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p>Demo text demo text demo text</p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Table, Chair</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>234</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p>Demo text demo text demo text</p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Table, Chair</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>234</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p>Demo text demo text demo text</p>
                                            </div>
                                        </div>--%>




                                    </div>


                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Notification </p>
                                        </div>
                                      

                                            <asp:GridView ID="gvuser" runat="server" Width="100%"
                                    AutoGenerateColumns="false" EmptyDataText="No Notification Added.." >
                                    <Columns>
                                        
                                        <asp:TemplateField >
                                            <HeaderTemplate>
                                                 <div class="details-col-main-col-list">
                                
                                	 <div class="details-col-main-col-list-left3">
                                     	<p>Name </p>
                                     </div>
                                      <div class="details-col-main-col-list-left3">
                                     	<p>Email Id </p>
                                     </div>
                                      <div class="details-col-main-col-list-left3">
                                     	<p>Description</p>
                                     </div>
                                      <div class="details-col-main-col-list-left3">
                                     	<p>Date </p>
                                     </div>
                                      
                                </div>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p> <asp:Label runat="server" ID="lbluserid" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="lblusername" Text='<%#Eval("Usr") %>'></asp:Label></p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p> <asp:Label runat="server" ID="lbldesc" Text='<%#Eval("descp") %>'></asp:Label></p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>

                                                    <asp:Label runat="server" ID="lbldate" Text='<%#Eval("dtt") %>'></asp:Label>
                                                </p>
                                            </div>

                                        </div>

                                            <%--    <asp:Label runat="server" ID="lbluserid" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="lblusername" Text='<%#Eval("Usr") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField >
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbldesc" Text='<%#Eval("descp") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbldate" Text='<%#Eval("dtt") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                                  </ItemTemplate>
                                                    </asp:TemplateField>
                                    </Columns>
                                   
                                </asp:GridView>
                                        <%--    <div class="details-col-main-col-list-left3">
                                                <p>Name </p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Email Id </p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Date</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Description </p>
                                            </div>--%>

                                       
                                     <%--   <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Jitendra Singh</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>30/04/2015</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Demo text demo text</p>
                                            </div>

                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Jitendra Singh</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>30/04/2015</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Demo text demo text</p>
                                            </div>

                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Jitendra Singh</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>30/04/2015</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Demo text demo text</p>
                                            </div>

                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Jitendra Singh</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>30/04/2015</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Demo text demo text</p>
                                            </div>

                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Jitendra Singh</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>30/04/2015</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Demo text demo text</p>
                                            </div>

                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left3">
                                                <p>Jitendra Singh</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>info@gmail.com</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>30/04/2015</p>
                                            </div>
                                            <div class="details-col-main-col-list-left3">
                                                <p>Demo text demo text</p>
                                            </div>

                                        </div>--%>





                                    </div>


                                </div>

                            </div>
                        </div>
                    
                        <div class="col-sm-3">
                            <div class="details-col-part">
                                <div class="details-col-mid-main">

                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p style="float: left;">Payment Details </p>
                                            <p style="float: right; margin-right: 20px;">
                                                <asp:Label ID="lblcurr" runat="server" ></asp:Label></p>
                                        </div>

                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Total Billable Amount</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:Label ID="lbltamt" Font-Size="17px" runat="server" Text=""></asp:Label></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Paid Amount</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:Label ID="lbldamt" Font-Size="17px" runat="server" Text=""></asp:Label></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Payable</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:Label ID="lblbamt" Font-Size="17px" runat="server" Text=""></asp:Label></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Invoice Attachment</p>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <!--<div class="details-col-main-col-list-left2">
                                                <p>Add a New Invoice</p>
                                            </div>-->
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:LinkButton ID="lnkAttachment" CommandArgument='<%# Eval("invoicepath") %>' OnClick="invoiceAttachment"
                                    runat="server" ToolTip="Download"></asp:LinkButton></p>
                                            </div>
                                        </div>

                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Attachment File </p>
                                            </div>
                                           
                                        </div>

                                    </div>

                                    <div class="details-col-main-col">

                                        <div class="details-col-main-col-head">
                                            <p>Attachment</p>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Attachment File</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:LinkButton ID="lnkattch1" CommandArgument='<%# Eval("attachment1") %>' OnClick="attachment1"
                                    runat="server" ToolTip="Download"></asp:LinkButton></p>
                                            </div>
                                        </div>

                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Attachment File</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:LinkButton ID="lnkattch2" CommandArgument='<%# Eval("attachment2") %>' OnClick="attachment2"
                                    runat="server" ToolTip="Download"></asp:LinkButton></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Attachment File</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p> <asp:LinkButton ID="lnkattch3" CommandArgument='<%# Eval("attachment3") %>' OnClick="attachment3"
                                    runat="server" ToolTip="Download"></asp:LinkButton></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <div class="details-col-main-col-list-left2">
                                                <p>Attachment File</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p><asp:LinkButton ID="lnkattch4" CommandArgument='<%# Eval("attachment4") %>' OnClick="attachment4"
                                    runat="server" ToolTip="Download"></asp:LinkButton></p>
                                            </div>
                                        </div>
                                        <div class="details-col-main-col-list">

                                            <%--<div class="details-col-main-col-list-left2">
                                                <p>Attachment File</p>
                                            </div>
                                            <div class="details-col-main-col-list-right2">
                                                <p>05</p>
                                            </div>--%>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
