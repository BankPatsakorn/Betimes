<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_ROOM_INFO_DetailView.aspx.cs" Inherits="RMSM_MDM_ROOM_INFO_DetailView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .dis-ctl
        {
            background-color: #DDDDDD;
        }

        .control-label
        {
            width: 150px;
            height: 30px;
        }
    </style>
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

			<%=JS %>
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
            $("#" + lkuLabelId).val(label);
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
    <div>&nbsp;</div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 0em">
        <span style="font-size: 23px">จัดการห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0501-1)</span>
    </div>
    <div class="form-group col-sm-12" style="margin-top: 10px;">
        <div class="col-sm-offset-10 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div class="col-sm-12">
        <div class="col-sm-12">
            <div>
                <!--open tabhead 18-->
                <ul id="ultab18" class="nav nav-tabs tab-bricky">
                    <li class="active">
                        <!--open tabpage 19-->
                        <a href="#tabpage1" data-toggle="tab">การจัดการห้องประชุม
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 32-->
                        <a href="#tabpage2" data-toggle="tab">โสตทัศนูปกรณ์
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 36-->
                        <a href="#tabpage3" data-toggle="tab">บริการการประชุม
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 40-->
                        <a href="#tabpage4" data-toggle="tab">ผู้ดูแลห้องประชุม
                        </a>
                    </li>
                </ul>
                <!--end tabhead 44-->
            </div>
            <!--end tabhead 44-->
            <div class="tab-content">
                <!--open tab content 18-->
                <div class="tab-pane active" id="tabpage1">
                    <!--open tabpage 19-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <!--row 20-->
                                <div class="col-sm-6">
                                    <!--col 21-->
                                    <div id="ROOM_CODE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">รหัสห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlROOM_CODE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="ROOM_NAME" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ชื่อห้องประชุม<span style="color: red">*</span>:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlROOM_NAME" runat="server" Height="30" Width="300"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="ROOM_FLOOR" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ชั้น:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxSpinEdit ID="ctlROOM_FLOOR" runat="server" Height="30" Width="300">
                                                <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </div>
                                    </div>
                                    <div id="ROOM_STATUS" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">สถานะ:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxRadioButtonList
                                                ID="ctlROOM_STATUS" runat="server" DataSourceID="dsROOM_STATUS"
                                                TextField="txt" ValueField="id" Border-BorderStyle="None"
                                                RepeatColumns="4" RepeatLayout="Table">
                                            </dx:ASPxRadioButtonList>
                                        </div>
                                    </div>
                                    <div id="ROOM_CAPACITY" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4">ความจุสูงสุด<span style="color: red">*</span>:</label>
                                        <div class="col-sm-4">
                                            <dx:ASPxSpinEdit ID="ctlROOM_CAPACITY" runat="server" Height="30" Width="100%">
                                                <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </div>
                                        <div class="col-sm-2">
                                            คน
                                        </div>
                                    </div>
                                    <div id="Div1" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4">ความจุต่ำสุด<span style="color: red">*</span>:</label>
                                        <div class="col-sm-4">
                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" Height="30" Width="100%">
                                                <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </div>
                                        <div class="col-sm-2">
                                            คน
                                        </div>
                                    </div>
                                    <div id="ROOM_MAPPING" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">รูป:</label>
                                        <div class="col-sm-8">
                                            <asp:FileUpload ID="ctlROOM_MAPPING" runat="server" /><br />
                                            <asp:HyperLink ID="linkROOM_MAPPING" Visible="false" runat="server"></asp:HyperLink>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-12">
                                        <label for="" class="col-sm-12">รองรับ File .pdf, .jpeg, .png ขนาดไม่เกิน 5MB. </label>
                                    </div>
                                </div>
                                <!--end col 29-->
                            </div>
                            <!--end row 30-->
                        </div>
                    </div>
                </div>
                <!--end tabpage 31-->
                <div class="tab-pane " id="tabpage2">
                    <!--open tabpage 32-->
                    <div class="row">
                        <div class="col-sm-12">
                            <!--button33-->
                            <input type="button" value="เพิ่มโสตทัศนูปกรณ์" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_EQUIPMENT_DetailView.aspx';" />
                            <div>&nbsp;</div>
                            <div>
                                <div>


                                    <dx:ASPxGridView ID="viewRMSM_MDM_EQUIPMENT_INFO_ListView" runat="server" Width="100%"
                                        AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                        DataSourceID="dsRMSM_MDM_EQUIPMENT_INFO_ListView" KeyFieldName="EQUIPMENT_ID" ClientInstanceName="viewRMSM_MDM_EQUIPMENT_INFO_ListView" Theme="Metropolis">
                                        <Columns>

                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                ShowDeleteButton="True" Width="5%" Caption="ลบ" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="EQUIPMENT_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                <DataItemTemplate>
                                                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_MDM_EQUIPMENT_INFO_ListView','RMSM_MDM_EQUIPMENT_INFO_DetailView.aspx?EQUIPMENT_ID=<%#Eval("EQUIPMENT_ID") %>', viewRMSM_MDM_EQUIPMENT_INFO_ListView);">
                                                        <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="โสตทัศนูปกรณ์" FieldName="EQUIPMENT_NAME" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="จำนวน" FieldName="EQUIPMENT_AMOUNT" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="รูป" FieldName="EQUIPMENT_PATH" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="หน่วย" FieldName="COUNT_UNIT_NAME" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                        <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="Images/del.png" />
                                            </DeleteButton>
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxRMSM_MDM_EQUIPMENT_INFO_ListView" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 35-->
                <div class="tab-pane " id="tabpage3">
                    <!--open tabpage 36-->
                    <div class="row">
                        <div class="col-sm-12">
                            <!--button37-->
                            <input type="button" value="เพิ่มบริการการประชุม" class="btn btn-primary" onclick="location = 'RMSM_MDM_SERVICE_INFO_DetailView.aspx';" />
                            <div>&nbsp;</div>
                            <div>
                                <div>


                                    <dx:ASPxGridView ID="viewRMSM_MDM_SERVICE_INFO_ListView" runat="server" Width="100%"
                                        AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                        DataSourceID="dsRMSM_MDM_SERVICE_INFO_ListView" KeyFieldName="SERVICE_ID" ClientInstanceName="viewRMSM_MDM_SERVICE_INFO_ListView" Theme="Metropolis">
                                        <Columns>

                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                ShowDeleteButton="True" Width="5%" CellStyle-HorizontalAlign="Center" Caption="ลบ" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="SERVICE_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                <DataItemTemplate>
                                                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_MDM_SERVICE_INFO_ListView','RMSM_MDM_SERVICE_INFO_DetailView.aspx?SERVICE_ID=<%#Eval("SERVICE_ID") %>', viewRMSM_MDM_SERVICE_INFO_ListView);">
                                                        <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="บริการ" FieldName="SERVICE_NAME" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="หน่วยนับ" FieldName="COUNT_UNIT_NAME" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                        <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="Images/del.png" />
                                            </DeleteButton>
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxRMSM_MDM_SERVICE_INFO_ListView" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 39-->
                <div class="tab-pane " id="tabpage4">
                    <!--open tabpage 40-->
                    <div class="row">
                        <div class="col-sm-12">
                            <!--button41-->
                            <input type="button" value="เพิ่มผู้ดูแลห้องประชุม" class="btn btn-primary" onclick="location = 'RMSM_MDM_ADMIN_INFO_DetailView.aspx';" />
                            <div>&nbsp;</div>
                            <div>
                                <div>


                                    <dx:ASPxGridView ID="viewRMSM_MDM_ADMIN_INFO_ListView" runat="server" Width="100%"
                                        AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                        DataSourceID="dsRMSM_MDM_ADMIN_INFO_ListView" KeyFieldName="ADMIN_ID" ClientInstanceName="viewRMSM_MDM_ADMIN_INFO_ListView" Theme="Metropolis">
                                        <Columns>

                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                ShowDeleteButton="True" Width="5%" CellStyle-HorizontalAlign="Center" Caption="ลบ" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="ADMIN_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                <DataItemTemplate>
                                                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_MDM_ADMIN_INFO_ListView','RMSM_MDM_ADMIN_INFO_DetailView.aspx?ADMIN_ID=<%#Eval("ADMIN_ID") %>', viewRMSM_MDM_ADMIN_INFO_ListView);">
                                                        <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="รหัสห้องประชุม" FieldName="ROOM_CODE" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="ชื่อผู้ดูแลห้องประชุม" FieldName="NAME" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="หน่วยงาน" FieldName="UNIT_NAME" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>

                                          <%--  <dx:GridViewDataTextColumn Caption="ชื่อห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>--%>
                                        </Columns>
                                        <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                        <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="Images/del.png" />
                                            </DeleteButton>
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxRMSM_MDM_ADMIN_INFO_ListView" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 43-->
            </div>
            <!--end tab 44-->
        </div>

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_EQUIPMENT_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_EQUIPMENT_INFO WHERE [EQUIPMENT_ID] = @EQUIPMENT_ID"
            SelectCommand="SELECT [RMSM_MDM_EQUIPMENT_INFO].[EQUIPMENT_ID]
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].[EQUIPMENT_NAME]
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_AMOUNT
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].[COUNT_UNIT_NAME]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].[COUNT_UNIT_ID]
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_PATH
FROM [dbo].[RMSM_MDM_EQUIPMENT_INFO]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO] on
[OPM_RMS].[dbo].[RMSM_MDM_EQUIPMENT_INFO].[COUNT_UNIT_ID] = [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].[COUNT_UNIT_ID]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_MDM_EQUIPMENT_INFO].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
WHERE [dbo].[RMSM_MDM_EQUIPMENT_INFO].RECORD_STATUS = 'A' ">
            <DeleteParameters>
                <asp:Parameter Name="EQUIPMENT_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_MDM_SERVICE_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_SERVICE_INFO WHERE [SERVICE_ID] = @SERVICE_ID"
            SelectCommand="SELECT [SERVICE_ID]
