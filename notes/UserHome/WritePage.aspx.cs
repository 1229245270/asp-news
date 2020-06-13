using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome_WritePage : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    String id;
    String notetitle, userid, noteintro, notecontent;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null || Session["userid"].ToString() == "")
        {
            Response.Write("<script type='text/javascript'>alert('请先进行登录');window.location.href='HomePage.aspx';</script>");
        }
        else {
            id = Session["userid"].ToString();
            textwriter.Text = id;
        }
        notetitle = texttitle.Text;
        userid = textwriter.Text;
        noteintro = textintro.Text;
        notecontent = textcontent.Text;


    }

    protected void reset_Click(object sender, EventArgs e)
    {
        texttitle.Text = "";
        textwriter.Text = "";
        textintro.Text = "";
        textcontent.Text = "";
    }

    protected void post_Click(object sender, EventArgs e)
    {
        Boolean boo1 = (!texttitle.Text.Equals(""));
        Boolean boo2 = (!textwriter.Text.Equals(""));
        Boolean boo3 = (!textintro.Text.Equals(""));
        Boolean boo4 = (!textcontent.Text.Equals(""));
        if (boo1 && boo2 && boo3 && boo4)               //判断注册条件
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("insert into [notes] ([notetitle],[userid],[noteintro],[notecontent]) values ('" + notetitle + "','" + userid + "','" + noteintro + "','" + notecontent + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script type='text/javascript'>alert('发布成功');window.location.href='HomePage.aspx';</script>");
            }
            catch { }
            finally
            {
                con.Close();
            }

        }
        else Response.Write("<script type='text/javascript'>alert('文本框不能为空');window.location.href='WritePage.aspx';</script>");
    }
    
}