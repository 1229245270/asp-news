using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Top : System.Web.UI.MasterPage
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Name.Text = "未登录";
        }

        else { Name.Text = Session["userid"].ToString(); }
        if (Name.Text.Length > 5)
        {
            Name.Text = Name.Text.Substring(0, 5) + "...";

        }
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select [userheader] from [users] where [userid]='" + Session["userid"].ToString() + "'", con);
                userimage.Src = cmd.ExecuteScalar().ToString();

            }
            catch { }
            finally { con.Close(); }
        
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String strSearch = "";
        if (!search.Equals("")) {
            strSearch = "?key=" + search.Text;
        }
        Response.Write("<script type='text/javascript'>window.location.href='" + Page.ResolveClientUrl("~/UserHome/HomePage.aspx" + strSearch ) + "';</script>");
    }
}
