using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_meetingListByMonth : System.Web.UI.Page
{
    public User user;

    protected void Page_Load(object sender, EventArgs e)
    {

        user = (User)Session["user"];
    }
}