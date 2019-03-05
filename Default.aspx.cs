using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton_login_Click(object sender, ImageClickEventArgs e)
    {
        if (!TextBox_name.Equals("") && !TextBox_password.Equals(""))
        {
            SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            string Tsql = "select User_Name from Web_User where User_Name=@name and User_Password=@password";
            com.CommandText = Tsql;
            com.Parameters.AddWithValue("name", TextBox_name.Text.Trim());
            com.Parameters.AddWithValue("password", TextBox_password.Text.Trim());
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                Session["User_Name"] = dr["User_Name"].ToString();
                Response.Redirect("Main.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败！ 1.用户名不存在 2.用户密码错误');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('用户名或密码不能为空！');</script>");
        }
    }
}