<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Function_Update_Class.aspx.cs" Inherits="Function_Update_Class" %>

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
        <asp:Label ID="Label22" runat="server" Text="类别编号:"></asp:Label><asp:TextBox ID="TextBox_Class_Id" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label36" runat="server" Text="类别名称:"></asp:Label><asp:TextBox ID="TextBox_Class_Name" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="Button_Yes" class="btn btn-danger btn-xs" runat="server" Text="确定" OnClick="Button_yes_Click" />　　　<asp:Button ID="Button_No" class="btn btn-success btn-xs"  runat="server" Text="取消" OnClick="Button_No_Click" />
    </div>
    </form>
</body>
</html>
