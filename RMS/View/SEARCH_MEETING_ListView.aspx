<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" AutoEventWireup="true" CodeFile="SEARCH_MEETING_ListView.aspx.cs" MasterPageFile="~/Master/bs.master" Inherits="View_SEARCH_MEETING_ListView" %>

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
    <div class="form-group col-sm-12" style="margin-top: 20px;">
    </div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">ค้นหารายการประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UTxxxx)</span>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div id="Div2" class="form-group col-sm-6">
                <label for="" class="col-sm-4">ชื่อเรื่อง:</label>
                <div class="col-sm-6">
                    <dx:ASPxTextBox ID="ctlROOM_CODE" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>

                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div id="ROOM_ID" class="form-group col-sm-6">
                <label for="" class="col-sm-4">ห้องประชุม:</label>
                <div class="col-sm-6">
                    <dx:ASPxComboBox
                        ID="ctlROOM_ID" runat="server" Height="30"
                        DropDownStyle="DropDown" DataSourceID="dsRMSM_MDM_ROOM_INFO"
                        TextField="ROOM_NAME" ValueField="ROOM_ID" SelectedIndex="0"
                        Width="100%" IncrementalFilteringMode="StartsWith" />
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div id="Div4" class="form-group col-sm-6">
                <label for="" class="col-sm-4">จากวันที่:</label>
                <div class="col-sm-6">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <dx:ASPxDateEdit ID="ASPxDateEdit1" Height="30" DropDownButton-Image-IconID="scheduling_calendar_16x16" AutoPostBack="true" DisplayFormatString="d MMM yyyy" runat="server" EditFormat="Custom" Width="100%">
                            </dx:ASPxDateEdit>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
            <div id="Div3" class="form-group col-sm-6">
                <label for="" class="col-sm-4 ">ถึงวันที่:</label>
                <div class="col-sm-6">
                    <asp:UpdatePanel ID="UpdatePanelMEETING_REQUEST_START_DATE" runat="server">
                        <ContentTemplate>
                            <dx:ASPxDateEdit ID="ctlMEETING_REQUEST_START_DATE" Height="30" DropDownButton-Image-IconID="scheduling_calendar_16x16" AutoPostBack="true" DisplayFormatString="d MMM yyyy" runat="server" EditFormat="Custom" Width="100%">
                            </dx:ASPxDateEdit>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <div>
       <%-- <input type="button" class='btn btn-primary' value='   เพิ่ม   ' onclick="location = 'RMSM_RMM_MEETING_DetailView.aspx?id=-1';" />--%>
        <input type="button" class='btn btn-primary' value='   ค้นหา   ' onclick="location = '#';" />
        <input type="button" class='btn btn-primary' value='   ล้างข้อมูล   ' onclick="location = '#';" />

    </div>

    <br />
    <div>
        <label for="" style="color: gray;">พบ xxx รายการ</label>
    </div>

    <div>
        <div>


            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_ListView" runat="server" Width="100%"
                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                DataSourceID="dsRMSM_RMM_MEETING_ListView" KeyFieldName="MEETING_ID" ClientInstanceName="viewRMSM_RMM_MEETING_ListView" Theme="Metropolis">
                <Columns>

                  
                    <dx:GridViewDataTextColumn FieldName="MEETING_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                      <dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ชื่อเรื่อง" FieldName="MEETING_CODE" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>

                      <dx:GridViewDataTextColumn Caption="วันที่" FieldName="MEETING_DATE" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="เวลา" FieldName="MEETING_TIME" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ประธาน" FieldName="NAME" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="จำนวนคน" FieldName="NUM_MEETING_PROPLE" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ชื่อผู้ขอใช้" FieldName="NAME" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn CellStyle-HorizontalAlign="Center" Width="5%" VisibleIndex="10" Caption="ดูรายละเอียด">
                        <DataItemTemplate >
                                <img src="../Images/icons/zoom16.png" style="border: none" alt="search" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn CellStyle-HorizontalAlign="Center" Width="5%" VisibleIndex="11" Caption="พิมพ์ใบการจอง">
                        <DataItemTemplate >
                                <img src="images/printer.png" style="border: none" alt="edit" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>


                </Columns>
                <Settings ShowFilterRow="False" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                <SettingsCommandButton>
                    <DeleteButton>
                        <Image ToolTip="ลบ" Url="Images/del.png" />
                    </DeleteButton>
                </SettingsCommandButton>
            </dx:ASPxGridView>
            <a id="fancyBoxRMSM_RMM_MEETING_ListView" class='fancyBox' style="display: none"></a>

        </div>
    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select '-1' ROOM_ID,'กรุณาเลือก' ROOM_NAME UNION select ROOM_ID,ROOM_NAME from RMSM_MDM_ROOM_INFO where RECORD_STATUS='A'"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING WHERE [MEETING_ID] = @MEETING_ID"
            SelectCommand="SELECT [MEETING_ID]
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
,[RMSM_MDM_ROOM_INFO].ROOM_ID
,[MEETING_CODE]
,'5' as NUM_MEETING_PROPLE
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,convert(varchar,[MEETING_REQUEST_START_DATE],103)+' - '+convert(varchar,[MEETING_REQUEST_END_DATE],103) as MEETING_DATE
,'8:30-10:30' as MEETING_TIME
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME
FROM [dbo].[RMSM_RMM_MEETING]
LEFT JOIN  [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_RMM_MEETING].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_RMM_MEETING].[MEETING_REQUEST_OFFICER] = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
WHERE [dbo].[RMSM_RMM_MEETING].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

