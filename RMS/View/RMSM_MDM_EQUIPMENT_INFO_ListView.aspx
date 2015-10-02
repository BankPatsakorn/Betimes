<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_EQUIPMENT_INFO_ListView.aspx.cs" Inherits="RMSM_MDM_EQUIPMENT_INFO_ListView" %>

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
        <span style="font-size: 23px">จัดการอุปกรณ์การประชุม</span><span style="font-size: 20px;color:gray;"> (RMS_UT0502)</span>
    </div>
<div>
<input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location='RMSM_MDM_EQUIPMENT_INFO_DetailView.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewRMSM_MDM_EQUIPMENT_INFO_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_MDM_EQUIPMENT_INFO_ListView" KeyFieldName="EQUIPMENT_ID"  ClientInstanceName="viewRMSM_MDM_EQUIPMENT_INFO_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="EQUIPMENT_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_self" href="RMSM_MDM_EQUIPMENT_INFO_DetailView.aspx?EQUIPMENT_ID=<%#Eval("EQUIPMENT_ID") %>"><img src="images/edit.png" style="border:none" alt="edit" /></a>
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
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_MDM_EQUIPMENT_INFO_ListView" class='fancyBox'  style="display:none"></a>

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
WHERE [dbo].[RMSM_MDM_EQUIPMENT_INFO].RECORD_STATUS = 'A' " >
            <DeleteParameters>
                <asp:Parameter Name="EQUIPMENT_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

