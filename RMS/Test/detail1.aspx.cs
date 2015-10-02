using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_detail1 : System.Web.UI.Page
{
    protected void Page_init(object sender, EventArgs e)
    {

        SqlDataSource1.SelectParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, "2");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            ProvinceForm.ChangeMode(DetailsViewMode.ReadOnly);
        
    }

    protected void OnDataBound(object sender, EventArgs e)
    {
        DetailsView detailsView = (DetailsView)sender;
        if (detailsView.Rows.Count == 0)
            detailsView.ChangeMode(DetailsViewMode.Insert);
    }


}