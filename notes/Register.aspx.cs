using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void zhuce_Click(object sender, EventArgs e)
    {
        Boolean boo1 = (userid.Text.Length > 2 && userid.Text.IndexOf(" ") < 0);        //判断账号规范
        Boolean boo2_1 = (userpwd.Text.Length >= 6 && userpwd.Text.IndexOf(" ") < 0);
        Regex re1 = new Regex(@"[\d]");
        Regex re2 = new Regex("[a - zA - Z]");
        Regex re3 = new Regex(@"[-=; ',./\[]");
        Boolean boo2_2 = (re1.IsMatch(userpwd.Text));
        Boolean boo2_3 = (re2.IsMatch(userpwd.Text));
        Boolean boo2_4 = (re3.IsMatch(userpwd.Text));
        Boolean boo2 = (boo2_1 && ((boo2_2 && boo2_3) || (boo2_2 && boo2_4) || (boo2_3 && boo2_4)));       //判断密码规范 
        Boolean boo3 = userpwd.Text.Equals(userangin.Text);     //判断二次密码
        Boolean boo_code = Convert.ToString(Session["code"]).Equals(codecontent.Text);       //判断验证码

        Boolean boo_result = (boo1 && boo2 && boo3);
        if (boo_result)
        {
            if (boo_code)               //判断注册条件
            {
                /*public static string connectionstring = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionstring);
                Using(con){
                    con.Open();
                }
                */
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand("select * from [users] where [userid]='" + userid.Text + "'", con);
                    SqlDataReader sqldr = cmd.ExecuteReader();

                    if (!sqldr.HasRows)
                    {
                        sqldr.Close();
                        cmd.CommandText = "insert into [users] ([userid],[userpwd]) values ('" + userid.Text + "','" + userpwd.Text + "')";
                        cmd.ExecuteNonQuery();
                        /*
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            //Response.Write("<script type='text/javascript'>alert('插入成功！');</script>");
                        }
                        else Response.Write("<script type='text/javascript'>alert('插入失败！');</script>");
                        */
                        sqldr.Close();
                        cmd.CommandText = "select [userid] from [users] where [userid]='" + userid.Text + "'";
                        SqlDataReader sqldr2 = cmd.ExecuteReader();
                        if (sqldr2.HasRows)
                        {
                            if (sqldr2.Read())
                            {
                                Session["userid"] = sqldr2[0].ToString();
                            }
                            sqldr2.Close();
                            Response.Write("<script type='text/javascript'>alert('注册成功！');window.location.href='UserHome/HomePage.aspx';</script>");
                        }
                        else Response.Write("<script type='text/javascript'>alert('注册失败！');window.location.href='Register.aspx';</script>");
                    }
                    else Response.Write("<script type='text/javascript'>alert('账号已被注册！');window.location.href='Register.aspx';</script>");
                }
                catch { }
                finally
                {
                    con.Close();
                }

            }
            else Response.Write("<script type='text/javascript'>alert('验证码错误！');window.location.href='Register.aspx';</script>");
        }
    }
}