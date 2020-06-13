using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HomePage : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    String page;
    String key = "";
    String strKey = "";
    int intpage;
    int item;

    protected void Page_Load(object sender, EventArgs e)   //分页操作
    {
        if (Request.QueryString["se"]=="0") {
            Session["userid"] = null;
        }

        if (Request.QueryString["key"]!=null && !Request.QueryString["key"].Equals("")) {
            key = Request.QueryString["key"];
        }

        page = Request.QueryString["page"];
        if (page == null) page = "0";
        intpage = Int32.Parse(page);
        pagenum.Text = "第" + (intpage + 1) + "页";

        int size = 8;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        try
        {
            if (key != null && !key.Equals(""))
            {
                strKey = "and (userid like '%" + key + "%' or notetitle like '%" + key + "%')";
            }
            String strKey2 = "";
            if (strKey != null && !strKey.Equals("")) {
                strKey2 = " where" + strKey.Substring(4);
            }
            SqlCommand cmd = new SqlCommand("select count(*) from notes" + strKey2, con);
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

            String cmdstr = "select Top 8 *,(select count([comid]) from [comment],[notes] where [notes].[noteid]=[comment].[noteid] and [comment].[noteid]=[tbnotes].[noteid]) AS [comnum] " +
                "from notes as [tbnotes] where noteid not in (select top " + index + " noteid from notes order by notedate desc) " + strKey + " ORDER BY notedate desc";
            SqlDataSource1.SelectCommand = cmdstr;
        
        }
        catch { }
        finally { con.Close(); }
    }

    protected void Returnclick(object sender, EventArgs e)
    {
        intpage--;
        Response.Redirect("HomePage.aspx?page="+intpage + "&key=" + key);
    }

    protected void Shouyeclick(object sender, EventArgs e)
    {
        Response.Redirect("Homepage.aspx?page=0" + "&key=" + key);
    }
    protected void Nextclick(object sender, EventArgs e)
    {
        intpage++;
        Response.Redirect("HomePage.aspx?page=" + intpage + "&key=" + key);
    }

}