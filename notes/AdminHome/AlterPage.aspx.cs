using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_AlterPage : System.Web.UI.Page
{

    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        String id = Request.QueryString["id"];
        String cmdstr = "select [tablenote].[noteid],[tablenote].[userid],[notetitle],[notecontent],[notedate],[tablenote].[getlike] as [notelike],[users].[getlike] as [userlike],(select count([noteid]) from [notes] where [userid]=[tablenote].[userid]) AS [pagenum],(select COUNT([comid]) from [comment],[notes] where [notes].[noteid]=[comment].[noteid]) as [comnum],(select sum([getlike]) from [notes] where [userid]= (select [userid] from [notes] where [noteid]='" + id + "')) as [likenum] from [notes] as [tablenote],[users] where [tablenote].[userid]=[users].[userid] and [tablenote].[noteid]=" + id;
        SqlDataSource1.SelectCommand = cmdstr;

        String cmdstr2 = "select *,Row_NUMBER() OVER (ORDER BY [comment].[comid] ASC) AS [row] from [comment] where [noteid]=" + id + " order by [getlike] desc";
        SqlDataSource2.SelectCommand = cmdstr2;

        SqlConnection con = new SqlConnection(constr);
        con.Open();

        try
        {
            SqlCommand cmd = new SqlCommand("select count(comid) from comment where noteid=" + id, con);
            var number = cmd.ExecuteScalar().ToString();
            if (number == null) number = "0";
            comnum.InnerText = number + "条评论";
        }
        catch { }
        finally { con.Close(); }

    }
}