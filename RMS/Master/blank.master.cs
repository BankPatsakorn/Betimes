using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_blank : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        //if (Session["user"] == null)
        //{
        //    string ReqUrl = Request.Url.AbsoluteUri;
        //    Session["request_page"] = ReqUrl;
        //    Response.Redirect("../authentication.aspx");
        //}
    }
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

}
