using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void denglu_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        try { 
            SqlCommand cmd = new SqlCommand("select * from [users] where [userid]='" + userid.Text +"'", con);
            SqlDataReader sqldr = cmd.ExecuteReader();
            Boolean boo_code = Convert.ToString(Session["code"]).Equals(codecontent.Text);       //判断验证码

            if (boo_code)
            {
                if (sqldr.Read())
                {
                    if (userpwd.Text.Equals(sqldr[1]))
                    {
                        Session["userid"] = userid.Text;
                        if (Session["userid"].Equals("admin"))
                        {
                            Response.Write("<script type='text/javascript'>alert('进入管理员页面！');window.location.href='AdminHome/Page.aspx';</script>");
                        }
                        else {
                            Response.Write("<script type='text/javascript'>alert('登录成功！');window.location.href='UserHome/HomePage.aspx';</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script type='text/javascript'>alert('账号或密码错误');window.location.href='Login.aspx';</script>");
                    }
                    sqldr.Close();
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('账号不存在！');window.location.href='Login.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('验证码不正确！');window.location.href='Login.aspx';</script>");
            }
        }
        catch { }
        finally { con.Close(); }
        
    }
}