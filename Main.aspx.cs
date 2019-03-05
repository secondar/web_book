using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
        SqlDataSource2.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
        SqlDataSource3.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
        SqlDataSource4.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
        SqlDataSource5.ConnectionString = ConfigurationSettings.AppSettings["connectionstring"].ToString();
        SqlDataSource1.SelectCommand = "SELECT  * FROM Web_User";
        SqlDataSource2.SelectCommand = "SELECT * FROM Web_Book_class";
        SqlDataSource3.SelectCommand = "SELECT * FROM Web_Book,Web_Book_class where Web_Book.Book_Class_id=Web_Book_class.Class_Id";
        SqlDataSource4.SelectCommand = "select top 20 Borrowing_Book_Id,Book_Name,Class_Name,Book_author,Book_Press,Book_Case,Book_Borrowing,User_Name,Borrowing_Time,User_Nickname,User_Tel,User_Address,Return_Time from Web_Borrowing,Web_Book,Web_Book_class,Web_User where Web_Borrowing.Borrowing_Book_Id=Web_Book.Book_Id and Web_User.User_Name=Web_Borrowing.Borrowing_User_Name and Web_Book.Book_Class_Id=Web_Book_class.Class_Id";
        SqlDataSource5.SelectCommand = "select Borrowing_Book_Id,Book_Name,Class_Name,Book_author,Book_Press,Book_Case,Book_Borrowing,User_Name,Borrowing_Time,User_Nickname,User_Tel,User_Address,Return_Time from Web_Borrowing,Web_Book,Web_Book_class,Web_User where Web_Borrowing.Borrowing_Book_Id=Web_Book.Book_Id and Web_User.User_Name=Web_Borrowing.Borrowing_User_Name and Web_Book.Book_Class_Id=Web_Book_class.Class_Id and Return_Time is null";
        string Login;
        try
        {
            Login = Session["User_Name"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            string Tsql = "SELECT * FROM Web_User where User_Name=@Login";
            com.CommandText = Tsql;
            com.Parameters.AddWithValue("Login", Login);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                Name.Text = dr["User_Name"].ToString();
                if (dr["User_Row"].ToString().Equals("1"))
                {
                    row.Text = "超级管理员";
                }
                if (dr["User_Row"].ToString().Equals("2"))
                {
                    row.Text = "管理员";
                }
                if (dr["User_Row"].ToString().Equals("3"))
                {
                    row.Text = "员工";
                }
                Email.Text = dr["User_Tel"].ToString();
            }
            con.Close();
        }
        catch
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void Button_select_book_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "SELECT * FROM Web_Book,Web_Book_class where Web_Book.Book_Class_id=Web_Book_class.Class_Id and Book_Id=@Bookid";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Bookid", TextBox_Borrowing_Id.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            TextBox_Borrowing_Name.Text = dr["Book_Name"].ToString(); 
            TextBox_Borrowing_slass.Text = dr["Class_Name"].ToString();
            TextBox_Borrowing_Press.Text = dr["Book_Press"].ToString();
            TextBox_Borrowing_author.Text = dr["Book_author"].ToString();
            TextBox_Borrowing_Case.Text = dr["Book_Case"].ToString();
            TextBox_Borrowing.Text = dr["Book_Borrowing"].ToString(); 
        }
        else
        {
            Response.Write("<script>alert('数据库中无匹配书号');</script>");
        }
        con.Close();
    }
    protected void Button_Select_User_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "SELECT * FROM Web_User where User_Name=@Name";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Name", TextBox_Select_Name.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            TextBox_Select_Nickname.Text = dr["User_Nickname"].ToString();
            TextBox_Select_Tel.Text = dr["User_Tel"].ToString();
            TextBox_Select_Address.Text = dr["User_Address"].ToString();

        }
        else
        {
            Response.Write("<script>alert('数据库中无匹配用户');</script>");
        }
        con.Close();
    }
    protected void Button_Borrowing_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "insert into Web_Borrowing values (@Borrowing_Book_Id,@Borrowing_User_Name,Null,@Borrowing_Time)";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Borrowing_Book_Id", TextBox_Borrowing_Id.Text.Trim());
        com.Parameters.AddWithValue("Borrowing_User_Name", TextBox_Select_Name.Text.Trim());
        com.Parameters.AddWithValue("Borrowing_Time", DateTime.Now.ToLocalTime().ToString());
        if (com.ExecuteNonQuery()>0)
        {

            Response.Write("<script>alert('借阅成功');</script>");
            TextBox_Borrowing_Name.Text = "";
            TextBox_Borrowing_slass.Text = "";
            TextBox_Borrowing_Press.Text = "";
            TextBox_Borrowing_author.Text = "";
            TextBox_Borrowing_Case.Text = "";
            TextBox_Borrowing.Text = "";
            TextBox_Select_Nickname.Text = "";
            TextBox_Select_Tel.Text = "";
            TextBox_Select_Address.Text = "";
        }
        else
        {
            Response.Write("<script>alert('借阅失败');</script>");
        }
        con.Close();
    }
    protected void Button_select_return_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "select Book_Name,Class_Name,Book_author,Book_Press,Book_Case,Book_Borrowing,User_Name,Borrowing_Time,User_Nickname,User_Tel,User_Address,Return_Time from Web_Borrowing,Web_Book,Web_Book_class,Web_User where Web_Borrowing.Borrowing_Book_Id=Web_Book.Book_Id and Web_User.User_Name=Web_Borrowing.Borrowing_User_Name and Web_Book.Book_Class_Id=Web_Book_class.Class_Id and Borrowing_Book_Id=@select_book_id";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("select_book_id", TextBox_return_Book_Id.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            TextBox_return_Book_Name.Text = dr["Book_Name"].ToString();
            TextBox_return_Book_Class.Text = dr["Class_Name"].ToString();
            TextBox_return_Book_author.Text = dr["Book_author"].ToString();
            TextBox_return_Book_Press.Text = dr["Book_Press"].ToString();
            TextBox_return_Book_Case.Text = dr["Book_Case"].ToString();
            TextBox_return_Book_Borrowing.Text = dr["Book_Borrowing"].ToString();
            TextBox_return_User_Id.Text = dr["User_Name"].ToString();
            TextBox_return_User_Day.Text = dr["Borrowing_Time"].ToString();
            TextBox_return_User_Name.Text = dr["User_Nickname"].ToString();
            TextBox_return_User_Tel.Text = dr["User_Tel"].ToString();
            TextBox_return_User_Address.Text = dr["User_Address"].ToString();
            TextBox_Return_Time.Text = dr["Return_Time"].ToString();
        }
        else
        {
            Response.Write("<script>alert('数据库中无匹配借阅信息');</script>");
        }
        con.Close();
    }
    protected void Button_return_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "update Web_Borrowing set Return_Time=@Return_Time where Borrowing_Book_Id=@Borrowing_Book_Id and Borrowing_User_Name=@Borrowing_User_Name";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Borrowing_User_Name", TextBox_return_User_Id.Text.Trim());
        com.Parameters.AddWithValue("Borrowing_Book_Id", TextBox_return_Book_Id.Text.Trim());
        com.Parameters.AddWithValue("Return_Time", DateTime.Now.ToLocalTime().ToString());
        if (com.ExecuteNonQuery() > 0)
        {

            Response.Write("<script>alert('归还成功');</script>");
            TextBox_return_Book_Name.Text = "";
            TextBox_return_Book_Class.Text = "";
            TextBox_return_Book_author.Text = "";
            TextBox_return_Book_Press.Text = "";
            TextBox_return_Book_Case.Text = "";
            TextBox_return_Book_Borrowing.Text = "";
            TextBox_return_User_Id.Text = "";
            TextBox_return_User_Day.Text = "";
            TextBox_return_User_Name.Text = "";
            TextBox_return_User_Tel.Text = "";
            TextBox_return_User_Address.Text = "";
            TextBox_Return_Time.Text = "";
        }
        else
        {
            Response.Write("<script>alert('归还失败');</script>");
        }
        con.Close();
    }
    protected void Button_Statistics_Click(object sender, EventArgs e)
    {
        SqlDataSource5.SelectCommand = "select Borrowing_Book_Id,Book_Name,Class_Name,Book_author,Book_Press,Book_Case,Book_Borrowing,User_Name,Borrowing_Time,User_Nickname,User_Tel,User_Address,Return_Time from Web_Borrowing,Web_Book,Web_Book_class,Web_User where Web_Borrowing.Borrowing_Book_Id=Web_Book.Book_Id and Web_User.User_Name=Web_Borrowing.Borrowing_User_Name and Web_Book.Book_Class_Id=Web_Book_class.Class_Id and Return_Time is null";
    }
    protected void Button_Statistics_all_Click(object sender, EventArgs e)
    {
        SqlDataSource4.SelectCommand = "select Borrowing_Book_Id,Book_Name,Class_Name,Book_author,Book_Press,Book_Case,Book_Borrowing,User_Name,Borrowing_Time,User_Nickname,User_Tel,User_Address,Return_Time from Web_Borrowing,Web_Book,Web_Book_class,Web_User where Web_Borrowing.Borrowing_Book_Id=Web_Book.Book_Id and Web_User.User_Name=Web_Borrowing.Borrowing_User_Name and Web_Book.Book_Class_Id=Web_Book_class.Class_Id";
        SqlDataSource3.SelectCommand = "SELECT * FROM Web_Book,Web_Book_class where Web_Book.Book_Class_id=Web_Book_class.Class_Id";
        SqlDataSource2.SelectCommand = "SELECT * FROM Web_Book_class";
        SqlDataSource1.SelectCommand = "SELECT * FROM Web_User";
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Main.aspx");
    }
    protected void Button_Add_User_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "select * from Web_User where User_Name=@Addname";
        com.Parameters.AddWithValue("Addname", TextBox_Add_Name.Text.Trim());
        com.CommandText = Tsql;
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            Response.Write("<script>alert('数据库中已存在该用户名');</script>");
        }
        else
        {
            con.Close();
            con.Open();
            Tsql = "insert into Web_User values(@AdduserName,@AdduserPassword,@AdduserRow,@AdduserNicknam,@AdduserTel,@AdduserAddress,@AdduserSex)";
            com.Parameters.AddWithValue("AdduserName", TextBox_Add_Name.Text.Trim());
            com.Parameters.AddWithValue("AdduserPassword", TextBox_Add_password.Text.Trim());
            com.Parameters.AddWithValue("AdduserNicknam", TextBox_name_Add.Text.Trim());
            string row = "3";
            if (DropDownList_row.Text.Trim().Equals("超级管理员"))
            {
                row = "1";
            }
            else if (DropDownList_row.Text.Trim().Equals("管理员"))
            {
                row = "2";
            }
            {
            }
            com.Parameters.AddWithValue("AdduserRow", row);
            com.Parameters.AddWithValue("AdduserTel", TextBox_Add_Tel.Text.Trim());
            com.Parameters.AddWithValue("AdduserAddress", TextBox_Address.Text.Trim());
            com.CommandText = Tsql;
            string Sex="0";
            if (DropDownLis_Sex.Text.Trim().Equals("男"))
            {
                Sex = "1";
            }
            com.Parameters.AddWithValue("AdduserSex", Sex);
            if (com.ExecuteNonQuery()>0)
            {
                Response.Write("<script>alert('添加成功');</script>");
                SqlDataSource1.SelectCommand = "SELECT  * FROM Web_User";
            }
            else
            {
                Response.Write("<script>alert('添加失败');</script>");
            }
            
        }
        con.Close();
    }
    protected void Button_Yes_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "insert into Web_Book_class values(@Class_Id,@Class_Name)";
        com.Parameters.AddWithValue("Class_Id", TextBox_Class_Id.Text.Trim());
        com.Parameters.AddWithValue("Class_Name", TextBox_Class_Name.Text.Trim());
        com.CommandText = Tsql;
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('添加成功');</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败');</script>");
        }
        SqlDataSource2.SelectCommand = "SELECT  * FROM Web_User";
    }
}