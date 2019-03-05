<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录-勿忘初心-book</title>
    <link href="css/book_main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="login_control">
         <div class="login_control_name">
             <asp:Label ID="Label_name" runat="server" Text="用户名:"></asp:Label>
             <asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox>
         </div>
         <div class="login_control_password">
             <asp:Label ID="Label1" runat="server" Text="密　码:"></asp:Label>
             <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
         </div>
         <div class="login_control_login">
             <asp:ImageButton ID="ImageButton_login" runat="server" ImageUrl="~/image/btn_login.gif" OnClick="ImageButton_login_Click" />　　
             <asp:ImageButton ID="ImageButton_register" runat="server" ImageUrl="~/image/btn_register.gif" />
         </div>
     </div>
    </div>
    </form>
    
</body>

</html>