,[SERVICE_NAME]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_NAME
FROM [dbo].[RMSM_MDM_SERVICE_INFO]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO] on
[dbo].[RMSM_MDM_SERVICE_INFO].COUNT_UNIT_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
WHERE [dbo].[RMSM_MDM_SERVICE_INFO].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="SERVICE_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_MDM_ADMIN_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_ADMIN_INFO WHERE [ADMIN_ID] = @ADMIN_ID"
            SelectCommand="SELECT DISTINCT [dbo].[RMSM_MDM_ADMIN_INFO].ADMIN_ID
,[dbo].[RMSM_MDM_ROOM_INFO].ADMIN_ID
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_CODE
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].[PREFIX_DESC]+[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME as NAME
,[UNIT_NAME]
,[ROOM_NAME]
FROM [dbo].[RMSM_MDM_ADMIN_INFO]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_MDM_ADMIN_INFO].ADMIN_ID = [dbo].[RMSM_MDM_ROOM_INFO].ADMIN_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_MDM_ADMIN_INFO].OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_ORGANIZE]on
[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].UNIT_ID = [OPM_COMMON_DATA].[dbo].[VIEW_ORGANIZE].[UNIT_ID]
WHERE [dbo].[RMSM_MDM_ADMIN_INFO].RECORD_STATUS = 'A'

