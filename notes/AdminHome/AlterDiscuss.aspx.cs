using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_AlterDiscuss : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    String id;
    String userid, commenttext, getlike,compageid;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        userid = comname.Text;
        commenttext = comcontext.Text;
        getlike = comgetlike.Text;
        compageid = compage.Text;
        if (id != null)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select [comment].[userid],[userheader],[commenttext],[comment].[getlike],[notes].[noteid] from [users],[comment],[notes] where [notes].[noteid]=[comment].[noteid] and [users].[userid]=[comment].[userid] and [comid]='" + id +"'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    comname.Text = reader[0].ToString();
                    userimage.Src = "../" + reader[1].ToString().Substring(2);
                    comcontext.Text = reader[2].ToString();
                    comname.Enabled = false;
                    comgetlike.Text = reader[3].ToString();
                    compage.Text = reader[4].ToString();
                    compage.Enabled = false;

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
        /*
        if (id != null) {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select [userid] from [comment] where [comid]=" + id , con);
                comname.Text = cmd.ExecuteScalar().ToString();
            }
            catch { }
            finally
            {
                con.Close();
            }
        }*/
        comcontext.Text = "";
        comgetlike.Text = "";
    }

    protected void post_Click(object sender, EventArgs e)
    {
        Boolean boo1 = (!comname.Text.Equals(""));
        Boolean boo2 = (!comcontext.Text.Equals(""));
        Boolean boo3 = (!comgetlike.Text.Equals(""));
        Boolean boo4 = (!compage.Text.Equals(""));
        if (boo1 && boo2 && boo3 && boo4)               
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("insert into [comment] ([userid],[commenttext],[getlike],[noteid]) values ('" + userid + "','" + commenttext + "'," + getlike + "," + compageid + ")", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script type='text/javascript'>alert('发送成功');window.location.href='Discuss.aspx';</script>");
            }
            catch { }
            finally
            {
                con.Close();
            }

        }
        else Response.Write("<script type='text/javascript'>alert('文本框不能为空');window.location.href='AlterDiscuss.aspx';</script>");
    }

    protected void alter_Click(object sender, EventArgs e)
    {
        Boolean boo1 = (!comname.Text.Equals(""));
        Boolean boo2 = (!comcontext.Text.Equals(""));
        Boolean boo3 = (!comgetlike.Text.Equals(""));
        Boolean boo4 = (!compage.Text.Equals(""));
        if (boo1 && boo2 && boo3 && boo4)
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("update comment set userid='" + userid + "',commenttext='" + commenttext + "',getlike=" + getlike + ",noteid=" + compageid + " where comid=" + id, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script type='text/javascript'>alert('修改成功');window.location.href='Discuss.aspx';</script>");
                }
            }
            catch { }
            finally
            {
                con.Close();
            }

        }
        else Response.Write("<script type='text/javascript'>alert('文本框不能为空');window.location.href='AlterDiscuss.aspx?" + id + "';</script>");
    }

    protected void delete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("delete from comment where comid=" + id, con);
            if (cmd.ExecuteNonQuery() > 0)
            {
                Response.Write("<script type='text/javascript'>alert('删除成功');window.location.href='Discuss.aspx';</script>");
            }
        }
        catch { }
        finally
        {
            con.Close();
        }
    }
}