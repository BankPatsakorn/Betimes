<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_AGENDA_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_AGENDA_DetailView" %>

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
<div class="col-sm-offset-10 col-sm-6">
                        <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
                    </div>
     </div>
<div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">ระเบียบวาระการประชุม</span>
    </div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="AGENDA_SUB_SEQ" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ระเบียบวาระการประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxSpinEdit ID="ctlAGENDA_SUB_SEQ"  runat="server" Height="30"  Width="300">
<SpinButtons ShowIncrementButtons="false"></SpinButtons>
</dx:ASPxSpinEdit>
                        </div>
    </div>
<div ID="AGENDA_SUB_TOPIC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เรื่อง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_SUB_TOPIC" runat="server" Height="30" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_SUB_DESC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รายละเอียด:</label>
                    <div class="col-sm-8">
<dx:ASPxMemo ID="ctlAGENDA_SUB_DESC" runat="server" 
        Width="800" Height="100" >
    </dx:ASPxMemo>
                         </div>
    </div>
<div ID="AGENDA_SUB_BOARD" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">มติที่ประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxMemo ID="ctlAGENDA_SUB_BOARD" runat="server" 
        Width="800" Height="100" >
    </dx:ASPxMemo>
                         </div>
    </div>
</div><!--end col 24-->
</div><!--end row 25-->
<div  class="panel panel-default"><!--open box 26-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body26-->
<!--button27-->
<input type="button" value="Upload" class="btn btn-primary" />
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" KeyFieldName="AGENDA_SUB_DOC"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_DOC" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView','RMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView.aspx?AGENDA_SUB_DOC=<%#Eval("AGENDA_SUB_DOC") %>', viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อเอกสาร" FieldName="DOC_LOGICAL_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="วันที่นำเข้า" FieldName="DOC_IMPORT_DATE" VisibleIndex="4">
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
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 29-->
</div><!--end box 29-->
<div  class="panel panel-default"><!--open box 30-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body30-->
<!--button31-->
<input type="button" value="แนบ URL" class="btn btn-primary" />
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" KeyFieldName="AGENDA_SUB_URL_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_URL_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView','RMSM_RMM_MEETING_AGENDA_SUB_URL_DetailView.aspx?AGENDA_SUB_URL_ID=<%#Eval("AGENDA_SUB_URL_ID") %>', viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
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
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 33-->
</div><!--end box 33-->

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_DOC WHERE [AGENDA_SUB_DOC] = @AGENDA_SUB_DOC" 
            SelectCommand="SELECT [AGENDA_SUB_DOC]
,[DOC_LOGICAL_NAME]
,[DOC_IMPORT_DATE]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO] on
[dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC].DOC_TYPE_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_DOC" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_URL WHERE [AGENDA_SUB_URL_ID] = @AGENDA_SUB_URL_ID" 
            SelectCommand="SELECT [AGENDA_SUB_URL_ID]
,[URL_NO]
,[URL_LINK]
,[CREATE_DATE]
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_URL]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_URL].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_URL_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="" 
            SelectCommand="SELECT RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB]
WHERE AGENDA_SUB_ID = @AGENDA_SUB_ID" 
            InsertCommand="" 
            UpdateCommand="" 
            >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="AGENDA_SUB_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

