<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_ADMIN_INFO_ListView.aspx.cs" Inherits="RMSM_MDM_ADMIN_INFO_ListView" %>

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
    <div>
<div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">ผู้ดูแลห้องประชุม</span><span style="font-size: 20px;color:gray;"> (RMS_UT0506)</span>
    </div>
</div>
<div>
<input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location='RMSM_MDM_ADMIN_INFO_DetailView.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewRMSM_MDM_ADMIN_INFO_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_MDM_ADMIN_INFO_ListView" KeyFieldName="ADMIN_ID"  ClientInstanceName="viewRMSM_MDM_ADMIN_INFO_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ADMIN_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_self" href="RMSM_MDM_ADMIN_INFO_DetailView.aspx?ADMIN_ID=<%#Eval("ADMIN_ID") %>"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="รหัสห้องประชุม" FieldName="ROOM_CODE" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อผู้ดูแลห้องประชุม" FieldName="NAME" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="หน่วยงาน" FieldName="UNIT_NAME" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="6">
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
<a id="fancyBoxRMSM_MDM_ADMIN_INFO_ListView" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsRMSM_MDM_ADMIN_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_MDM_ADMIN_INFO WHERE [ADMIN_ID] = @ADMIN_ID" 
            SelectCommand="SELECT DISTINCT [dbo].[RMSM_MDM_ADMIN_INFO].ADMIN_ID
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

" >
            <DeleteParameters>
                <asp:Parameter Name="ADMIN_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

