using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome_PersonalCenter : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    private String userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null || Session["userid"].ToString() == "") { userid = null; }
        else userid = Session["userid"].ToString();
        SqlDataSource1.SelectCommand = "SELECT *,(select userheader from users where userid=table1.attent) as attentheader FROM attention as table1 where userid='" + userid +"'";
        SqlDataSource2.SelectCommand = "select *,(select count([comid]) from [comment],[notes] where [notes].[noteid]=[comment].[noteid] and [comment].[noteid]=[tbnotes].[noteid]) AS [comnum] from notes as [tbnotes] order by getlike desc";
        SqlDataSource3.SelectCommand = "SELECT * from users order by getlike desc";
    }
    
    protected void attentbut_Command(object sender, CommandEventArgs e)
    {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string userid = commandArgs[0]; //传递参数1
            string attent = commandArgs[1];//传递参数2
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        try
        {
            SqlCommand cmd = new SqlCommand("delete from attention where userid='" + userid + "' and attent='" + attent + "'", con);

            if (cmd.ExecuteNonQuery() >= 0)
            {
                Response.Write("<script type='text/javascript'>alert('取关成功！');window.location.href='PersonalCenter.aspx';</script>");
            }
        }
        catch { }
        finally { con.Close(); }
    }
}