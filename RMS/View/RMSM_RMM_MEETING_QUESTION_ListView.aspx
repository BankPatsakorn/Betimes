<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_QUESTION_ListView.aspx.cs" Inherits="RMSM_RMM_MEETING_QUESTION_ListView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
            .dis-ctl {
               background-color:#DDDDDD;
            }
            .control-label {
               width:150px;
               height: 30px;
            }

</style>
    <script type="text/javascript">
		var lkuValueId="";
		var lkuLabelId="";
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
			selectedPopupView=viewName;
        }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager" runat="server" />
     <div class="form-group col-sm-12" style="margin-top: 20px;">
     </div>
<div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">สอบถามเรื่องที่ประชุม</span>
    </div>
<div>
<input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location='RMSM_RMM_MEETING_QUESTION_DetailView.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_QUESTION_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_QUESTION_ListView" KeyFieldName="MEETING_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_QUESTION_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MEETING_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_self" href="RMSM_RMM_MEETING_QUESTION_DetailView.aspx?MEETING_ID=<%#Eval("MEETING_ID") %>"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อหัวข้อ/ชื่อเรื่อง" FieldName="MEETING_SUBJECT" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="คณะที่ประชุม" FieldName="NAME" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="วันที่ประชุม" FieldName="DATE_TIME" VisibleIndex="6">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_QUESTION_ListView" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_QUESTION_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING WHERE [MEETING_ID] = @MEETING_ID" 
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING].MEETING_ID
,[dbo].[RMSM_MDM_ROOM_INFO].[ROOM_ID]
,[ROOM_NAME]
,[MEETING_SUBJECT]
,[dbo].[RMSM_MDM_BOARD_MEMBER].[BOARD_ID]
,[OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].BOARD_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,CONVERT(varchar,[MEETING_REQUEST_START_DATE],110)+'/'+CONVERT(varchar,[MEETING_REQUEST_START_TIME])+'-'+CONVERT(varchar,[MEETING_REQUEST_END_TIME]) as DATE_TIME
FROM [dbo].[RMSM_RMM_MEETING]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_RMM_MEETING].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
LEFT JOIN [dbo].[RMSM_MDM_BOARD_MEMBER] on
[dbo].[RMSM_RMM_MEETING].BOARD_ID = [dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID
LEFT JOIN [OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO] on
[dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID = [OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].BOARD_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
WHERE [dbo].[RMSM_RMM_MEETING].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

