using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_User : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["notesConnectionString"].ConnectionString;

    public static String fileid;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataKey key = GridView1.DataKeys[e.RowIndex];
        fileid = key[0].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        try
        {
         
            SqlCommand cmd = new SqlCommand("delete from users where userid='" + fileid +"'", con);
            if (cmd.ExecuteNonQuery() > 0)
            {
                SqlCommand cmd2 = new SqlCommand("delete from notes where userid ='" + fileid + "'", con);
                SqlCommand cmd3 = new SqlCommand("delete from comment where userid ='" + fileid + "'",con);

                if (cmd2.ExecuteNonQuery() >=0 && cmd3.ExecuteNonQuery() >= 0) {
                    Response.Write("<script type='text/javascript'>alert('删除成功');</script>");
                }
            }
            
        }
        catch { }
        finally
        {
            con.Close();
        }
    }

}