<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView" %>

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
        <span style="font-size: 23px">แนบเอกสารประกอบ</span>
    </div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="DOC_TAG" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">แนบเอกสาร:</label>
                    <div class="col-sm-8">
                        <asp:FileUpload ID="ctlDOC_TAG" runat="server"   /><br />
                        <asp:HyperLink ID="linkDOC_TAG" Visible="false" runat="server"></asp:HyperLink>
                     </div>
          </div>
<div  class="form-group col-sm-12">
                    <label for="" class="col-sm-12">รองรับ File .pdf, .jpeg, .doc, .docx, .xls, .xlsx, .ppt, .txt ขนาดไม่เกิน 5MB. </label>
    </div>
<div ID="DOC_LOGICAL_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อเอกสาร:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlDOC_LOGICAL_NAME" runat="server" Height="30" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="DOC_IMPORT_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่นำเข้าเอกสาร:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlDOC_IMPORT_DATE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="DOC_TYPE_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ประเภทเอกสาร:</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlDOC_TYPE_ID"  runat="server" 
    DropDownStyle="DropDown"   Height="30"
    DataSourceID="dsCOMM_MDM_DOC_TYPE_INFO" 
    TextField="DOC_TYPE_NAME" ValueField="DOC_TYPE_ID"
    Width="100%" IncrementalFilteringMode = "StartsWith" />
                         </div>
    </div>
</div><!--end col 25-->
</div><!--end row 26-->

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_DOC WHERE [AGENDA_SUB_DOC] = @AGENDA_SUB_DOC" 
            SelectCommand="select 
RMSM_RMM_MEETING_AGENDA_SUB_DOC.AGENDA_SUB_DOC
,RMSM_RMM_MEETING_AGENDA_SUB_DOC.DOC_TAG
,RMSM_RMM_MEETING_AGENDA_SUB_DOC.DOC_LOGICAL_NAME
,RMSM_RMM_MEETING_AGENDA_SUB_DOC.DOC_IMPORT_DATE
,RMSM_RMM_MEETING_AGENDA_SUB_DOC.DOC_TYPE_ID
 
from RMSM_RMM_MEETING_AGENDA_SUB_DOC 
left join [OPM_COMMON_DATA].[dbo].COMM_MDM_DOC_TYPE_INFO on RMSM_RMM_MEETING_AGENDA_SUB_DOC.DOC_TYPE_ID = COMM_MDM_DOC_TYPE_INFO.DOC_TYPE_ID  
where  1=1  AND RMSM_RMM_MEETING_AGENDA_SUB_DOC.AGENDA_SUB_DOC=@AGENDA_SUB_DOC" 
            InsertCommand="insert into RMSM_RMM_MEETING_AGENDA_SUB_DOC
(
DOC_TAG
,DOC_LOGICAL_NAME
,DOC_IMPORT_DATE
,DOC_TYPE_ID
)
values
(
@DOC_TAG
,@DOC_LOGICAL_NAME
,@DOC_IMPORT_DATE
,@DOC_TYPE_ID
)" 
            UpdateCommand="update RMSM_RMM_MEETING_AGENDA_SUB_DOC 
set 
DOC_TAG=@DOC_TAG
,DOC_LOGICAL_NAME=@DOC_LOGICAL_NAME
,DOC_IMPORT_DATE=@DOC_IMPORT_DATE
,DOC_TYPE_ID=@DOC_TYPE_ID
 
where  1=1 
 AND AGENDA_SUB_DOC=@AGENDA_SUB_DOC" 
            >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_DOC" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="AGENDA_SUB_DOC" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsCOMM_MDM_DOC_TYPE_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select DOC_TYPE_NAME,DOC_TYPE_ID from [OPM_COMMON_DATA].[dbo].COMM_MDM_DOC_TYPE_INFO" >
             </asp:SqlDataSource>

</div>
</asp:Content>

