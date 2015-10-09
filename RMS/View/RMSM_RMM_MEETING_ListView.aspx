<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_ListView.aspx.cs" Inherits="RMSM_RMM_MEETING_ListView" %>

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
        <span style="font-size: 23px">บันทึกการจองห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0102)</span>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div id="Div2" class="form-group col-sm-6" style="display:none">
                <label for="" class="col-sm-4">คณะกรรมการที่ประชุม:</label>
                <div class="col-sm-6">
                    <div class="input-group">
                        <dx:ASPxTextBox ID="ctlOFFICER_ID" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                        <dx:ASPxTextBox ID="ctlOFFICER_ID_label" Width="100%" Height="30"
                            runat="server">
                        </dx:ASPxTextBox>
                        <span class="input-group-btn">
                            <button id="btnOFFICER_ID" class="btn btn-primary" style="width: 30px; height: 30px"
                                onclick="OpenLku('lkuOFFICER_ID', 'VIEW_PERSONAL_LookupListView.aspx', '<%=ctlOFFICER_ID.ClientID %>_I', '<%=ctlOFFICER_ID_label.ClientID %>_I')" type="button">
                                <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
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
            <div id="Div3" class="form-group col-sm-6">
                <label for="" class="col-sm-4 ">วันที่จองห้องประชุม:</label>
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
        <div class="col-sm-10">
            <div id="Div1" class="form-group col-sm-12">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            
        </div>
    </div>
    <div>
        <input type="button" class='btn btn-primary' value='   เพิ่ม   ' onclick="location = 'RMSM_RMM_MEETING_DetailView.aspx?id=-1';" />
        <input type="button" class='btn btn-primary' value='   ค้นหา   ' onclick="location = '#';" />
        <input type="button" class='btn btn-primary' value='   ล้างข้อมูล   ' onclick="location = '#';" />

    </div>

    <br />
    <div>
        <div>

             <label for="" class="foundNumberObject">พบ xxx รายการ</label>

            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_ListView" runat="server" Width="100%"
                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                DataSourceID="dsRMSM_RMM_MEETING_ListView" KeyFieldName="MEETING_ID" ClientInstanceName="viewRMSM_RMM_MEETING_ListView" Theme="Metropolis">
                <Columns>

                    <dx:GridViewCommandColumn   SelectAllCheckboxMode="Page" ShowClearFilterButton="False"
                        ShowDeleteButton="true" ShowSelectCheckbox="False" Width="5%" Caption="ลบ" ButtonType="Image" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="MEETING_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn CellStyle-HorizontalAlign="Center" Width="5%" VisibleIndex="1" Caption="แก้ไข">
                        <DataItemTemplate >
                            <a target="_self" href="RMSM_RMM_MEETING_DetailView.aspx?MEETING_ID=<%#Eval("MEETING_ID") %>">
                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="รหัสการจองห้องประชุม" FieldName="MEETING_CODE" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ผู้จองห้องประชุม" FieldName="NAME" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="วันที่จองห้องประชุม" FieldName="MEETING_DATE" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>

                    
                    <dx:GridViewDataTextColumn CellStyle-HorizontalAlign="Center" Width="5%" VisibleIndex="7" Caption="พิมพ์ใบการจอง">
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
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,convert(varchar,[MEETING_REQUEST_START_DATE],103)+' - '+convert(varchar,[MEETING_REQUEST_END_DATE],103) as MEETING_DATE
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

