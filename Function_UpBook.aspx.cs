using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class css_Function_Delete : System.Web.UI.Page
{
    string Login;
    string Action;
    string value;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Login = Session["User_Name"].ToString();
            value=Request.QueryString["value"].ToString();
            TextBox_Book_Id.Text = value;
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
        string Tsql = "update Web_Book set Book_Name=@Book_Name,Book_Class_Id=@Book_Class_Id,Book_author=@Book_author,Book_Press=@Book_Press,Book_Stock=@Book_Stock,Book_Case=@Book_Case where Book_Id=@Book_Id";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Book_Id", value);
        com.Parameters.AddWithValue("Book_Name", TextBox_Book_Name.Text.Trim());
        com.Parameters.AddWithValue("Book_Class_Id", TextBox_Book_Class_Id.Text.Trim());
        com.Parameters.AddWithValue("Book_author", TextBox_Book_author.Text.Trim());
        com.Parameters.AddWithValue("Book_Press", TextBox_Book_Press.Text.Trim());
        com.Parameters.AddWithValue("Book_Stock", TextBox_Book_Stock.Text.Trim());
        com.Parameters.AddWithValue("Book_Case", TextBox_Book_Case.Text.Trim());
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('修改成功');</script>");
        }
        else
        {
            Response.Write("<script>alert('修改失败');</script>");
        }
        con.Close();
        Response.Write("<script>window.location.href=\"Main.aspx\";</script>");
    }
    protected void Button_No_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
    }
}