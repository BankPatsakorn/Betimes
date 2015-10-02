using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class COMMON_MASTER_PROVINCE_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateData();
        }
    }

    void PopulateData()
    {
        //
Title = "PROVINCE";
SqlDataSource1.SelectParameters.Add("REGION_ID", System.Data.DbType.Int32, "2");
//SqlDataSource1.SelectParameters["REGION_ID"].DefaultValue = "2";
//SqlDataSource1.SelectCommand = "select COMMON_MASTER_PROVINCE.PROVINCE_ID,COMMON_MASTER_REGION.REGION_ID,COMMON_MASTER_PROVINCE.PROVINCE_CODE,COMMON_MASTER_PROVINCE.PROVINCE_NAME,COMMON_MASTER_PROVINCE.UPDATE_DATE,COMMON_MASTER_REGION.REGION_NAME_THA from COMMON_MASTER_PROVINCE left join COMMON_MASTER_REGION on COMMON_MASTER_PROVINCE.REGION_ID = COMMON_MASTER_REGION.REGION_ID  where  1=1 and COMMON_MASTER_PROVINCE.REGION_ID = 2";
        
    }


}