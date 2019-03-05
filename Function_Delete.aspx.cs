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
            Action=Request.QueryString["Action"].ToString();
            if (Action.Equals("User_Delete"))
            {
                Label1.Text = "即将进行用户删除,删除用户ID:\t:" + value;
            }
            else if (Action.Equals("Class_Delete"))
            {
                Label1.Text = "即将进行图书类别删除,删除图书类别ID:\t:" + value;
            }
            else if (Action.Equals("Book_Delete"))
            {
                Label1.Text = "即将进行图书删除,删除图书ID:\t:" + value;
            }
        }
        catch
        {
            Response.Redirect("Main.aspx");
        }
    }
    protected void Button_yes_Click(object sender, EventArgs e)
    {
        if (Action.Equals("User_Delete"))
        {
            Delete_user();
        }
        else if (Action.Equals("Class_Delete"))
        {
            Class_Delete();
        }
        else if (Action.Equals("Book_Delete"))
        {
            Book_Delete();
        }
    }
    protected void Button_No_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
    }
    private void Book_Delete()
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "delete Web_Book where Book_Id=Book_Id";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Book_Id", value);
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('删除成功');</script>");
        }
        else
        {
            Response.Write("<script>alert('删除失败');</script>");
        }
        con.Close();
        Response.Write("<script>window.location.href=\"Main.aspx\";</script>");
    }
    private void Class_Delete()
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "delete Web_Book_class where Class_Id=@Class_Id";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("Class_Id", value);
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('删除成功');</script>");
        }
        else
        {
            Response.Write("<script>alert('删除失败');</script>");
        }
        con.Close();
        Response.Write("<script>window.location.href=\"Main.aspx\";</script>");
    }
    private void Delete_user()
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql = "delete Web_User where User_Id=@User_Id";
        com.CommandText = Tsql;
        com.Parameters.AddWithValue("User_Id", value);
        if (com.ExecuteNonQuery() > 0)
        {
            Response.Write("<script>alert('删除用户成功');</script>");
        }
        else
        {
            Response.Write("<script>alert('删除用户失败');</script>");
        }
        con.Close();
        Response.Write("<script>window.location.href=\"Main.aspx\";</script>");
    }
}