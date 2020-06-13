using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_DeleteDiscuss : System.Web.UI.Page
{
    private static String constr = System.Configuration.ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    String id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
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
        finally { con.Close(); }
    }
}