<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillGridClientSide.aspx.cs" Inherits="EbookingWebProject.FillGridClientSide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
     <script src="jquery-ui.min.js" ></script> 
    <%--<script src='lib/moment.min.js' type="text/javascript"></script>--%>
    <link href="jquery-ui.css" rel="stylesheet" type="text/css" /> 
    <script type="text/javascript">
        debugger;
        $(document).ready(function () {
            SearchText();
        });
        function SearchText() {
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "FillGridClientSide.aspx/GetList",
                        data: "{'emplist':'" + document.getElementById('TextBox1').value + "'}",
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
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    
    </div>
    </form>
</body>
</html>
