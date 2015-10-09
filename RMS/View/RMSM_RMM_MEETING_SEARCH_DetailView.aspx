<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_SEARCH_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_SEARCH_DetailView" %>

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
        <span style="font-size: 23px">แก้ไข/ยกเลิกการจองห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0301)</span>

    </div>

    <div class="form-group col-sm-12" style="margin-top: 10px;">
        <div class="col-sm-12 text-right">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>

    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-6">
                <!--col 19-->
                <div id="ROOM_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ห้องประชุม:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ctlROOM_ID" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            DataSourceID="dsRMSM_MDM_ROOM_INFO"
                            TextField="ROOM_NAME" ValueField="ROOM_ID"
                            Width="100%" IncrementalFilteringMode="StartsWith" />
                    </div>
                </div>
            </div>
            <!--end col 21-->
            <div class="col-sm-6">
                <!--col 22-->
                <div id="MEETING_SUBJECT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อหัวข้อ/ชื่อเรื่อง:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlMEETING_SUBJECT" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
            </div>
            <!--end col 24-->
            <!--button25-->
            <!--button26-->
          
        </div>
          <div>
              
                <input type="button" value="ค้นหา" class="btn btn-primary" />
                <input type="button" value="ล้างข้อมูล" class="btn btn-primary" /></div>
        <!--end row 27-->
        <div>&nbsp;</div>
      
        <div>
            <div>
                 <label for="" class="foundNumberObject">พบ xxx รายการ</label>

                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_SEARCH_ListView" runat="server" Width="100%"
                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                    DataSourceID="dsRMSM_RMM_MEETING_SEARCH_ListView" KeyFieldName="MEETING_ID" ClientInstanceName="viewRMSM_RMM_MEETING_SEARCH_ListView" Theme="Metropolis">
                    <Columns>

                        <dx:GridViewDataTextColumn FieldName="MEETING_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                            <DataItemTemplate>
                                <a target="_blank" onclick="window.location='RMSM_RMM_MEETING_CANCLE_DetailView.aspx?MEETING_ID=<%#Eval("MEETING_ID") %>';">
                                    <img src="images/edit.png" style="border: none" alt="edit" /></a>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="ชื่อหัวข้อ/ชื่อเรื่อง" FieldName="MEETING_SUBJECT" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="วันที่/เวลา" FieldName="DATE_TIME" VisibleIndex="5">
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
                <a id="fancyBoxRMSM_RMM_MEETING_SEARCH_ListView" class='fancyBox' style="display: none"></a>

            </div>
        </div>
    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SEARCH_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING WHERE [MEETING_ID] = @MEETING_ID"
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING].MEETING_ID
,[dbo].[RMSM_MDM_ROOM_INFO].[ROOM_ID]
,[ROOM_NAME]
,[MEETING_SUBJECT]
,'7 ก.ย. 2558 8:30น. - 11:30น.'as DATE_TIME
FROM [dbo].[RMSM_RMM_MEETING]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_RMM_MEETING].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
WHERE [dbo].[RMSM_RMM_MEETING].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SEARCH_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING WHERE [MEETING_ID] = @MEETING_ID"
            SelectCommand="select 
RMSM_RMM_MEETING.MEETING_ID
,RMSM_RMM_MEETING.ROOM_ID
,RMSM_RMM_MEETING.MEETING_SUBJECT
 
from RMSM_RMM_MEETING 
left join RMSM_MDM_ROOM_INFO on RMSM_RMM_MEETING.ROOM_ID = RMSM_MDM_ROOM_INFO.ROOM_ID  
where  1=1  AND RMSM_RMM_MEETING.MEETING_ID=@MEETING_ID"
            InsertCommand="insert into RMSM_RMM_MEETING
(
ROOM_ID
,MEETING_SUBJECT
)
values
(
@ROOM_ID
,@MEETING_SUBJECT
)"
            UpdateCommand="update RMSM_RMM_MEETING 
set 
ROOM_ID=@ROOM_ID
,MEETING_SUBJECT=@MEETING_SUBJECT
 
where  1=1 
 AND MEETING_ID=@MEETING_ID">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>

    </div>
</asp:Content>

