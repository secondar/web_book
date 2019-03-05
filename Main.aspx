<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>
<html>
        <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>图书借阅系统</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(function () {
                $(".meun-item").click(function () {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function () {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function () {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function () {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function () {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function () {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })
        </script>
        <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
<![endif]-->
        <link href="css/bootstrap.min.css" rel="stylesheet "/>
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/slide.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css"/>
        <link href="css/book_main.css" rel="stylesheet" />
        </head>

        <body>
        <form id="form1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
          <div>
            <div id="wrap"> 
              <!-- 左侧菜单栏目块 -->
              <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                  <p id="logoP"><img id="logo" alt="图书借阅管理系统" src="images/logo.png"/><span>图书借阅管理系统</span></p>
                </div>
                <div id="personInfor">
                  <p id="userName">
                    <asp:Label ID="Name" runat="server" Text="未登录"></asp:Label>
                    <br />
                    <asp:Label ID="row" runat="server" Text="未登录"></asp:Label>
                  </p>
                  <p><span>
                    <asp:Label ID="Email" runat="server" Text="未登录"></asp:Label>
                    </span></p>
                  <p>
                    <asp:Button ID="Logout" runat="server" Text="退出登录" BackColor="#4d5e70" OnClick="Logout_Click" />
                  </p>
                </div>
                <div class="meun-title">账号管理</div>
                <div class="meun-item meun-item-active" href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="images/icon_source.png">资源管理</div>
                <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">添加用户</div>
                <div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">用户管理</div>
                <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">修改密码</div>
                <div class="meun-title">地区管理</div>
                <div class="meun-item" href="#scho" aria-controls="scho" role="tab" data-toggle="tab"><img src="images/icon_house_grey.png">图书类别</div>
                <div class="meun-item" href="#regu" aria-controls="regu" role="tab" data-toggle="tab"><img src="images/icon_rule_grey.png">图书管理</div>
                <div class="meun-item" href="#stud" aria-controls="stud" role="tab" data-toggle="tab"><img src="images/icon_card_grey.png">图书借还</div>
                <div class="meun-item" href="#sitt" aria-controls="sitt" role="tab" data-toggle="tab"><img src="images/icon_char_grey.png">借阅统计</div>
              </div>
              <!-- 右侧具体内容栏目 -->
              <div id="rightContent"> <a class="toggle-btn" id="nimei"> <i class="glyphicon glyphicon-align-justify"></i> </a> 
                <!-- Tab panes -->
                <div class="tab-content"> 
                  <!-- 资源管理模块 -->
                  <div role="tabpanel" class="tab-pane active" id="sour">
                    <div class="data-div">
                      <div class="tablebody" style="text-align:center;">
                        <tr>
                          <td valign="top"> 系统功能:<br>
                            &nbsp;&nbsp;(1)系统分三种身份:超级管理员管理员和员工，可使用权限不一样！<br />
                            <br />
                            &nbsp; (2)图书管理：添加图书类别，维护图书类别，登记图书信息，维护图书信息<br />
                            <br />
                            &nbsp; (3)读者管理：添加读者类别，维护读者类别，登记读者信息，维护读者信息<br />
                            <br />
                            &nbsp; (4)借阅管理：读者借盘登记，读者还盘登记，借盘超期信息查看!<br />
                            <br />
                            &nbsp; (5)系统管理:管理员和读者登陆系统后可以修改自己的登陆密码，读者可以修改自己的个人信息。<Br />
                            系统特点：<br />
                            <br />
                            <br />
                            <br /></td>
                        </tr>
                      </div>
                    </div>
                    <!--页码块--> 
                  </div>
                  <!-- 添加用户模块 -->
                  <div role="tabpanel" class="tab-pane" id="char">
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-1 "> </div>
                        <div class="col-xs-4"> </div>
                        <div class="col-xs-5"> 添加用户 </div>
                        <div class="col-xs-2"> </div>
                      </div>
                      <div class="tablebody">
                        <div class="Adduser">
                          <asp:Label ID="Label6" runat="server" Text="用户名:　"></asp:Label>
                          <asp:TextBox ID="TextBox_Add_Name" runat="server" Width="200px"></asp:TextBox>
                          *<br />
                          <br />
                          <asp:Label ID="Label7" runat="server" Text="姓　名:　"></asp:Label>
                          <asp:TextBox ID="TextBox_name_Add" runat="server" Width="200px"></asp:TextBox>
                          *<br />
                          <br />
                          <asp:Label ID="Label12" runat="server" Text="性　别:　"></asp:Label>
                          <asp:DropDownList ID="DropDownLis_Sex" runat="server" Width="200px">
                            <asp:ListItem Value="1">男</asp:ListItem>
                            <asp:ListItem Value="0">女</asp:ListItem>
                          </asp:DropDownList>
                          *<br />
                          <br />
                          <asp:Label ID="Label8" runat="server" Text="密　码:　"></asp:Label>
                          <asp:TextBox ID="TextBox_Add_password" runat="server" Width="200px"></asp:TextBox>
                          *<br />
                          <br />
                          <asp:Label ID="Label9" runat="server" Text="电　话:　"></asp:Label>
                          <asp:TextBox ID="TextBox_Add_Tel" runat="server" Width="200px"></asp:TextBox>
                          <br />
                          <br />
                          <asp:Label ID="Label10" runat="server" Text="身　份:　"></asp:Label>
                          <asp:DropDownList ID="DropDownList_row" runat="server" Width="200px">
                            <asp:ListItem Value="1">超级管理员</asp:ListItem>
                            <asp:ListItem Value="2">管理员</asp:ListItem>
                            <asp:ListItem Value="3">工作人员</asp:ListItem>
                          </asp:DropDownList>
                          *<br />
                          <br />
                          <asp:Label ID="Label11" runat="server" Text="地　址:　"></asp:Label>
                          <asp:TextBox ID="TextBox_Address" runat="server" Width="200px"></asp:TextBox>
                          <br />
                          <br />
                        </div>
                        <div style="text-align:center;">
                          <asp:Button ID="Button_Add_User" runat="server" Text="添　加" class="btn btn-xs btn-green" Height="50px" Width="100px" OnClick="Button_Add_User_Click" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--用户管理模块-->
                  <div role="tabpanel" class="tab-pane" id="user">
                    <div class="check-div form-inline">
                      <div class="col-xs-3"> <a class="btn btn-yellow btn-xs" href="#char" aria-controls="char" role="tab" data-toggle="tab">添加用户 </a>
                        <asp:Button ID="Button3" runat="server" Text="刷新" class="btn btn-yellow btn-xs"  OnClick="Button_Statistics_all_Click"/>
                      </div>
                    </div>
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-2 "> Uid </div>
                        <div class="col-xs-2"> 登录名 </div>
                        <div class="col-xs-2"> 真实姓名 </div>
                        <div class="col-xs-2"> 身份:(1:超管/2:普管/3:员工) </div>
                        <div class="col-xs-2"> 状态 </div>
                        <div class="col-xs-2"> 操作 </div>
                      </div>
                      <div class="tablebody"> 
                        <!--top-->
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                          <ContentTemplate>
                            <asp:Repeater ID="Repeater_dh" runat="server" DataSourceID="SqlDataSource1">
                              <ItemTemplate>
                                <div class="row">
                                  <div class="col-xs-2 "> <%#Eval("User_Id") %> </div>
                                  <div class="col-xs-2"> <%#Eval("User_Name") %> </div>
                                  <div class="col-xs-2"> <%#Eval("User_Nickname") %> </div>
                                  <div class="col-xs-2"> <%#Eval("User_Row") %> </div>
                                  <div class="col-xs-2"> <%#Eval("User_Tel") %> </div>
                                  <div class="col-xs-2">
                                    <asp:HyperLink ID="hlDaoHang" runat="server" class="btn btn-success btn-xs" data-toggle="modal" data-target="#DeleteUser"
                                     NavigateUrl='<%#"Function_Delete.aspx?value="+Eval("User_Id")+"&Action=User_Delete" %>'
                                     Font-Underline="false" >删除</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#Userdialog"
                                     NavigateUrl='<%#"Function_Update_User.aspx?User_Id="+Eval("User_Id") %>'
                                     Font-Underline="false" >修改</asp:HyperLink>
                                  </div>
                                </div>
                              </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString=""
                SelectCommand="SELECT  * FROM Web_User"> </asp:SqlDataSource>
                            <!--bom--> 
                          </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                    </div>
                    <!--页码块-->
                    <footer class="footer">
                      <ul class="pagination">
                        <li> <i class="glyphicon glyphicon-menu-left"> </i> </li>
                        <li> <i class="glyphicon glyphicon-menu-right"> </i> </li>
                      </ul>
                    </footer>
                    
                    <!--弹出添加用户窗口-->
                    <div class="modal fade" id="Userdialog" role="dialog" aria-labelledby="gridSystemModalLabel" >
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                    <!-- /.modal --> 
                    <!-- /.modal --> 
                    <div class="modal fade" id="DeleteUser" role="dialog" aria-labelledby="gridSystemModalLabel" >
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                  </div>
                  <!-- 修改密码模块 -->
                  <div role="tabpanel" class="tab-pane" id="chan">
                    <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                      <div class="Adduser">
                        <asp:Label ID="Label4" runat="server" Text="原密码:　"></asp:Label>
                        <asp:TextBox ID="TextBox_U_Password" runat="server" Width="200px"></asp:TextBox>
                        *<br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="新密码:　"></asp:Label>
                        <asp:TextBox ID="TextBox_new_Password" runat="server" Width="200px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label14" runat="server" Text="新密码:　"></asp:Label>
                        <asp:TextBox ID="TextBox_new_Pass" runat="server" Width="200px"></asp:TextBox>
                        <br />
                        <br />
                      </div>
                      <div style="text-align:center;">
                        <asp:Button ID="Button_UpPassword" runat="server" Text="修　改" class="btn btn-xs btn-green" Height="50px" Width="100px" />
                      </div>
                    </div>
                  </div>
                  <!--图书类别模块-->
                  <div role="tabpanel" class="tab-pane" id="scho">
                    <div class="check-div form-inline">
                      <div class="col-xs-3">
                        <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#reviseSchool"
                                     NavigateUrl='<%#"Function_Update_User.aspx?User_Id="+Eval("User_Id") %>'
                                     Font-Underline="false" >添加类别</asp:HyperLink>
                        <asp:Button ID="Button2" runat="server" Text="刷新" class="btn btn-yellow btn-xs"  OnClick="Button_Statistics_all_Click"/>
                      </div>
                    </div>
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-1 "> 类别编号 </div>
                        <div class="col-xs-2 " style="margin-left:25%;"> 类别名称 </div>
                        <div class="col-xs-2" style="margin-left:25%;"> 操作 </div>
                      </div>
                      <div class="tablebody">
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                          <ContentTemplate>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                              <ItemTemplate>
                                <div class="row">
                                  <div class="col-xs-1 "> <%#Eval("Class_Id") %> </div>
                                  <div class="col-xs-2" style="margin-left:25%;"> <%#Eval("Class_Name") %> </div>
                                  <div class="col-xs-1" style="margin-left:25%;">
                                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-success btn-xs" data-toggle="modal" data-target="#Div1"
                                     NavigateUrl='<%#"Function_Update_Class.aspx?value="+Eval("Class_Id") %>'
                                     Font-Underline="false" >修改</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#Div3"
                                     NavigateUrl='<%#"Function_Delete.aspx?value="+Eval("Class_Id")+"&Action=Class_Delete" %>'
                                     Font-Underline="false" >删除</asp:HyperLink>
                                  </div>
                                </div>
                              </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"> </asp:SqlDataSource>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                    </div>
                    <!--页码块-->
                    <footer class="footer">
                      <ul class="pagination">
                        <li> <i class="glyphicon glyphicon-menu-left"> </i> </li>
                        <li> <i class="glyphicon glyphicon-menu-right"> </i> </li>
                      </ul>
                    </footer>
                    <!--弹出用户窗口-->
                    <div class="modal fade" id="reviseSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title" id="H1">添加图书类别</h4>
                          </div>
                          <div class="modal-body">
                            <div class="container-fluid">
                              <asp:Label ID="Label22" runat="server" Text="类别编号:"></asp:Label>
                              <asp:TextBox ID="TextBox_Class_Id" runat="server"></asp:TextBox>
                              <br />
                              <br />
                              <asp:Label ID="Label36" runat="server" Text="类别名称:"></asp:Label>
                              <asp:TextBox ID="TextBox_Class_Name" runat="server"></asp:TextBox>
                              <br />
                              <br />
                            </div>
                          </div>
                          <div class="modal-footer">
                            <asp:Button ID="Button_Yes"  class="btn btn-xs btn-green" runat="server" Text="保存"  OnClick="Button_Yes_Click"/>
                            <button class="btn btn-xs btn-white" type="button" >取消</button>
                          </div>
                        </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                    <!-- /.modal -->
                    <div class="modal fade" id="Div1" role="dialog" aria-labelledby="gridSystemModalLabel" >
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                      <div class="modal fade" id="Div3" role="dialog" aria-labelledby="gridSystemModalLabel" >
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                  </div>
                  <!--图书管理模块-->
                  <div role="tabpanel" class="tab-pane" id="regu">
                    <div class="check-div form-inline">
                      <div class="col-xs-3">
                          <a href="Function_Addbook.aspx" class="btn btn-yellow btn-xs" >添加图书</a>
                        <asp:Button ID="Button1" runat="server" Text="刷新" class="btn btn-yellow btn-xs"  OnClick="Button_Statistics_all_Click"/>
                      </div>
                    </div>
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-1 "> 图书编号 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 图书名称 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 类别 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 作者 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 出版社 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 库存 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 书柜 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 借阅次数 </div>
                        <div class="col-xs-1" style="margin-left:2%;"> 操作 </div>
                      </div>
                      <div class="tablebody">
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                          <ContentTemplate>
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                              <ItemTemplate>
                                <div class="row">
                                  <div class="col-xs-1 "> <%#Eval("Book_Id") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Book_Name") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Class_Name") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Book_author") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Book_Press") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Book_Stock") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Book_Case") %> </div>
                                  <div class="col-xs-1" style="margin-left:2%;"> <%#Eval("Book_Borrowing") %> </div>
                                  <div class="col-xs-2">
                                    <asp:HyperLink ID="hlDaoHang" runat="server" class="btn btn-success btn-xs" data-toggle="modal" data-target="#deletebook"
                                     NavigateUrl='<%#"Function_Delete.aspx?value="+Eval("Book_Id")+"&Action=Book_Delete" %>'
                                     Font-Underline="false" >删除</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#addBook"
                                     NavigateUrl='<%#"Function_UpBook.aspx?value="+Eval("Book_Id") %>'
                                     Font-Underline="false" >修改</asp:HyperLink>
                                  </div>
                                </div>
                              </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"> </asp:SqlDataSource>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                    </div>
                    <footer class="footer">
                      <ul class="pagination">
                        <li> <i class="glyphicon glyphicon-menu-left"> </i> </li>
                        <li> <i class="glyphicon glyphicon-menu-right"> </i> </li>
                      </ul>
                    </footer>
                    <!--弹出添加用户窗口-->
                    <div class="modal fade" id="addBook" role="dialog" aria-labelledby="gridSystemModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                    <!-- /.modal --> 
                      <div class="modal fade" id="deletebook" role="dialog" aria-labelledby="gridSystemModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                      <div class="modal fade" id="Add" role="dialog" aria-labelledby="gridSystemModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content"> </div>
                        <!-- /.modal-content --> 
                      </div>
                      <!-- /.modal-dialog --> 
                    </div>
                  </div>
                  <!--借阅统计模块-->
                  <div role="tabpanel" class="tab-pane" id="sitt">
                    <div class="check-div form-inline" style="">
                      <div class="col-lg-4 col-xs-7 col-md-6"> <a class="btn btn-yellow btn-xs" style="margin-right:20%;" href="#sitDetail" aria-controls="char" role="tab" data-toggle="tab">查看尚未归还的借阅信息</a>
                        <asp:Button ID="Button_Statistics_all" runat="server" Text="刷新" class="btn btn-yellow btn-xs"  OnClick="Button_Statistics_all_Click"/>
                      </div>
                    </div>
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-1 "> 图书编号 </div>
                        <div class="col-xs-1"> 图书名称 </div>
                        <div class="col-xs-1"> 图书类别 </div>
                        <div class="col-xs-1"> 图书作者 </div>
                        <div class="col-xs-1"> 所在书柜 </div>
                        <div class="col-xs-1"> 借阅次数 </div>
                        <div class="col-xs-1"> 借阅昵称 </div>
                        <div class="col-xs-2"> 借阅日期 </div>
                        <div class="col-xs-1"> 联系电话 </div>
                        <div class="col-xs-2"> 归还时间 </div>
                      </div>
                      <div class="tablebody">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                          <ContentTemplate> 
                            <!--top-->
                            
                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource4">
                              <ItemTemplate>
                                <div class="row">
                                  <div class="col-xs-1 "> <%#Eval("Borrowing_Book_Id") %> </div>
                                  <div class="col-xs-1 "> <%#Eval("Book_Name") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Class_Name") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Book_author") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Book_Press") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Book_Borrowing") %> </div>
                                  <div class="col-xs-1"> <%#Eval("User_Name") %> </div>
                                  <div class="col-xs-2"> <%#Eval("Borrowing_Time") %> </div>
                                  <div class="col-xs-1"> <%#Eval("User_Tel") %> </div>
                                  <div class="col-xs-2"> <%#Eval("Return_Time") %> </div>
                                </div>
                                <!-- 										--> 
                              </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"> </asp:SqlDataSource>
                            
                            <!--boom--> 
                          </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                    </div>
                    <!--页码块-->
                    <footer class="footer">
                      <ul class="pagination">
                        <li> <i class="glyphicon glyphicon-menu-left"> </i> </li>
                        <li> <i class="glyphicon glyphicon-menu-right"> </i> </li>
                      </ul>
                    </footer>
                  </div>
                  <!--尚未归还模块-->
                  <div role="tabpanel" class="tab-pane" id="sitDetail">
                    <div class="check-div form-inline"> <span href="#sitt" aria-controls="sitt" role="tab" data-toggle="tab" style="cursor: pointer; margin-right:20%;" class="btn btn-yellow btn-xs"><span></span>&nbsp;&nbsp;返回全部统计</span>
                      <asp:Button ID="Button_Statistics" runat="server" Text="刷新" class="btn btn-yellow btn-xs" OnClick="Button_Statistics_Click" />
                    </div>
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-1 "> 图书编号 </div>
                        <div class="col-xs-1"> 图书名称 </div>
                        <div class="col-xs-1"> 图书类别 </div>
                        <div class="col-xs-1"> 图书作者 </div>
                        <div class="col-xs-1"> 所在书柜 </div>
                        <div class="col-xs-1"> 借阅次数 </div>
                        <div class="col-xs-1"> 借阅昵称 </div>
                        <div class="col-xs-2"> 借阅日期 </div>
                        <div class="col-xs-1"> 联系电话 </div>
                        <div class="col-xs-2"> 归还时间 </div>
                      </div>
                      <div class="tablebody">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                          <ContentTemplate> 
                            <!--top-->
                            
                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource5">
                              <ItemTemplate>
                                <div class="row">
                                  <div class="col-xs-1 "> <%#Eval("Borrowing_Book_Id") %> </div>
                                  <div class="col-xs-1 "> <%#Eval("Book_Name") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Class_Name") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Book_author") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Book_Press") %> </div>
                                  <div class="col-xs-1"> <%#Eval("Book_Borrowing") %> </div>
                                  <div class="col-xs-1"> <%#Eval("User_Name") %> </div>
                                  <div class="col-xs-2"> <%#Eval("Borrowing_Time") %> </div>
                                  <div class="col-xs-1"> <%#Eval("User_Tel") %> </div>
                                  <div class="col-xs-2"> <%#Eval("Return_Time") %> </div>
                                </div>
                                <!-- 										--> 
                              </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"> </asp:SqlDataSource>
                            
                            <!--boom--> 
                          </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                    </div>
                    <!--页码块-->
                    <footer class="footer">
                      <ul class="pagination">
                        <li> <i class="glyphicon glyphicon-menu-left"> </i> </li>
                        <li> <i class="glyphicon glyphicon-menu-right"> </i> </li>
                      </ul>
                    </footer>
                  </div>
                  <!--图书借还模块-->
                  <div role="tabpanel" class="tab-pane" id="stud">
                    <div class="data-div">
                      <div class="row tableHeader">
                        <div class="col-xs-2 " style="margin-left:50%;"> 图书借阅 </div>
                      </div>
                      <div class="tablebody" style="margin-bottom:2px;padding:0;">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>
                            <div class="Borrowing_book">
                              <div class="tableHeader" style="background:#e3e8ee; margin:0;height:30px; text-align:center; padding:0;"> 图书信息 </div>
                              <asp:Label ID="Label1" runat="server" Text="图书编号:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing_Id" runat="server">　　　</asp:TextBox>
                              <asp:Button ID="Button_select_book" runat="server" Text="查询图书" OnClick="Button_select_book_Click" />
                              <br />
                              <br />
                              <asp:Label ID="Label2" runat="server" Text="图书名称:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing_Name" runat="server" Enabled="false"></asp:TextBox>
                              <asp:Label ID="Label3" runat="server" Text="图书类别:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing_slass" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label15" runat="server" Text="图书作者:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing_author" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label16" runat="server" Text="出版社　:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing_Press" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label18" runat="server" Text="图书书柜:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing_Case" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label13" runat="server" Text="借阅次数:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Borrowing" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                            </div>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                          <ContentTemplate>
                            <div class="Borrowing_book">
                              <div class="tableHeader" style="background:#e3e8ee; margin:0;height:30px; text-align:center; padding:0;"> 读者信息 </div>
                              <asp:Label ID="Label17" runat="server" Text="用户编号:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Select_Name" runat="server">　　　</asp:TextBox>
                              <asp:Button ID="Button_Select_User" runat="server" Text="查询信息" OnClick="Button_Select_User_Click" />
                              <br />
                              <br />
                              <asp:Label ID="Label19" runat="server" Text="真实名字:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Select_Nickname" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label20" runat="server" Text="联系电话:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Select_Tel" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label21" runat="server" Text="联系地址:　"></asp:Label>
                              <asp:TextBox ID="TextBox_Select_Address" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label34" runat="server" Text="违规次数:　" ></asp:Label>
                              <asp:TextBox ID="TextBox2" runat="server" Enabled="False" ></asp:TextBox>
                              <br />
                            </div>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="clear:none;"></div>
                        <asp:Button ID="Button_Borrowing" runat="server" Text="借阅" class="btn btn-danger btn-xs" style="width:100%; height:30px; margin-top:10px;" OnClick="Button_Borrowing_Click"/>
                      </div>
                      <div class="row tableHeader">
                        <div class="col-xs-2 " style="margin-left:50%;"> 图书归还 </div>
                      </div>
                      <div class="tablebody" style="margin-bottom:2px;padding:0;">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                          <ContentTemplate>
                            <div class="Borrowing_book">
                              <div class="tableHeader" style="background:#e3e8ee; margin:0;height:30px; text-align:center; padding:0;"> 图书信息 </div>
                              <asp:Label ID="Label23" runat="server" Text="图书编号:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_Id" runat="server">　　　</asp:TextBox>
                              <asp:Button ID="Button_select_return" runat="server" Text="查询图书" OnClick="Button_select_return_Click"/>
                              <br />
                              <br />
                              <asp:Label ID="Label24" runat="server" Text="图书名称:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_Name" runat="server" Enabled="false"></asp:TextBox>
                              <asp:Label ID="Label25" runat="server" Text="图书类别:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_Class" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label26" runat="server" Text="图书作者:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_author" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label27" runat="server" Text="出版社　:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_Press" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label28" runat="server" Text="图书书柜:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_Case" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label29" runat="server" Text="借阅次数:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_Book_Borrowing" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                            </div>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                          <ContentTemplate>
                            <div class="Borrowing_book">
                              <div class="tableHeader" style="background:#e3e8ee; margin:0;height:30px; text-align:center; padding:0;"> 读者信息 </div>
                              <asp:Label ID="Label30" runat="server" Text="用户编号:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_User_Id" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label35" runat="server" Text="借阅日期:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_User_Day" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label31" runat="server" Text="真实名字:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_User_Name" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label32" runat="server" Text="联系电话:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_User_Tel" runat="server" Enabled="False"></asp:TextBox>
                              <br />
                              <asp:Label ID="Label33" runat="server" Text="联系地址:　"></asp:Label>
                              <asp:TextBox ID="TextBox_return_User_Address" runat="server" Enabled="False"></asp:TextBox>
                              <asp:Label ID="Label39" runat="server" Text="归还日期:　" ></asp:Label>
                              <asp:TextBox ID="TextBox_Return_Time" runat="server" Enabled="False" ></asp:TextBox>
                              <br />
                            </div>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="clear:none;"></div>
                        <asp:Button ID="Button_return" runat="server" Text="归还" class="btn btn-success btn-xs" style="width:100%; height:30px; margin-top:10px;" OnClick="Button_return_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <script src="js/jquery.nouislider.js"></script> 
        </form>
</body>
</html>