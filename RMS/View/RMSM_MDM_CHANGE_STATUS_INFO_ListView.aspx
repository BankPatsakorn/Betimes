<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_CHANGE_STATUS_INFO_ListView.aspx.cs" Inherits="RMSM_MDM_CHANGE_STATUS_INFO_ListView" %>

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
 
            <div class="form-group col-sm-12" style="margin-top: 20px;">
            </div>
            <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
                <span style="font-size: 23px">การเปลี่ยนสถานะห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0507)</span>
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
            <div>
                <input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location = 'RMSM_MDM_CHANGE_STATUS_INFO_DetailView.aspx?id=-1';" />

               <asp:Button Text="ค้นหา" CssClass="btn btn-primary" ID="btnSearch" OnClick="btnSearch_Click" runat="server" />
            </div>
            <br />
      

    <div>
        <div>
            <asp:Label ID="lblNumberInGrid" Width="100%" Text="พบ xxx รายการ" runat="server"  CssClass="foundNumberObject"/>
            
            <dx:ASPxGridView ID="viewRMSM_MDM_CHANGE_STATUS_INFO_ListView" runat="server" Width="100%"
                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                DataSourceID="dsRMSM_MDM_CHANGE_STATUS_INFO_ListView" KeyFieldName="CHANGE_STATUS_ID" ClientInstanceName="viewRMSM_MDM_CHANGE_STATUS_INFO_ListView" Theme="Metropolis">
                <Columns>

                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="False"
                        ShowDeleteButton="True" Caption="ลบ" CellStyle-HorizontalAlign="Center" Width="5%" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="CHANGE_STATUS_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="1" CellStyle-HorizontalAlign="Center" Width="5%" Caption="แก้ไข">
                        <DataItemTemplate>
                            <a target="_self" href="RMSM_MDM_CHANGE_STATUS_INFO_DetailView.aspx?CHANGE_STATUS_ID=<%#Eval("CHANGE_STATUS_ID") %>">
                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="วันที่เริ่มต้น" FieldName="CHANGE_START_DATE" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="วันที่สิ้นสุด" FieldName="CHANGE_END_DATE" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="สถานะห้องประชุม" FieldName="CHANGE_STATUS_NAME" VisibleIndex="6">
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
            <a id="fancyBoxRMSM_MDM_CHANGE_STATUS_INFO_ListView" class='fancyBox' style="display: none"></a>

        </div>
    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_CHANGE_STATUS_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_CHANGE_STATUS_INFO WHERE [CHANGE_STATUS_ID] = @CHANGE_STATUS_ID"
            SelectCommand="SELECT [dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[CHANGE_STATUS_ID]
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME
,[dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[CHANGE_START_DATE]
,[dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[CHANGE_END_DATE]
,case when [dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[CHANGE_STATUS]=0 then 'ปกติ' when [dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[CHANGE_STATUS]=1 then 'งดใช้งาน' when [dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[CHANGE_STATUS]=2 then 'ไม่ใช้งาน' end as CHANGE_STATUS_NAME
FROM [dbo].[RMSM_MDM_CHANGE_STATUS_INFO]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[ROOM_ID] = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
WHERE [dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[RECORD_STATUS] = 'A' AND
[dbo].[RMSM_MDM_CHANGE_STATUS_INFO].[ROOM_ID] LIKE '%'+@ROOM_ID+'%'">
            <DeleteParameters>
                <asp:Parameter Name="CHANGE_STATUS_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="ROOM_ID" ConvertEmptyStringToNull="false" DefaultValue="" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="select '-1' ROOM_ID,'กรุณาเลือก' ROOM_NAME UNION select ROOM_ID,ROOM_NAME from RMSM_MDM_ROOM_INFO where RECORD_STATUS='A'"></asp:SqlDataSource>
</asp:Content>

