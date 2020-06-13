using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome_Default : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    private String userid, liker,noteid;
    protected void Page_Load(object sender, EventArgs e)
    {
        liker = Request.QueryString["liker"];
        noteid = Request.QueryString["noteid"];

        if (Request.QueryString["userid"] != null && Request.QueryString["userid"]!= "")
        {
            userid = Request.QueryString["userid"];

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select * from userslike where userid='" + userid + "' and liker='" + liker + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    if (noteid != null && noteid != "") liker = noteid;
                    Response.Write("<script type='text/javascript'>alert('你已经点过赞了');window.location.href='Article.aspx?id=" + liker + "';</script>");
                }
                else
                {
                    con.Close();
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into userslike values ('" + userid + "','" + liker + "')", con);
                    if (cmd2.ExecuteNonQuery() >= 0)
                    {

                        con.Close();
                        con.Open();
                        if (liker.IndexOf("c") != -1)
                        {
                            SqlCommand cmd3 = new SqlCommand("update comment set getlike+=1 where comid=" + liker.Substring(1), con);
                            cmd3.ExecuteNonQuery();
                            Response.Write("<script type='text/javascript'>alert('点赞成功');window.location.href='Article.aspx?id=" + noteid + "';</script>");
                        }
                        else
                        {
                            SqlCommand cmd3 = new SqlCommand("update notes set getlike+=1 where noteid=" + liker, con);
                            cmd3.ExecuteNonQuery();
                            Response.Write("<script type='text/javascript'>alert('点赞成功');window.location.href='Article.aspx?id=" + liker + "';</script>");
                        }

                    }
                }
            }
            catch{  }
            finally { }
        }
        else
        {
            if (noteid != null && noteid != "") liker = noteid;
            Response.Write("<script type='text/javascript'>alert('请先登录后再点赞');window.location.href='Article.aspx?id=" + liker + "';</script>");
        }

    }
}