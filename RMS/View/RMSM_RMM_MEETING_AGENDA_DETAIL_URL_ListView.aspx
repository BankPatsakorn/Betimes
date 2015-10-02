<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView.aspx.cs" Inherits="RMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" %>

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
        <span style="font-size: 23px">แนบ URL</span>
    </div>
<div>
<input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location='RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" KeyFieldName="AGENDA_DETAIL_URL_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_DETAIL_URL_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_self" href="RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.aspx?AGENDA_DETAIL_URL_ID=<%#Eval("AGENDA_DETAIL_URL_ID") %>"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="URL" FieldName="URL_LINK" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่นำเข้า" FieldName="CREATE_DATE" VisibleIndex="4">
</dx:GridViewDataDateColumn>
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
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_DETAIL_URL WHERE [AGENDA_DETAIL_URL_ID] = @AGENDA_DETAIL_URL_ID" 
            SelectCommand="SELECT [AGENDA_DETAIL_URL_ID]
,[URL_NO]
,[URL_LINK]
,[CREATE_DATE]
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_URL]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_URL].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_DETAIL_URL_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

