using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_Page : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    String page;
    int intpage;
    int item;

    protected void Page_Load(object sender, EventArgs e)   //分页操作
    {
        page = Request.QueryString["page"];
        if (page == null) page = "0";
        intpage = Int32.Parse(page);
        pagenum.Text = "第" + (intpage + 1) + "页";

        int size = 8;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select count(*) from notes", con);
            item = Int32.Parse(cmd.ExecuteScalar().ToString());
            returnbut.Visible = true;
            nextbut.Visible = true;
            if (intpage == 0)
            {
                returnbut.Visible = false;
            }
            if (intpage == (item / size))
            {
                nextbut.Visible = false;
            }
            int index = size * intpage;
            
            String cmdstr = "select Top 8 *,(select count([comid]) from[comment],[notes] where[notes].[noteid]=[comment].[noteid] and[comment].[noteid]=[tbnotes].[noteid]) AS[comnum] " +
                "from notes as [tbnotes] where noteid not in (select top " + index + " noteid from notes order by notedate desc) ORDER BY notedate desc";
            SqlDataSource1.SelectCommand = cmdstr;

        }
        catch { }
        finally { con.Close(); }
    }

    protected void Returnclick(object sender, EventArgs e)
    {
        intpage--;
        Response.Redirect("Page.aspx?page=" + intpage);
    }

    protected void Shouyeclick(object sender, EventArgs e)
    {
        Response.Redirect("Page.aspx?page=0");
    }
    protected void Nextclick(object sender, EventArgs e)
    {
        intpage++;
        Response.Redirect("Page.aspx?page=" + intpage);
    }
    
}