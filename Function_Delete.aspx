<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Function_Delete.aspx.cs" Inherits="css_Function_Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center;">
        <asp:Label ID="Label1" runat="server" Text="即将进行删除"></asp:Label><br />
        <asp:Label ID="Label2" runat="server" Text="是否要执行操作?"></asp:Label><br />
        <asp:Button ID="Button_Yes" class="btn btn-danger btn-xs" runat="server" Text="确定" OnClick="Button_yes_Click" />　　　<asp:Button ID="Button_No" class="btn btn-success btn-xs"  runat="server" Text="取消" OnClick="Button_No_Click" />
    </div>
    </form>
</body>
</html>