">
            <DeleteParameters>
                <asp:Parameter Name="ADMIN_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_ROOM_INFO WHERE [ROOM_ID] = @ROOM_ID"
            SelectCommand="select 
RMSM_MDM_ROOM_INFO.ROOM_ID
,RMSM_MDM_ROOM_INFO.ROOM_CODE
,RMSM_MDM_ROOM_INFO.ROOM_NAME
,RMSM_MDM_ROOM_INFO.ROOM_FLOOR
,RMSM_MDM_ROOM_INFO.ROOM_STATUS
,RMSM_MDM_ROOM_INFO.ROOM_CAPACITY
,RMSM_MDM_ROOM_INFO.ROOM_MAPPING
 
from RMSM_MDM_ROOM_INFO 
where  1=1  AND RMSM_MDM_ROOM_INFO.ROOM_ID=@ROOM_ID"
            InsertCommand="insert into RMSM_MDM_ROOM_INFO
(
ROOM_CODE
,ROOM_NAME
,ROOM_FLOOR
,ROOM_STATUS
,ROOM_CAPACITY
,ROOM_MAPPING
)
values
(
@ROOM_CODE
,@ROOM_NAME
,@ROOM_FLOOR
,@ROOM_STATUS
,@ROOM_CAPACITY
,@ROOM_MAPPING
)"
            UpdateCommand="update RMSM_MDM_ROOM_INFO 
set 
ROOM_CODE=@ROOM_CODE
,ROOM_NAME=@ROOM_NAME
,ROOM_FLOOR=@ROOM_FLOOR
,ROOM_STATUS=@ROOM_STATUS
,ROOM_CAPACITY=@ROOM_CAPACITY
,ROOM_MAPPING=@ROOM_MAPPING
 
where  1=1 
 AND ROOM_ID=@ROOM_ID">
            <DeleteParameters>
                <asp:Parameter Name="ROOM_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="ROOM_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsROOM_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ปกติ'  union all select '2','งดใช้งาน'  union all select '3','ไม่ใช้งาน' ) aa where id <> '-1'"></asp:SqlDataSource>
    </div>
</asp:Content>

