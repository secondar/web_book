using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Function_Addbook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Login;
        try
        {
            Login = Session["User_Name"].ToString();
        }
        catch
        {
            Response.Redirect("Main.aspx");
        }
    }
    protected void Button_yes_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "insert into Web_Book values(@Book_Id,@Book_Name,@Book_Class_Id,@Book_author,@Book_Press,@Book_Press,@Book_Stock,@Book_Case,'0')";
        com.Parameters.AddWithValue("Book_Id", TextBox_Book_Id.Text.Trim());
        com.Parameters.AddWithValue("Book_Name", TextBox_Book_Name.Text.Trim());
        com.Parameters.AddWithValue("Book_Class_Id", TextBox_Book_Class_Id.Text.Trim());
        com.Parameters.AddWithValue("Book_author", TextBox_Book_author.Text.Trim());
        com.Parameters.AddWithValue("Book_Press", TextBox_Book_Press.Text.Trim());
        com.Parameters.AddWithValue("Book_Stock", TextBox_Book_Stock.Text.Trim());
        com.Parameters.AddWithValue("Book_Case", TextBox_Book_Case.Text.Trim());
        
            Response.Write("<script>alert('添加成功');</script>");
        Response.Redirect("Main.aspx");
        
    }
    protected void Button_No_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
    }
}