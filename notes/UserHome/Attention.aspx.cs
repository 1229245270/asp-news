using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome_Attention : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;
    private String userid = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        String attent = Request.QueryString["attent"];
        if(Session["userid"] != null && Session["userid"].ToString() != "")
            userid = Session["userid"].ToString();
        if (attent != "" && attent != null && userid != "" && userid != null)
        {
            
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select userid,attent from attention where userid='" + userid + "' and attent='" + attent + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Close();
                    Response.Write("<script type='text/javascript'>alert('你已经关注了！');history.back();</script>");
                }
                else
                {
                    reader.Close();
                    con.Close();
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into attention (userid,attent) values ('" + userid + "','" + attent + "')", con);
                    if (cmd2.ExecuteNonQuery() >= 0)
                    {
                        Response.Write("<script type='text/javascript'>alert('关注成功！');history.back();</script>");
                    }
                }
            }
            catch { }
            finally { con.Close(); }
            
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('请先登录！');history.back();</script>");
        }
    }
}