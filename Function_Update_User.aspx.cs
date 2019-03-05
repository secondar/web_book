using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Function_Update : System.Web.UI.Page
{
    string Login;
    string value;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Login = Session["User_Name"].ToString();
            value = Request.QueryString["User_Id"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            string Tsql = "select * from Web_User where User_Id=@name";
            com.CommandText = Tsql;
            com.Parameters.AddWithValue("name", value);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                Add_Name.Text = dr["User_Name"].ToString();
                name_Add.Text = dr["User_Nickname"].ToString();
                if (dr["User_Sex"].ToString().Equals("1"))
                {
                    Sex.Text = "男";
                }
                else
                {
                    Sex.Text = "女";
                }
                Add_password.Text = dr["User_Password"].ToString();
                Add_Tel.Text = dr["User_Tel"].ToString();
                if (dr["User_Row"].ToString().Equals("1"))
                {
                    row.Text = "超级管理员";
                }
                else if (dr["User_Row"].ToString().Equals("2"))
                {
                    row.Text = "管理员";
                }
                else if (dr["User_Row"].ToString().Equals("3"))
                {
                    row.Text = "员工";
                }
                
                Address.Text = dr["User_Address"].ToString();			
            }
            else
            {
                Response.Redirect("Main.aspx");
            }
            con.Close();
        }
        catch
        {
            Response.Redirect("Main.aspx");
        }
       
    }
    protected void Button_Yes_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connectionstring"].ToString());
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        string Tsql;
        Tsql = "update Web_User set User_Password=@AdduserPassword,User_Row=@AdduserRow,User_Nickname=@AdduserNicknam,User_Tel=@AdduserTel,User_Address=@AdduserAddress,User_Sex=@AdduserSex where User_Name=@AdduserName";
        com.Parameters.AddWithValue("AdduserName", Add_Name.Text.Trim());
        com.Parameters.AddWithValue("AdduserPassword", Add_password.Text.Trim());
        com.Parameters.AddWithValue("AdduserNicknam", name_Add.Text.Trim());
        com.CommandText = Tsql;
        string row1 = "3";
        if (row.Text.Trim().Equals("超级管理员"))
        {
            row1 = "1";
        }
        else if (row.Text.Trim().Equals("管理员"))
        {
            row1 = "2";
        }
        {
        }
        com.Parameters.AddWithValue("AdduserRow", row1);
        com.Parameters.AddWithValue("AdduserTel", Add_Tel.Text.Trim());
        com.Parameters.AddWithValue("AdduserAddress", Address.Text.Trim());
        com.CommandText = Tsql;
        string Sex1 = "0";
        if (Sex.Text.Trim().Equals("男"))
        {
            Sex1 = "1";
        }
        com.Parameters.AddWithValue("AdduserSex", Sex1);
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