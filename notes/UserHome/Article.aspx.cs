using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Article : System.Web.UI.Page
{
    String id;
    String userid;
    String strUserid = "";
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            userid = Session["userid"].ToString();
            strUserid = " where userid = '" + userid + "'";
        }
        if (Request.QueryString["id"] != null)
        {
            id = Request.QueryString["id"];
        }
        else {
            id = "1";
        }
        String cmdstr = "select [userheader],[tablenote].[noteid],[tablenote].[userid],[notetitle],[notecontent],[notedate],[tablenote].[getlike] as [notelike],[users].[getlike] as [userlike],(select count([noteid]) from [notes] where [userid]=[tablenote].[userid]) AS [pagenum],(select COUNT([comid]) from [comment],[notes] where [notes].[noteid]=[comment].[noteid]) as [comnum],(select sum([getlike]) from [notes] where [userid]= (select [userid] from [notes] where [noteid]='" + id + "')) as [likenum] from [notes] as [tablenote],[users] where [tablenote].[userid]=[users].[userid] and [tablenote].[noteid]=" + id;
        SqlDataSource1.SelectCommand = cmdstr;

        String cmdstr2 = "select *,Row_NUMBER() OVER (ORDER BY [comment].[comid] ASC) AS [row] from [comment] where [noteid]=" + id + " order by [getlike] desc";
        SqlDataSource2.SelectCommand = cmdstr2;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        try {
            SqlCommand cmd = new SqlCommand("select count(comid) from comment where noteid=" + id, con);
            var number=cmd.ExecuteScalar().ToString();
            if (number == null) number = "0";
            comnum.InnerText = number + "条评论";
            con.Close();
            
            con.Open();

            SqlCommand cmd2 = new SqlCommand("select userheader from users" + strUserid,con);
            var thisUser = cmd2.ExecuteScalar().ToString();
            if (thisUser != null) {
                Image1.ImageUrl =  thisUser;
            }
        }
        catch { }
        finally { con.Close(); }

    }

    protected void comsend_Click(object sender, EventArgs e)
    {
        if (comtext.Text != "" && comtext.Text != null)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("insert into comment (userid,noteid,commenttext) values ('" + userid + "'," + id + ",'" + comtext.Text + "')", con);
                if (cmd.ExecuteNonQuery() >= 0)
                {
                    Response.Write("<script type='text/javascript'>alert('发送成功！');window.location.href='Article.aspx?id=" + id + "';</script>");
                }
            }
            catch { }
            finally { con.Close(); }
        }
        else {
            Response.Write("<script type='text/javascript'>alert('请填写评论！');window.location.href='Article.aspx?id=" + id + "';</script>");
        }
    }
        
}