using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Function_Update_Class : System.Web.UI.Page
{
    string value;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            string Login = Session["User_Name"].ToString();
            value = Request.QueryString["value"].ToString();
            TextBox_Class_Id.Text = value;
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
        string Tsql;
        Tsql = "update Web_Book_class set Class_Name=@Name where Class_Id=@Id";
        com.Parameters.AddWithValue("Name", TextBox_Class_Name.Text.Trim());
        com.Parameters.AddWithValue("Id", value);
        com.CommandText = Tsql;
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