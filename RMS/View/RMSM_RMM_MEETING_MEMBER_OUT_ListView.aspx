<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_MEMBER_OUT_ListView.aspx.cs" Inherits="RMSM_RMM_MEETING_MEMBER_OUT_ListView" %>

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
        <span style="font-size: 23px">บุคคลภายนอก สปน.</span>
    </div>
<div>
<input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location='RMSM_RMM_MEETING_MEMBER_OUT_DetailView.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_MEMBER_OUT_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_MEMBER_OUT_ListView" KeyFieldName="MEETING_MEMBER_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_MEMBER_OUT_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MEETING_MEMBER_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_self" href="RMSM_RMM_MEETING_MEMBER_OUT_DetailView.aspx?MEETING_MEMBER_ID=<%#Eval("MEETING_MEMBER_ID") %>"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อ-นามสกุล" FieldName="MEETING_MEMBER_FULL_NAME_OUT" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ตำแหน่ง" FieldName="MEETING_MEMBER_POSITION_OUT" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="หน่วยงาน" FieldName="MEETING_MEMBER_ORG_OUT" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ตำแหน่งประชุม" FieldName="MEETING_POSITION_NAME" VisibleIndex="6">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataSpinEditColumn Caption="สถานะของบุคคล" FieldName="MEETING_MEMBER_TYPE" VisibleIndex="7">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataTextColumn Caption="สถานะการเข้าร่วม" FieldName="MEETING_STATUS_NAME" VisibleIndex="8">
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
<a id="fancyBoxRMSM_RMM_MEETING_MEMBER_OUT_ListView" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_MEMBER_OUT_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_MEMBER WHERE [MEETING_MEMBER_ID] = @MEETING_MEMBER_ID" 
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_ID
,[dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_ID]
,[dbo].[RMSM_MDM_MEETING_STATUS_INFO].[MEETING_STATUS_ID]
,[dbo].[RMSM_RMM_MEETING_MEMBER].[MEETING_MEMBER_FULL_NAME_OUT]
,[dbo].[RMSM_RMM_MEETING_MEMBER].[MEETING_MEMBER_ORG_OUT]
,[dbo].[RMSM_RMM_MEETING_MEMBER].[MEETING_MEMBER_POSITION_OUT]
,[dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_NAME]
,case when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 0 then 'ผู้บริหาร สปน.' 
 when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 1 then 'บุลลคภายใน สปน.' 
 when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 2 then 'บุลลคภายนอก สปน.' end as MEETING_MEMBER_TYPE
,[dbo].[RMSM_MDM_MEETING_STATUS_INFO].MEETING_STATUS_NAME
FROM [dbo].[RMSM_RMM_MEETING_MEMBER]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEMBER_OWNER_OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [dbo].[RMSM_MDM_MEETING_POSITION_INFO] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_POSITION_ID = [dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_ID]
LEFT JOIN [dbo].[RMSM_MDM_MEETING_STATUS_INFO] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_STATUS = [dbo].[RMSM_MDM_MEETING_STATUS_INFO].[MEETING_STATUS_ID]
WHERE [dbo].[RMSM_RMM_MEETING_MEMBER].RECORD_STATUS = 'A' and [dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE=2" >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

