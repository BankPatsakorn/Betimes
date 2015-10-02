<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail" %>

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
บุคลากรที่เกี่ยวข้อง
</div>
<div class="panel-body"><!--open box body-->
<div ID="CONTRACT_V_FNAME_NAME_THA" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_FNAME_NAME_THA" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_LNAME_NAME_THA" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สกุล :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_LNAME_NAME_THA" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_COMPANY_POSITION" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่ง :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_COMPANY_POSITION" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_COMPANY_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงาน :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_COMPANY_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_COMPANY_TEL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์ :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_COMPANY_TEL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_COMPANY_EMAIL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">อีเมล:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_COMPANY_EMAIL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
</div>
</div><!--end box 21-->

</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_V_MEMBER WHERE [PROJECT_V_MEMBER_ID] = @PROJECT_V_MEMBER_ID" 
            SelectCommand="select 
CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_FNAME_NAME_THA
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_LNAME_NAME_THA
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_POSITION
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_NAME
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_TEL
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_EMAIL
 
from CRMT_PMM_PROJECT_CONTRACT_V_MEMBER 
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.PROJECT_V_MEMBER_ID=@PROJECT_V_MEMBER_ID" 
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT_V_MEMBER
(
CONTRACT_V_FNAME_NAME_THA
,CONTRACT_V_LNAME_NAME_THA
,CONTRACT_V_COMPANY_POSITION
,CONTRACT_V_COMPANY_NAME
,CONTRACT_V_COMPANY_TEL
,CONTRACT_V_COMPANY_EMAIL
)
values
(
@CONTRACT_V_FNAME_NAME_THA
,@CONTRACT_V_LNAME_NAME_THA
,@CONTRACT_V_COMPANY_POSITION
,@CONTRACT_V_COMPANY_NAME
,@CONTRACT_V_COMPANY_TEL
,@CONTRACT_V_COMPANY_EMAIL
)" 
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT_V_MEMBER 
set 
CONTRACT_V_FNAME_NAME_THA=@CONTRACT_V_FNAME_NAME_THA
,CONTRACT_V_LNAME_NAME_THA=@CONTRACT_V_LNAME_NAME_THA
,CONTRACT_V_COMPANY_POSITION=@CONTRACT_V_COMPANY_POSITION
,CONTRACT_V_COMPANY_NAME=@CONTRACT_V_COMPANY_NAME
,CONTRACT_V_COMPANY_TEL=@CONTRACT_V_COMPANY_TEL
,CONTRACT_V_COMPANY_EMAIL=@CONTRACT_V_COMPANY_EMAIL
 
where  1=1 
 AND PROJECT_V_MEMBER_ID=@PROJECT_V_MEMBER_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_V_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="PROJECT_V_MEMBER_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

