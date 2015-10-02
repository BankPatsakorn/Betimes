<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail" %>

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
<div ID="PROJECT_MEMBER_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPROJECT_MEMBER_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PROJECT_MEMBER_LNAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">นามสกุล:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPROJECT_MEMBER_LNAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PROJECT_MEMBER_ORG" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สังกัด :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPROJECT_MEMBER_ORG" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PROJECT_MEMBER_TEL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPROJECT_MEMBER_TEL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PROJECT_MEMBER_START_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่เริ่มปฏิบัติงาน  :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPROJECT_MEMBER_START_DATE" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="PROJECT_MEMBER_END_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่สิ้นสุด :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPROJECT_MEMBER_END_DATE" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>

</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_MEMBER WHERE [PROJECT_MEMBER_ID] = @PROJECT_MEMBER_ID" 
            SelectCommand="select 
CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_NAME
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_LNAME
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_ORG
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_TEL
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_START_DATE
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_END_DATE
 
from CRMT_PMM_PROJECT_CONTRACT_MEMBER 
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_ID=@PROJECT_MEMBER_ID" 
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT_MEMBER
(
PROJECT_MEMBER_NAME
,PROJECT_MEMBER_LNAME
,PROJECT_MEMBER_ORG
,PROJECT_MEMBER_TEL
,PROJECT_MEMBER_START_DATE
,PROJECT_MEMBER_END_DATE
)
values
(
@PROJECT_MEMBER_NAME
,@PROJECT_MEMBER_LNAME
,@PROJECT_MEMBER_ORG
,@PROJECT_MEMBER_TEL
,@PROJECT_MEMBER_START_DATE
,@PROJECT_MEMBER_END_DATE
)" 
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT_MEMBER 
set 
PROJECT_MEMBER_NAME=@PROJECT_MEMBER_NAME
,PROJECT_MEMBER_LNAME=@PROJECT_MEMBER_LNAME
,PROJECT_MEMBER_ORG=@PROJECT_MEMBER_ORG
,PROJECT_MEMBER_TEL=@PROJECT_MEMBER_TEL
,PROJECT_MEMBER_START_DATE=@PROJECT_MEMBER_START_DATE
,PROJECT_MEMBER_END_DATE=@PROJECT_MEMBER_END_DATE
 
where  1=1 
 AND PROJECT_MEMBER_ID=@PROJECT_MEMBER_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="PROJECT_MEMBER_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

