
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_AddPage : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    String id;
    String notetitle, userid, noteintro, notecontent;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        notetitle = texttitle.Text;
        userid = textwriter.Text;
        noteintro = textintro.Text;
        notecontent = textcontent.Text;
        if (id != null)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select [notetitle],[userid],[noteintro],[notecontent],[notedate],[getlike] from [notes] where [noteid]=" + id, con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    texttitle.Text = reader[0].ToString();
                    textwriter.Text = reader[1].ToString();
                    textwriter.Enabled = false;
                    textintro.Text = reader[2].ToString();
                    textcontent.Text = reader[3].ToString();
                }
                reader.Close();
            }
            catch { }
            finally
            {
                con.Close();
            }
        }


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
                    SqlCommand cmd = new SqlCommand("insert into [notes] ([notetitle],[userid],[noteintro],[notecontent]) values ('" + notetitle + "','" + userid + "','" + noteintro + "','" + notecontent + "')",con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type='text/javascript'>alert('发布成功');window.location.href='Page.aspx';</script>");
                }
                catch { }
                finally
                {
                    con.Close();
                }

            }
            else Response.Write("<script type='text/javascript'>alert('文本框不能为空');window.location.href='AddPage.aspx';</script>");
    }

    protected void alter_Click(object sender, EventArgs e)
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
                SqlCommand cmd = new SqlCommand("update notes set notetitle='" + notetitle + "',userid='" + userid + "',noteintro='" + noteintro + "',notecontent='" + notecontent + "' where noteid=" + id, con);
                if (cmd.ExecuteNonQuery()>0) {
                    Response.Write("<script type='text/javascript'>alert('修改成功');window.location.href='Page.aspx';</script>");
                }
            }
            catch { }
            finally
            {
                con.Close();
            }

        }
        else Response.Write("<script type='text/javascript'>alert('文本框不能为空');window.location.href='AddPage.aspx?" + id + "';</script>");
    }
}