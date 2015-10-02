<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_Detail" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        var lkuValueId = "";
        var lkuLabelId = "";
        var selectedPopupView;
        $(document).ready(function () {
            $('.fancyBox').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    //location.reload();
                    selectedPopupView.Refresh();
                }
            });
            $('.fancyBoxLku').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {

                }
            });
        });

        function ClientValidation() {
            return ASPxClientEdit.ValidateGroup("");
        }

        function OpenLku(id, href, valId, lblId) {
            lkuValueId = valId;
            lkuLabelId = lblId;
            $("#" + id).attr("href", href);
            $("#" + id).click();
        }
        function SetLku(val, label) {
            $("#" + lkuValueId).val(val);
            $("#" + lkuLabelId).val(val);
        }

        function OpenChildDetail(id, href, viewName) {
            $("#" + id).attr("href", href);
            $("#" + id).click();
            selectedPopupView = viewName;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <div class="form-group col-sm-12" style="margin-top: 20px;">
        <div class="col-sm-offset-3 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div>
        <h1></h1>
    </div>

    <div class="col-sm-12">
        <div class="panel panel-default">
            <!--open box 14-->
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
                สัญญา
            </div>
            <div class="panel-body">
                <!--open box body14-->
                <div id="MINISTRY_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงาน :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlMINISTRY_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="GOVERNMENT_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">กระทรวง :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlGOVERNMENT_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="CONTRACT_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สัญญาเลขที่ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlCONTRACT_CODE" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="CONTRACT_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อสัญญา :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlCONTRACT_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="CONTRACT_SIGN_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่ลงนามในสัญญา :</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelCONTRACT_SIGN_DATE" runat="server">
                            <ContentTemplate>
                                <dx:ASPxDateEdit ID="ctlCONTRACT_SIGN_DATE" CssClass="form-control" AutoPostBack="true" runat="server" EditFormat="Custom" Width="0">
                                    <TimeSectionProperties>
                                        <TimeEditProperties EditFormatString="hh:mm tt" />
                                    </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div id="CONTRACT_START_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่เริ่มงาน :</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelCONTRACT_START_DATE" runat="server">
                            <ContentTemplate>
                                <dx:ASPxDateEdit ID="ctlCONTRACT_START_DATE" CssClass="form-control" AutoPostBack="true" runat="server" EditFormat="Custom" Width="0">
                                    <TimeSectionProperties>
                                        <TimeEditProperties EditFormatString="hh:mm tt" />
                                    </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div id="CONTRACT_END_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่สิ้นสุด :</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelCONTRACT_END_DATE" runat="server">
                            <ContentTemplate>
                                <dx:ASPxDateEdit ID="ctlCONTRACT_END_DATE" CssClass="form-control" AutoPostBack="true" runat="server" EditFormat="Custom" Width="0">
                                    <TimeSectionProperties>
                                        <TimeEditProperties EditFormatString="hh:mm tt" />
                                    </TimeSectionProperties>
                                </dx:ASPxDateEdit>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div id="CONTRACT_AMOUNT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">มูลค่าสัญญา(บาท) :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlCONTRACT_AMOUNT" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="CONTRACT_REMARK" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หมายเหตุ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxMemo ID="ctlCONTRACT_REMARK" CssClass="form-control" runat="server"
                            Width="100%" Height="100">
                        </dx:ASPxMemo>
                    </div>
                </div>
                <div id="tab01" class="col-sm-12">
                    <div class="tabbable">
                        <!--open tabhead 24-->
                        <ul id="ultab24" class="nav nav-tabs tab-bricky">
                            <li>
                                <!--open tabpage 25-->
                                <a href="#grideTab1" data-toggle="tab">คณะตรวจรับ
                                </a>
                            </li>
                            <li>
                                <!--open tabpage 29-->
                                <a href="#grideTab2" data-toggle="tab">งวดงาน
                                </a>
                            </li>
                            <li>
                                <!--open tabpage 34-->
                                <a href="#grideTab3" data-toggle="tab">สิ่งส่งมอบ
                                </a>
                            </li>
                        </ul>
                        <!--end tabhead 39-->
                    
                    <!--end tabhead 39-->
                    <div class="tab-content">
                        <!--open tab content 24-->
                        <div class="tab-pane active" id="grideTab1">
                            <!--open tabpage 25-->
                            
                            <!--button26-->
                            <div>
                            <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_BORAD_List_new" class='btn btn-primary' value=' เพิ่มคณะตรวจรับ ' onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_BORAD_List', 'CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.aspx?BORAD_ID=-1', viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List);" /></div>
                            <div>
                                <div>
                                    <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                        DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_BORAD_List" KeyFieldName="BORAD_ID" 
                                        ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List" Theme="Metropolis" > 
                                        <Columns>

                                            <dx:GridViewCommandColumn 
                                                ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            
                                            <dx:GridViewDataTextColumn FieldName="BORAD_ID" ReadOnly="True" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                <DataItemTemplate>
                                                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_BORAD_List','CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.aspx?CONTRACT_ID=<%#Eval("CONTRACT_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List);"></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="รหัสเจ้าหน้าที่" FieldName="BORAD_CODE" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="ชื่อ-สกุล" FieldName="NAME" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="ตำแหน่ง" FieldName="BORAD_POSITION" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="ตำแหน่งในคณะกรรมการ" FieldName="BORAD_POSITION_CHECK" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="เบอร์โทรศัพท์" FieldName="BORAD_TEL" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="อีเมล" FieldName="BORAD_EMAIL" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>

                                            
                                        </Columns>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="False"  ShowFilterRowMenu="true"/>
                                        <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ProcessSelectionChangedOnServer="True" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                            </DeleteButton>
                                            
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_BORAD_List" class='fancyBox' style="display: none"></a>
                                </div>
                            </div>
                        </div>
                            
                        
                        <!--end tabpage 28-->
                        <div class="tab-pane " id="grideTab2">
                            <!--open tabpage 29-->
                            <div id="PERIOD_DURATION_TOTAL" class="form-group col-sm-12">
                                <label for="" class="col-sm-4 control-label">จำนวนวันรวม :</label>
                                <div class="col-sm-8">
                                    <dx:ASPxTextBox ID="ctlPERIOD_DURATION_TOTAL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                                </div>
                            </div>
                            <div id="PERIOD_DURATION_PERCENT" class="form-group col-sm-12">
                                <label for="" class="col-sm-4 control-label">จำนวนเปอร์เซ็นต์เงินรวม :</label>
                                <div class="col-sm-8">
                                    <dx:ASPxTextBox ID="ctlPERIOD_DURATION_PERCENT" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                                </div>
                            </div>
                            <div>
                            <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_PERIOD_List_new" class='btn btn-primary' value=' เพิ่มงวดงาน ' onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_List', 'CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.aspx?PERIOD_ID=-1', viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List);" /></div>
                            <div>
                                <div>

                                    <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                        DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" KeyFieldName="PERIOD_ID" 
                                        ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" Theme="Metropolis">
                                        <Columns>

                                            <dx:GridViewCommandColumn 
                                                ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="10">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewCommandColumn  ShowSelectButton ="true"
                                                 ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="PERIOD_ID" ReadOnly="True" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                <DataItemTemplate>
                                                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_List','CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.aspx?PERIOD_ID=<%#Eval("CONTRACT_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List);"></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="งวดงานที่" FieldName="PERIOD_NO" VisibleIndex="3">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataTextColumn Caption="รายละเอียด" FieldName="PERIOD_DESC" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่ส่งมอบตามสัญญา" FieldName="PERIOD_DateTime" VisibleIndex="5">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="ค่าจ้าง(บาท)" FieldName="PERIOD_AMOUNT" VisibleIndex="6">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="CONTRACT_END_DATE" VisibleIndex="7">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="เปอร์เซ็นต์เงิน" FieldName="PERIOD_PERCENT" VisibleIndex="8">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่เริ่มต้น" FieldName="PERIOD_START_DateTime" VisibleIndex="9">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="PERIOD_END_DateTime" VisibleIndex="10">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="จำนวนวัน" FieldName="PERIOD_DURATION_DateTime" VisibleIndex="11">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่ส่งจริง" FieldName="PERIOD_DELIVERY_DateTime" VisibleIndex="12">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่ตรวจรับงาน" FieldName="PERIOD_BORAD_DateTime" VisibleIndex="13">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="สถานะ" FieldName="PERIOD_STATUS" VisibleIndex="11">
                                            </dx:GridViewDataSpinEditColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="False"  ShowFilterRowMenu="true"/>
                                        <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ProcessSelectionChangedOnServer="True" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                            </DeleteButton>
                                            
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                        </div>
                        <!--end tabpage 33-->
                        <div class="tab-pane " id="grideTab3">
                            <!--open tabpage 34-->
                            <div id="PERIOD_NO" class="form-group col-sm-12">
                                <label for="" class="col-sm-4 control-label">งวดงานที่ :</label>
                                <div class="col-sm-8">
                                    <dx:ASPxComboBox
                                        ID="ctlPERIOD_NO" runat="server"
                                        DropDownStyle="DropDown" CssClass="form-control"
                                        DataSourceID="dsPERIOD_NO"
                                        TextField="PERIOD_DET_NO" ValueField="PERIOD_DET_ID"
                                        Width="100%" />
                                </div>
                            </div>
                            <!--button36-->
                            <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List_new" class='btn btn-primary' value=' เพิ่มงวดงาน ' onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List', 'CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.aspx?PERIOD_DET_ID=-1', viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List);" />
                            <div></div>
                            <div>
                                <div>


                                    <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                        DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List" KeyFieldName="PERIOD_DET_ID" ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List" Theme="Metropolis">
                                        <Columns>

                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="PERIOD_DET_ID" ReadOnly="True" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                <DataItemTemplate>
                                                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List','CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.aspx?PERIOD_DET_ID=<%#Eval("PERIOD_DET_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List);"></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="ลำดับที่" FieldName="PERIOD_DET_NO" VisibleIndex="3">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataTextColumn Caption="สิ่งส่งมอบ" FieldName="PERIOD_DET_DESC" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="จำนวน" FieldName="PERIOD_DET_QUANTITY" VisibleIndex="5">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="หน่วยนับ" FieldName="UNIT_ID" VisibleIndex="6">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataTextColumn Caption="หมายเหตุ" FieldName="PERIOD_DET_REMARK" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="true" ShowGroupPanel="False" />
                                        <SettingsBehavior ConfirmDelete="true" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                            </DeleteButton>
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                        </div>
                        <!--end tabpage 38-->
                    </div>
                        </div>
                    <!--end tab 39-->
                </div>
            </div>
            <!--end box body 40-->
        </div>
        <!--end box 40-->

    
    <div>

        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT WHERE [CONTRACT_ID] = @CONTRACT_ID"
            SelectCommand="select 
CRMT_PMM_PROJECT_CONTRACT.CONTRACT_ID
,COMMON_MASTER_ORGANIZE.ORGANIZE_NAME_THA MINISTRY_NAME
,COMMON_MASTER_GOVERNMENT.GOVERNMENT_NAME
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_CODE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_NAME
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_SIGN_DATE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_START_DATE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_END_DATE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_REMARK
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DURATION_TOTAL
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DURATION_PERCENT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_NO
 
from CRMT_PMM_PROJECT_CONTRACT 
left join COMMON_DATA.dbo.COMMON_MASTER_ORGANIZE on CRMT_PMM_PROJECT_CONTRACT.MINISTRY_ID = COMMON_MASTER_ORGANIZE.ORGANIZE_ID
left join COMMON_DATA.dbo.COMMON_MASTER_GOVERNMENT on COMMON_MASTER_ORGANIZE.GOVERNMENT_ID = COMMON_MASTER_GOVERNMENT.GOVERNMENT_ID
left join CRMT_PMM_PROJECT_CONTRACT_PERIOD on  CRMT_PMM_PROJECT_CONTRACT.CONTRACT_ID  = CRMT_PMM_PROJECT_CONTRACT_PERIOD.CONTRACT_ID
left join CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET on CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_ID = CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_ID  
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT.CONTRACT_ID=@CONTRACT_ID"
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT
(
CONTRACT_CODE
,CONTRACT_NAME
,CONTRACT_SIGN_DATE
,CONTRACT_START_DATE
,CONTRACT_END_DATE
,CONTRACT_AMOUNT
,CONTRACT_REMARK
)
values
(
@CONTRACT_CODE
,@CONTRACT_NAME
,@CONTRACT_SIGN_DATE
,@CONTRACT_START_DATE
,@CONTRACT_END_DATE
,@CONTRACT_AMOUNT
,@CONTRACT_REMARK
)"
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT 
set 
CONTRACT_CODE=@CONTRACT_CODE
,CONTRACT_NAME=@CONTRACT_NAME
,CONTRACT_SIGN_DATE=@CONTRACT_SIGN_DATE
,CONTRACT_START_DATE=@CONTRACT_START_DATE
,CONTRACT_END_DATE=@CONTRACT_END_DATE
,CONTRACT_AMOUNT=@CONTRACT_AMOUNT
,CONTRACT_REMARK=@CONTRACT_REMARK
 
where  1=1 
 AND CONTRACT_ID=@CONTRACT_ID">
            <DeleteParameters>
                <asp:Parameter Name="CONTRACT_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="CONTRACT_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_BORAD_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_BORAD WHERE [BORAD_ID] = @BORAD_ID"
                SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_ID
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_POSITION
,CRMT_PMM_PROJECT_CONTRACT_BORAD.CONTRACT_ID
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_CODE
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_FNAME_NAME_THA + ' ' + CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_LNAME_NAME_THA as NAME
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_POSITION
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_POSITION_CHECK
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_TEL
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_EMAIL
 from CRMT_PMM_PROJECT_CONTRACT_BORAD where  1=1  and CRMT_PMM_PROJECT_CONTRACT_BORAD.CONTRACT_ID = @CONTRACT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="BORAD_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_PERIOD WHERE [PERIOD_ID] = @PERIOD_ID"
                SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.CONTRACT_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_NO
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DESC
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_PERCENT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_START_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_END_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DURATION_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DELIVERY_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_BORAD_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_STATUS
from CRMT_PMM_PROJECT_CONTRACT_PERIOD where  1=1  and CRMT_PMM_PROJECT_CONTRACT_PERIOD.CONTRACT_ID = @CONTRACT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PERIOD_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET WHERE [PERIOD_DET_ID] = @PERIOD_DET_ID"
            SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_DET_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.CONTRACT_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PROJECT_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.UNIT_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_DET_NO
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_DET_DESC
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_DET_QUANTITY
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.UNIT_ID
,CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.PERIOD_DET_REMARK
 from CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET where  1=1 and CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET.CONTRACT_ID = @CONTRACT_ID ">
            <DeleteParameters>
                <asp:Parameter Name="PERIOD_DET_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsVIEW_CRMM_MDM_CUST_INFO_CUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select CUST_NO,CUST_ID from VIEW_CRMM_MDM_CUST_INFO_CUS"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select PERIOD_NO,PERIOD_ID from CRMT_PMM_PROJECT_CONTRACT_PERIOD"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select PERIOD_DET_NO,PERIOD_DET_ID from CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsPERIOD_NO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select PERIOD_DET_NO,PERIOD_DET_ID from CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET"></asp:SqlDataSource>
    </div>
</asp:Content>

