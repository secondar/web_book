<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Function_Addbook.aspx.cs" Inherits="Function_Addbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="height:300px; text-align:center;">
    <div>
    <asp:Label ID="Label37" runat="server" Text="图书编号:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_Id" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label38" runat="server" Text="图书名称:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_Name" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label40" runat="server" Text="图书类别:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_Class_Id" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label41" runat="server" Text="图书作者:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_author" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label42" runat="server" Text="图书出版:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_Press" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label43" runat="server" Text="所在书柜:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_Stock" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label44" runat="server" Text="图书库存:"></asp:Label>
    <asp:TextBox ID="TextBox_Book_Case" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button_Yes" class="btn btn-danger btn-xs" runat="server" Text="确定" OnClick="Button_yes_Click" />　　　<asp:Button ID="Button_No" class="btn btn-success btn-xs"  runat="server" Text="取消" OnClick="Button_No_Click" />
    
    </div>
    </form>
</body>
</html>
