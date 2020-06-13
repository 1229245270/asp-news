using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome_Discuss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String cmdstr = "select *,Row_NUMBER() OVER (ORDER BY [comment].[comid] ASC) AS [row] from [comment],[users] where [comment].[userid]=[users].[userid] order by [commentdate] desc";
        SqlDataSource1.SelectCommand = cmdstr;
    }
}