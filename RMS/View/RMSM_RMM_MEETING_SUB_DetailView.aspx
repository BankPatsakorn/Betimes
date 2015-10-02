<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_SUB_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_SUB_DetailView" %>

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
    <div>
<h1></h1>
</div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="AGENDA_SUB_SEQ" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ระเบียบวาระการประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxSpinEdit ID="ctlAGENDA_SUB_SEQ"  runat="server" Height="30"  Width="800">
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

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SUB_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB WHERE [AGENDA_SUB_ID] = @AGENDA_SUB_ID" 
            SelectCommand="select 
RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_ID
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
 
from RMSM_RMM_MEETING_AGENDA_SUB 
where  1=1  AND RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_ID=@AGENDA_SUB_ID" 
            InsertCommand="insert into RMSM_RMM_MEETING_AGENDA_SUB
(
AGENDA_SUB_SEQ
,AGENDA_SUB_TOPIC
,AGENDA_SUB_DESC
,AGENDA_SUB_BOARD
)
values
(
@AGENDA_SUB_SEQ
,@AGENDA_SUB_TOPIC
,@AGENDA_SUB_DESC
,@AGENDA_SUB_BOARD
)" 
            UpdateCommand="update RMSM_RMM_MEETING_AGENDA_SUB 
set 
AGENDA_SUB_SEQ=@AGENDA_SUB_SEQ
,AGENDA_SUB_TOPIC=@AGENDA_SUB_TOPIC
,AGENDA_SUB_DESC=@AGENDA_SUB_DESC
,AGENDA_SUB_BOARD=@AGENDA_SUB_BOARD
 
where  1=1 
 AND AGENDA_SUB_ID=@AGENDA_SUB_ID" 
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

