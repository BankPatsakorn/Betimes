<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_QUESTION_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_QUESTION_DetailView" %>

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
        <span style="font-size: 23px">สอบถามเรื่องที่ประชุม</span>
    </div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="ROOM_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ห้องประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlROOM_ID"  runat="server" 
    DropDownStyle="DropDown"   Height="30"
    DataSourceID="dsRMSM_MDM_ROOM_INFO" 
    TextField="ROOM_NAME" ValueField="ROOM_ID"
    Width="100%" IncrementalFilteringMode = "StartsWith" />
                         </div>
    </div>
</div><!--end col 21-->
<div  class="col-sm-6"> <!--col 22-->
<div ID="MEETING_SUBJECT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อหัวข้อ/ชื่อเรื่อง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_SUBJECT" runat="server" Height="30" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 24-->
<div  class="col-sm-6"> <!--col 25-->
<div ID="BOARD_ID" class="form-group col-sm-12">
    <label for="" class="col-sm-4 control-label">คณะที่ประชุม:</label>
    <div class="col-sm-8">
        <div class="input-group">
            <asp:HiddenField ID="ctlBOARD_ID" runat="server" ></asp:HiddenField>
            <dx:ASPxTextBox ID="ctlBOARD_ID_label" Width="100%" Height="30"
    runat="server"></dx:ASPxTextBox>
            <span class="input-group-btn">
                  <button id="btnBOARD_ID" class="btn btn-primary" style="width:30px;height:30px"
                     onclick="OpenLku('lkuBOARD_ID', 'BOARD_LookupListView.aspx', 'ContentPlaceHolder1_ctlBOARD_ID', 'ContentPlaceHolder1_ctlBOARD_ID_label_I')"  type="button">
                     <span class="glyphicon glyphicon-search" style="margin-left:-5px"></span></button>
            </span>
        </div>
    </div>
</div>
<a id="lkuBOARD_ID" href="#" class="fancyBoxLku" style="display:none"></a>
</div><!--end col 27-->
<div  class="col-sm-6"> <!--col 28-->
<div ID="MEETING_REQUEST_START_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่เริ่มต้น:</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelMEETING_REQUEST_START_DATE" runat="server">
                        <contenttemplate>
                            <dx:ASPxDateEdit ID="ctlMEETING_REQUEST_START_DATE" Height="30"  AutoPostBack="true" DisplayFormatString="d MMM yyyy"  runat="server" EditFormat="Custom" Width="300">
                            </dx:ASPxDateEdit>
                          </contenttemplate>
                         </asp:UpdatePanel>
                        </div>
    </div>
</div><!--end col 30-->
<div  class="col-sm-6"> <!--col 31-->
<div ID="MEETING_REQUEST_END_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่สิ้นสุด:</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelMEETING_REQUEST_END_DATE" runat="server">
                        <contenttemplate>
                            <dx:ASPxDateEdit ID="ctlMEETING_REQUEST_END_DATE" Height="30"  AutoPostBack="true" DisplayFormatString="d MMM yyyy"  runat="server" EditFormat="Custom" Width="300">
                            </dx:ASPxDateEdit>
                          </contenttemplate>
                         </asp:UpdatePanel>
                        </div>
    </div>
</div><!--end col 33-->
</div><!--end row 34-->
<!--button35-->
<input type="button" value="ค้นหา" class="btn btn-primary" />
<!--button36-->
<input type="button" value="ล้างข้อมูล" class="btn btn-primary" />
<div><div>


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
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_QUESTION_ListView','RMSM_RMM_MEETING_QUESTION_DetailView.aspx?MEETING_ID=<%#Eval("MEETING_ID") %>', viewRMSM_RMM_MEETING_QUESTION_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
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

</div></div>
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
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_QUESTION_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="" 
            SelectCommand="SELECT [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
,RMSM_MDM_ROOM_INFO.ROOM_NAME
,RMSM_RMM_MEETING.MEETING_SUBJECT
,[dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,RMSM_RMM_MEETING.MEETING_REQUEST_START_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_END_DATE
FROM RMSM_RMM_MEETING
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
RMSM_RMM_MEETING.ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
LEFT JOIN [dbo].[RMSM_MDM_BOARD_MEMBER] on
RMSM_RMM_MEETING.BOARD_ID = [dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID
LEFT JOIN [OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO] on
[dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID = [OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].BOARD_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
WHERE MEETING_ID = @MEETING_ID" 
            InsertCommand="" 
            UpdateCommand="" 
            >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="MEETING_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_MDM_BOARD_MEMBER" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select BOARD_MEMBER_ID,BOARD_MEMBER_ID from RMSM_MDM_BOARD_MEMBER" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO" >
             </asp:SqlDataSource>

</div>
</asp:Content>

