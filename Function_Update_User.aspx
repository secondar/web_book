<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Function_Update_User.aspx.cs" Inherits="Function_Update" %>

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
    <div style="text-align:center;height:350px;">
        用户信息修改<br />
      <asp:Label ID="Label6" runat="server" Text="用户名:　"></asp:Label><asp:TextBox ID="Add_Name" runat="server" Width="200px" Enabled="False"></asp:TextBox>*<br />
      <asp:Label ID="Label7" runat="server" Text="姓　名:　"></asp:Label><asp:TextBox ID="name_Add" runat="server" Width="200px"></asp:TextBox>*<br />
      <asp:Label ID="Label12" runat="server" Text="性　别:　"></asp:Label><asp:DropDownList ID="Sex" runat="server" Width="200px">
      <asp:ListItem Value="1">男</asp:ListItem>
      <asp:ListItem Value="0">女</asp:ListItem>
      </asp:DropDownList>*<br />
      <asp:Label ID="Label8" runat="server" Text="密　码:　"></asp:Label><asp:TextBox ID="Add_password" runat="server" Width="200px"></asp:TextBox><br />
      <asp:Label ID="Label9" runat="server" Text="电　话:　"></asp:Label><asp:TextBox ID="Add_Tel" runat="server" Width="200px"></asp:TextBox><br />
      <asp:Label ID="Label10" runat="server" Text="身　份:　"></asp:Label><asp:DropDownList ID="row" runat="server" Width="200px">
      <asp:ListItem Value="1">超级管理员</asp:ListItem>
      <asp:ListItem Value="2">管理员</asp:ListItem>
      <asp:ListItem Value="3">工作人员</asp:ListItem>
      </asp:DropDownList>*<br />
      <asp:Label ID="Label11" runat="server" Text="地　址:　"></asp:Label><asp:TextBox ID="Address" runat="server" Width="200px"></asp:TextBox><br /><br />
        <asp:Button ID="Button_Yes" class="btn btn-danger btn-xs" runat="server" Text="确定" OnClick="Button_Yes_Click"/>　　　<asp:Button ID="Button_No" class="btn btn-success btn-xs"  runat="server" Text="取消"  OnClick="Button_No_Click"/>
        </div>
    </form>
</body>
</html>
