using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_detail2 : System.Web.UI.Page
{
    string mode = "e";
    string id = "";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");

    protected void Page_init(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];

        SqlDataSource1.SelectParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, id);

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (id == "-1")
        {
            mode = "n";
        }
        else
        {
            mode = "e";
        }
        if (!IsPostBack)
        {
            if (mode == "e")
            {
                PopulateDataEdit();
            }
            else
            {
                PopulateDataNew();
            }
        }
    }

    void PopulateDataEdit()
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataRowView drv = dv[0];

        ctlPROVINCE_CODE.Value = drv["PROVINCE_CODE"].ToString();
        ctlPROVINCE_NAME.Value = drv["PROVINCE_NAME"].ToString();
        ctlREGION_ID.Value = drv["REGION_ID"].ToString();
        if(drv["IS_GOOD"] != DBNull.Value)
            ctlIS_GOOD.Checked = Convert.ToBoolean(drv["IS_GOOD"].ToString());
        if (drv["UPDATE_DATE"] != null && drv["UPDATE_DATE"] != DBNull.Value)
            ctlUPDATE_DATE.Date = (DateTime)drv["UPDATE_DATE"];
    }
    void PopulateDataNew()
    {

        ctlPROVINCE_CODE.Value = "";
        ctlPROVINCE_NAME.Value = "";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (mode == "e")
            Update();
        else if (mode == "n")
            Insert();

    }

    void Insert()
    {
        SqlDataSource1.InsertParameters.Clear();
        SqlDataSource1.InsertParameters.Add("PROVINCE_CODE", System.Data.DbType.String, ctlPROVINCE_CODE.Text);
        SqlDataSource1.InsertParameters.Add("PROVINCE_NAME", System.Data.DbType.String, ctlPROVINCE_NAME.Text);
        SqlDataSource1.InsertParameters.Add("REGION_ID", System.Data.DbType.Int32, ctlREGION_ID.Value.ToString());
        SqlDataSource1.InsertParameters.Add("UPDATE_DATE", System.Data.DbType.DateTime, ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        SqlDataSource1.InsertParameters.Add("IS_GOOD", System.Data.DbType.Boolean, ctlIS_GOOD.Checked.ToString());
        int i = SqlDataSource1.Insert();
    }
    void Update()
    {
        SqlDataSource1.UpdateParameters.Clear();
        SqlDataSource1.UpdateParameters.Add("PROVINCE_CODE", System.Data.DbType.String, ctlPROVINCE_CODE.Text);
        SqlDataSource1.UpdateParameters.Add("PROVINCE_NAME", System.Data.DbType.String, ctlPROVINCE_NAME.Text);
        SqlDataSource1.UpdateParameters.Add("REGION_ID", System.Data.DbType.Int32, ctlREGION_ID.Value.ToString());
        SqlDataSource1.UpdateParameters.Add("UPDATE_DATE", System.Data.DbType.String, ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture));
        SqlDataSource1.UpdateParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, id);
        SqlDataSource1.UpdateParameters.Add("IS_GOOD", System.Data.DbType.Boolean, ctlIS_GOOD.Checked.ToString());
        //Response.Write(ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture));
       int i = SqlDataSource1.Update();
    }
    void Delete()
    {
        SqlDataSource1.DeleteParameters.Clear();
        SqlDataSource1.DeleteParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, id);
        int i = SqlDataSource1.Delete();
    }


}