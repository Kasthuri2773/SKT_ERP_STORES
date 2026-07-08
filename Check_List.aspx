<%@ Page Title="" Language="C#" MasterPageFile="MainPage.master" AutoEventWireup="true" CodeFile="Check_List.aspx.cs" Inherits="Check_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function() {
            $("[id$=txtSearch]").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("List_Service.asmx/GetCustomers") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function(data) {
                            response($.map(data.d, function(item) {
                                return {
                                    label: item.split('-')[0],
                                    val: item.split('-')[1]
                                }
                            }))
                        },
                        error: function(response) {
                            alert(response.responseText);
                        },
                        failure: function(response) {
                            alert(response.responseText);
                        }
                    });
                },
                minLength: 1
            });
        }); 
    </script>
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Submit_Click" />
</asp:Content>

