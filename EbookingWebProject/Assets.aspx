<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Assets.aspx.cs" Inherits="EbookingWebProject.Add_location1" %>
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
         function validdate() {
             var txtlocation = document.getElementById("<%=txtlocation.ClientID %>").value.trim();
           var lbladded = document.getElementById("<%=lbladded.ClientID %>");

           if (txtlocation)
           { }
           else {
               document.getElementById("<%=lbladded.ClientID %>").style.display = "block";
               document.getElementById("<%=lbladded.ClientID %>").style.color = "Red";
               document.getElementById("<%=lbladded.ClientID %>").innerHTML = "Please Enter Venues/Assets.";
               return false;

           }
       }

   </script>
   <script type="text/javascript">
       function EmptyText() {
           document.getElementById("<%=txtlocation.ClientID %>").value = "";
           document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";
           document.getElementById("<%=lblid.ClientID %>").innerHTML = "";
           document.getElementById("<%=hdnidauto.ClientID %>").value = "0";
           document.getElementById("<%=btnsave.ClientID %>").value = "Add";

           return false;

       }

   </script>
   <script type="text/javascript">
       function calme(test) {

           var data = test.split(",");
           document.getElementById("<%=lblid.ClientID %>").value = data[0];
           document.getElementById("<%=txtlocation.ClientID %>").value = data[1];


           document.getElementById("<%=btnsave.ClientID %>").value = "Update";
           document.getElementById("<%=hdnidauto.ClientID %>").value = data[0];
           document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";


           return false;
       }
            </script>
            <script type="text/javascript">
                function ch() {
                    document.getElementById("<%=lbladded.ClientID %>").innerHTML = "";


                    return false;
                }
            </script>
            <script type="text/javascript">
                function MsgConfirm(cal) {

                    alert(cal);
                    return false;

                    alert("Are you sure you want to Inactive.!");
                    var x;
                    if (confirm("Assets Associated with this also Inactive.!! do you want to still Inactive.?") == true) {
                        return true;
                    } else {
                        return false;
                    }
                    alert("Assets Associated with this also deleted.!! do you want to still delete.?");
                    return false;

                }
            </script>
        <script type="text/javascript">
            function GiveAlert(con) {
                alert(con.innerHTML);
                alert("Are you sure you want to Inactive.!");
                var x;
                if (confirm("Assets Associated with this also Inactive.!! do you want to still Inactive.?") == true) {
                    return true;
                } else {
                    return false;
                }
                alert("Assets Associated with this also deleted.!! do you want to still delete.?");
                //return false;

                //alert(con.innerHTML);

                //return false;
            }
        </script>
        <script type="text/javascript" >
            $(document).on("click", "[id*=EditButton]"), function (event) {
                event.preventDefault();
                var body = $("[id*=Hidden1]").val();
                alert(body);
            }
        </script>
        <style>
		td{border-left:none !important; border-right:none !important;}
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
                                            <p>Add Venues/Assets</p>
              

                                        </div>

                                        <div class="manage-col-left">
                                            <asp:Label ID="lblid" style="display:none" runat="server"></asp:Label>
                 <asp:HiddenField ID="hdnidauto" runat="server" />
                                               <asp:Label ID="lbladded" runat="server" style="display:none;position:fixed; margin-top:-5px;"><span>&#10004;</span> New Location added</asp:Label>
                       
                                            
                                            
                                           <asp:TextBox ID="txtlocation" ClientIDMode="Static" placeholder="Add Venues/Assets *" onchange="return ch()"
                    CssClass="manage-col-left-input-main" runat="server"></asp:TextBox>
                                             <div class="clear"></div>

                                            
                                            <div class="clear"></div>
                                     
                                            <div class="clear"></div>
                                           
                                         
                                            
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                    
                                                      <p>
                                                           <asp:Button ID="btnsave"  OnClientClick="return validdate();"
                    runat="server" Text="Add" OnClick="btnsave_Click" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;" /></p>
                                                        

                                                   
                                                </div>
                                            </div>
                                            <div class="manage-col-more-main">
                                                <div class="event-col-more">
                                                   
                                               
                                              <p> <asp:Button ID="btncancel" runat="server" Text="Cancel"  OnClientClick="return EmptyText();" style="color:#fff; font-size:12px; text-align:center; background:#272f45; line-height:22px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; padding:5px 10px;"
                             /></p>
                                                     </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-9">
                                         <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsearch">
                                        <div class="manage-col-mid-main">
                                            <div class="manage-col-mid-head">
                                                <p style="width:30%; float:left;">All Venues/Assets</p>
                                                  <div style=" float:right; margin-right:20px;"><p style="color:#fff; float:left;">Search</p> &nbsp;&nbsp;
                                               <input type="text" id="txtsearch" runat="server" name="na" placeholder="Venues/Assets" value="" size="40" style="border-right:10px; border:1px #990000 solid;" />
                                            <asp:Button ID="btnsearch" runat="server"  Text="Go" style="color:#272f45; width:40px; font-size:12px; text-align:center; background:#fff; line-height:12px; border:1px #900 solid; -moz-border-radius:5px; -webkit-border-radius:5px;  margin-left:10px; border-radius:5px; padding:3px; height:20px; float:right;" OnClick="btnsearch_Click" />
                                            </div>
                                            </div>
                                          
                                            <div class="clear"></div>
                                             <div class="manage-col-left" style="padding:0px;">
                                            <asp:GridView ID="grduser2" AutoGenerateColumns="false" runat="server" Width="100%" EmptyDataText="No Venues/Assets added" OnRowCommand="grduser2_RowCommand"
                    AllowPaging="True" OnPageIndexChanging="grduser2_PageIndexChanging" CssClass="grid">
                                                <PagerStyle CssClass="cssPager" />
                                               
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>

                                                            <div class="manage-col-mid">

                                                                <div class="manage-col-mid-full-name" style="width:40%;">
                                                                    <p>Venues/Assets</p>
                                                                </div>

                                                               
                                                               
                                                                <div class="manage-col-mid-edit"  style="width:25%;">
                                                                    <p>Edit</p>
                                                                </div>
                                                                <div class="manage-col-mid-delete"  style="width:30%;">
                                                                    <p>Active/Inactive</p>
                                                                </div>




                                                            </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <div class="">
                                                                <div class="manage-col-mid-full-name"  style="width:40%;">
                                                                    <p>
                                                                         <asp:HiddenField ID="HiddenField1"  ClientIDMode="Static" Value='<%#Eval("ActiveFlag")%>' runat="server" />     
                                                                         <asp:Label runat="server" ID="lbllocation"><%#Eval("checkbox_location")%></asp:Label></p>
                                                                </div>

                                                               
                                                                
                                                                <div class="manage-col-mid-edit"  style="width:25%;">

                                                                     <a href="#" onclick="calme('<%#Eval("checkbox_id")+","+Eval("checkbox_location")%>')">
                                            <asp:Image ID="Image2" ImageUrl="images/edit-notes.png" runat="server" /></a>
                                                      
                                                                </div>
                                                                <div class="manage-col-mid-delete"  style="width:30%;">
                                                                                                                                                                                
                                <asp:LinkButton runat="server" ID="LinkButton1" CommandName="dele" Text='<%#Eval("ActiveFlag")%>' OnClientClick='<%#"return MsgConfirm("+ Eval("ActiveFlag") + ");"%>'  
                                    CommandArgument='<%#Eval("checkbox_id")%>' ></asp:LinkButton>
                                                                  
                                                                     
                                                               
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>


                                            

</div>


                                        </div>
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
