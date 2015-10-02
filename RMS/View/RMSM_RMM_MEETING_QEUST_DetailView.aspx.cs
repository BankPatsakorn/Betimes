using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_QEUST_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputMEETING_EQUIPMENT_ID="-1";
string inputMEETING_SERVICE_ID="-1";
string inputMEETING_MEMBER_ID="-1";
string inputAGENDA_SUB_ID="-1";
string inputAGENDA_SUB_DOC="-1";
string inputAGENDA_SUB_URL_ID="-1";
string inputAGENDA_DETAIL_DOC="-1";
string inputAGENDA_DETAIL_URL_ID="-1";
	string inputMainMEETING_ID="-1";
	string key="MEETING_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_RMM_MEETING_EQUIPMENT_ListView 
dsRMSM_RMM_MEETING_EQUIPMENT_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_EQUIPMENT_ID"] != null && Request.QueryString["MEETING_EQUIPMENT_ID"] != "-1")
        {
            inputMEETING_EQUIPMENT_ID = Request.QueryString["MEETING_EQUIPMENT_ID"];
        }
dsRMSM_RMM_MEETING_EQUIPMENT_ListView.SelectParameters.Add("MEETING_EQUIPMENT_ID", System.Data.DbType.Int32, inputMEETING_EQUIPMENT_ID);
//Grid RMSM_RMM_MEETING_SERVICE_ListView 
dsRMSM_RMM_MEETING_SERVICE_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_SERVICE_ID"] != null && Request.QueryString["MEETING_SERVICE_ID"] != "-1")
        {
            inputMEETING_SERVICE_ID = Request.QueryString["MEETING_SERVICE_ID"];
        }
dsRMSM_RMM_MEETING_SERVICE_ListView.SelectParameters.Add("MEETING_SERVICE_ID", System.Data.DbType.Int32, inputMEETING_SERVICE_ID);
//Grid RMSM_RMM_MEETING_MEMBER_MANAGER_ListView 
dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_MEMBER_ID"] != null && Request.QueryString["MEETING_MEMBER_ID"] != "-1")
        {
            inputMEETING_MEMBER_ID = Request.QueryString["MEETING_MEMBER_ID"];
        }
dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView.SelectParameters.Add("MEETING_MEMBER_ID", System.Data.DbType.Int32, inputMEETING_MEMBER_ID);
//Grid RMSM_RMM_MEETING_AGENDA_ListView 
dsRMSM_RMM_MEETING_AGENDA_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_ID"] != null && Request.QueryString["AGENDA_SUB_ID"] != "-1")
        {
            inputAGENDA_SUB_ID = Request.QueryString["AGENDA_SUB_ID"];
        }
dsRMSM_RMM_MEETING_AGENDA_ListView.SelectParameters.Add("AGENDA_SUB_ID", System.Data.DbType.Int32, inputAGENDA_SUB_ID);
//Grid RMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView 
dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_DOC"] != null && Request.QueryString["AGENDA_SUB_DOC"] != "-1")
        {
            inputAGENDA_SUB_DOC = Request.QueryString["AGENDA_SUB_DOC"];
        }
dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView.SelectParameters.Add("AGENDA_SUB_DOC", System.Data.DbType.Int32, inputAGENDA_SUB_DOC);
//Grid RMSM_RMM_MEETING_AGENDA_SUB_URL_ListView 
dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_URL_ID"] != null && Request.QueryString["AGENDA_SUB_URL_ID"] != "-1")
        {
            inputAGENDA_SUB_URL_ID = Request.QueryString["AGENDA_SUB_URL_ID"];
        }
dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView.SelectParameters.Add("AGENDA_SUB_URL_ID", System.Data.DbType.Int32, inputAGENDA_SUB_URL_ID);
//Grid RMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView 
dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_DETAIL_DOC"] != null && Request.QueryString["AGENDA_DETAIL_DOC"] != "-1")
        {
            inputAGENDA_DETAIL_DOC = Request.QueryString["AGENDA_DETAIL_DOC"];
        }
dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView.SelectParameters.Add("AGENDA_DETAIL_DOC", System.Data.DbType.Int32, inputAGENDA_DETAIL_DOC);
//Grid RMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView 
dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_DETAIL_URL_ID"] != null && Request.QueryString["AGENDA_DETAIL_URL_ID"] != "-1")
        {
            inputAGENDA_DETAIL_URL_ID = Request.QueryString["AGENDA_DETAIL_URL_ID"];
        }
dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView.SelectParameters.Add("AGENDA_DETAIL_URL_ID", System.Data.DbType.Int32, inputAGENDA_DETAIL_URL_ID);
		dsRMSM_RMM_MEETING_QEUST_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_ID"] != null && Request.QueryString["MEETING_ID"] != "-1")
        {
            inputMainMEETING_ID = Request.QueryString["MEETING_ID"];
        }
		dsRMSM_RMM_MEETING_QEUST_DetailView.SelectParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMainMEETING_ID);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
		JS="";
        if (Request.QueryString[key] != null && Request.QueryString[key] != "-1")
        {
            mode = "e";
        }
        if (!IsPostBack)
        {
            if (mode == "e")
                PopulateEditData();
            else if (mode == "n")
                PopulateNewData();
            
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (mode == "e")
            Update();
        else if (mode == "n")
            Insert();

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {

    }

    void PopulateEditData()
    {
        //

		//RMSM_RMM_MEETING_QEUST_DetailView
		Title = "สอบถามเรื่องที่ประชุม"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_QEUST_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMEETING_RESERVE_DATE.Value = drv["MEETING_RESERVE_DATE"].ToString();
        ctlMEETING_RESERVE_DATE.Attributes.Add("disabled","disabled");

        ctlMEETING_REQUEST_START_DATE.Value = drv["MEETING_REQUEST_START_DATE"].ToString();
        ctlMEETING_REQUEST_START_DATE.Attributes.Add("disabled","disabled");

        ctlMEETING_REQUEST_START_TIME.Value = drv["MEETING_REQUEST_START_TIME"].ToString();
        ctlMEETING_REQUEST_START_TIME.Attributes.Add("disabled","disabled");

        ctlROOM_ID.Value = drv["ROOM_ID"].ToString();
        ctlROOM_ID.Attributes.Add("disabled","disabled");

        ctlMEETING_CODE.Value = drv["MEETING_CODE"].ToString();
        ctlMEETING_CODE.Attributes.Add("disabled","disabled");

        ctlMEETING_SUBJECT.Value = drv["MEETING_SUBJECT"].ToString();
        ctlMEETING_SUBJECT.Attributes.Add("disabled","disabled");

        ctlBOARD_NAME.Value = drv["BOARD_NAME"].ToString();
        ctlBOARD_NAME.Attributes.Add("disabled","disabled");

        ctlMEETING_AMOUNT.Value = drv["MEETING_AMOUNT"].ToString();
        ctlMEETING_AMOUNT.Attributes.Add("disabled","disabled");

        ctlNAME.Value = drv["NAME"].ToString();
        ctlNAME.Attributes.Add("disabled","disabled");

        ctlOFFICER_OPSITION_NAME.Value = drv["OFFICER_OPSITION_NAME"].ToString();
        ctlOFFICER_OPSITION_NAME.Attributes.Add("disabled","disabled");

        ctlMEETING_REQUEST_OFFICER_TEL.Value = drv["MEETING_REQUEST_OFFICER_TEL"].ToString();
        ctlMEETING_REQUEST_OFFICER_TEL.Attributes.Add("disabled","disabled");

        ctlORG.Value = drv["ORG"].ToString();
        ctlORG.Attributes.Add("disabled","disabled");

        ctlMEETING_ADMIN.Value = drv["MEETING_ADMIN"].ToString();
        ctlMEETING_ADMIN.Attributes.Add("disabled","disabled");

        ctlMEETING_NOTE.Text = drv["MEETING_NOTE"].ToString();

        ctlMEETING_AGENDA_ID.Value = drv["MEETING_AGENDA_ID"].ToString();
        ctlMEETING_AGENDA_ID.Attributes.Add("disabled","disabled");

        ctlAGENDA_SUB_TOPIC.Value = drv["AGENDA_SUB_TOPIC"].ToString();
        ctlAGENDA_SUB_TOPIC.Attributes.Add("disabled","disabled");

        ctlAGENDA_SUB_DESC.Value = drv["AGENDA_SUB_DESC"].ToString();
        ctlAGENDA_SUB_DESC.Attributes.Add("disabled","disabled");

        ctlAGENDA_SUB_BOARD.Value = drv["AGENDA_SUB_BOARD"].ToString();
        ctlAGENDA_SUB_BOARD.Attributes.Add("disabled","disabled");

        ctlAGENDA_SUB_ID.Value = drv["AGENDA_SUB_ID"].ToString();
        ctlAGENDA_SUB_ID.Attributes.Add("disabled","disabled");

        ctlAGENDA_DETAIL_SEQ.Value = drv["AGENDA_DETAIL_SEQ"].ToString();
        ctlAGENDA_DETAIL_SEQ.Attributes.Add("disabled","disabled");

        ctlAGENDA_DETAIL_TOPIC.Value = drv["AGENDA_DETAIL_TOPIC"].ToString();
        ctlAGENDA_DETAIL_TOPIC.Attributes.Add("disabled","disabled");

        ctlAGENDA_DETAIL_DESC.Value = drv["AGENDA_DETAIL_DESC"].ToString();
        ctlAGENDA_DETAIL_DESC.Attributes.Add("disabled","disabled");

        ctlAGENDA_DETAIL_BOARD.Value = drv["AGENDA_DETAIL_BOARD"].ToString();
        ctlAGENDA_DETAIL_BOARD.Attributes.Add("disabled","disabled");


        SetValidation();
        SetFormatting();
    }

    void PopulateNewData()
    {
        //

        SetValidation();
        SetFormatting();
    }

    void SetValidation()
    {
        //


    }

    void SetFormatting()
    {
        //


    }

    void Insert()
    {
        //
		dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Clear();
        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_RESERVE_DATE", System.Data.DbType.String, ctlMEETING_RESERVE_DATE.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_REQUEST_START_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_START_DATE.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_REQUEST_START_TIME", System.Data.DbType.String, ctlMEETING_REQUEST_START_TIME.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.String, ctlROOM_ID.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_CODE", System.Data.DbType.String, ctlMEETING_CODE.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_SUBJECT", System.Data.DbType.String, ctlMEETING_SUBJECT.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("BOARD_NAME", System.Data.DbType.String, ctlBOARD_NAME.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_AMOUNT", System.Data.DbType.String, ctlMEETING_AMOUNT.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("NAME", System.Data.DbType.String, ctlNAME.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("OFFICER_OPSITION_NAME", System.Data.DbType.String, ctlOFFICER_OPSITION_NAME.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_REQUEST_OFFICER_TEL", System.Data.DbType.String, ctlMEETING_REQUEST_OFFICER_TEL.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("ORG", System.Data.DbType.String, ctlORG.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_ADMIN", System.Data.DbType.String, ctlMEETING_ADMIN.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_NOTE", System.Data.DbType.String, ctlMEETING_NOTE.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("MEETING_AGENDA_ID", System.Data.DbType.String, ctlMEETING_AGENDA_ID.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_SUB_TOPIC", System.Data.DbType.String, ctlAGENDA_SUB_TOPIC.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_SUB_DESC", System.Data.DbType.String, ctlAGENDA_SUB_DESC.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_SUB_BOARD", System.Data.DbType.String, ctlAGENDA_SUB_BOARD.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_SUB_ID", System.Data.DbType.String, ctlAGENDA_SUB_ID.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_DETAIL_SEQ", System.Data.DbType.String, ctlAGENDA_DETAIL_SEQ.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_DETAIL_TOPIC", System.Data.DbType.String, ctlAGENDA_DETAIL_TOPIC.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_DETAIL_DESC", System.Data.DbType.String, ctlAGENDA_DETAIL_DESC.Text);

        dsRMSM_RMM_MEETING_QEUST_DetailView.InsertParameters.Add("AGENDA_DETAIL_BOARD", System.Data.DbType.String, ctlAGENDA_DETAIL_BOARD.Text);

		int i = dsRMSM_RMM_MEETING_QEUST_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_RESERVE_DATE", System.Data.DbType.String, ctlMEETING_RESERVE_DATE.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_REQUEST_START_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_START_DATE.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_REQUEST_START_TIME", System.Data.DbType.String, ctlMEETING_REQUEST_START_TIME.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.String, ctlROOM_ID.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_CODE", System.Data.DbType.String, ctlMEETING_CODE.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_SUBJECT", System.Data.DbType.String, ctlMEETING_SUBJECT.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("BOARD_NAME", System.Data.DbType.String, ctlBOARD_NAME.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_AMOUNT", System.Data.DbType.String, ctlMEETING_AMOUNT.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("NAME", System.Data.DbType.String, ctlNAME.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("OFFICER_OPSITION_NAME", System.Data.DbType.String, ctlOFFICER_OPSITION_NAME.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_REQUEST_OFFICER_TEL", System.Data.DbType.String, ctlMEETING_REQUEST_OFFICER_TEL.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("ORG", System.Data.DbType.String, ctlORG.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_ADMIN", System.Data.DbType.String, ctlMEETING_ADMIN.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_NOTE", System.Data.DbType.String, ctlMEETING_NOTE.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_AGENDA_ID", System.Data.DbType.String, ctlMEETING_AGENDA_ID.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_SUB_TOPIC", System.Data.DbType.String, ctlAGENDA_SUB_TOPIC.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_SUB_DESC", System.Data.DbType.String, ctlAGENDA_SUB_DESC.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_SUB_BOARD", System.Data.DbType.String, ctlAGENDA_SUB_BOARD.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_SUB_ID", System.Data.DbType.String, ctlAGENDA_SUB_ID.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_DETAIL_SEQ", System.Data.DbType.String, ctlAGENDA_DETAIL_SEQ.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_DETAIL_TOPIC", System.Data.DbType.String, ctlAGENDA_DETAIL_TOPIC.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_DETAIL_DESC", System.Data.DbType.String, ctlAGENDA_DETAIL_DESC.Text);
        dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("AGENDA_DETAIL_BOARD", System.Data.DbType.String, ctlAGENDA_DETAIL_BOARD.Text);
		dsRMSM_RMM_MEETING_QEUST_DetailView.UpdateParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMainMEETING_ID);
		int i = dsRMSM_RMM_MEETING_QEUST_DetailView.Update();


		JS="alert('Updated');";
    }


}