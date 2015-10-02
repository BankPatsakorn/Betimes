<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_Detail" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
		var lkuValueId="";
		var lkuLabelId="";
        $(document).ready(function () {
            $('.fancyBox').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    location.reload();
                }
            });
			$('.fancyBoxLku').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    
                }
            });
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
            $("#" + lkuLabelId).val(val);
        }

        function OpenChildDetail(id, href) {
            $("#" + id).attr("href", href);
            $("#" + id).click();
        }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="form-group col-sm-12" style="margin-top: 20px;">
                    <div class="col-sm-offset-3 col-sm-6">
                        <asp:Button ID="btnSave" runat="server" Text="�ѹ�֡" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="¡��ԡ" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
                    </div>
     </div>
    <div>
<h1></h1>
</div>
<div>
<input type="button" class='btn btn-primary' value=' Save ' />
</div>
<div  class="col-sm-12">
<div  class="panel panel-default"><!--open box 14-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
สิ่งส่งมอบ
</div>
<div class="panel-body"><!--open box body-->
<div ID="PERIOD_DET_DESC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สิ่งส่งมอบ :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_DET_DESC" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_DET_QUANTITY" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">จำนวน :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_DET_QUANTITY" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="UNIT_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยนับ :</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlUNIT_ID"  runat="server" 
    DropDownStyle="DropDown"   CssClass="form-control"
    DataSourceID="ds" 
    TextField="" ValueField=""
    Width="100%" />
                         </div>
    </div>
<div ID="PERIOD_DET_REMARK" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หมายเหตุ :</label>
                    <div class="col-sm-8">
<dx:ASPxHtmlEditor ID="ctlPERIOD_DET_REMARK" CssClass="form-control" runat="server" 
        Width="0" Height="200" >
    </dx:ASPxHtmlEditor>
                         </div>
    </div>
</div>
</div><!--end box 19-->

</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET WHERE [PERIOD_V_DET_ID] = @PERIOD_V_DET_ID" 
            SelectCommand="select 
CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_DESC
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_QUANTITY
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.UNIT_ID
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_REMARK
 
from CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET 
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_V_DET_ID=@PERIOD_V_DET_ID" 
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET
(
PERIOD_DET_DESC
,PERIOD_DET_QUANTITY
,UNIT_ID
,PERIOD_DET_REMARK
)
values
(
@PERIOD_DET_DESC
,@PERIOD_DET_QUANTITY
,@UNIT_ID
,@PERIOD_DET_REMARK
)" 
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET 
set 
PERIOD_DET_DESC=@PERIOD_DET_DESC
,PERIOD_DET_QUANTITY=@PERIOD_DET_QUANTITY
,UNIT_ID=@UNIT_ID
,PERIOD_DET_REMARK=@PERIOD_DET_REMARK
 
where  1=1 
 AND PERIOD_V_DET_ID=@PERIOD_V_DET_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="PERIOD_V_DET_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="PERIOD_V_DET_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

