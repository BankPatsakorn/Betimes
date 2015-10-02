<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_V_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_V_Detail" %>

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
สัญญา
</div>
<div class="panel-body"><!--open box body-->
<div ID="VENDOR_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อบริษัท :</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlVENDOR_ID"  runat="server" 
    DropDownStyle="DropDown"   CssClass="form-control"
    DataSourceID="ds" 
    TextField="" ValueField=""
    Width="100%" />
                         </div>
    </div>
<div ID="CONTRACT_V_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สัญญาเลขที่ :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_CODE" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อสัญญา :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_SIGN_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่ลงนามในสัญญา :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlCONTRACT_V_SIGN_DATE" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="CONTRACT_V_START_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่เริ่มงาน :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlCONTRACT_V_START_DATE" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="CONTRACT_V_END_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่สิ้นสุด :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlCONTRACT_V_END_DATE" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="CONTRACT_V_AMOUNT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">มูลค่าสัญญา(บาท) :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCONTRACT_V_AMOUNT" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CONTRACT_V_REMARK" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หมายเหตุ :</label>
                    <div class="col-sm-8">
<dx:ASPxHtmlEditor ID="ctlCONTRACT_V_REMARK" CssClass="form-control" runat="server" 
        Width="0" Height="200" >
    </dx:ASPxHtmlEditor>
                         </div>
    </div>
<div class="tabbable"><!--open tabhead 23-->
<ul id="tabA" class="nav nav-tabs tab-bricky">
<li><!--open tabpage 24-->
<a href="#grideTab1" data-toggle="tab">
คณะตรวจรับ
</a>
</li>
<li><!--open tabpage 28-->
<a href="#grideTab2" data-toggle="tab">
งวดงาน
</a>
</li>
<li><!--open tabpage 33-->
<a href="#grideTab3" data-toggle="tab">
สิ่งส่งมอบ
</a>
</li>
</ul>
<!--end tabhead 38-->
<div class="tab-content"><!--open tab 23-->
<div class="tab-pane " id="grideTab1"><!--open tabpage 24-->
<!--button25-->
<input type="button" value="เพิ่มรายการ" class="btn btn-primary" />
<div></div><div></div></div><!--end tabpage 27-->
<div class="tab-pane " id="grideTab2"><!--open tabpage 28-->
<div ID="PERIOD_DURATION_TOTAL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">จำนวนวันรวม :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_DURATION_TOTAL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_DURATION_PERCENT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">จำนวนเปอร์เซ็นต์เงินรวม :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_DURATION_PERCENT" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div></div><div></div></div><!--end tabpage 32-->
<div class="tab-pane " id="grideTab3"><!--open tabpage 33-->
<div ID="PERIOD_DET_NO" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">งวดงานที่ :</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlPERIOD_DET_NO"  runat="server" 
    DropDownStyle="DropDown"   CssClass="form-control"
    DataSourceID="ds" 
    TextField="" ValueField=""
    Width="100%" />
                         </div>
    </div>
<!--button35-->
<input type="button" value="เพิ่มสิ่งส่งมอบ" class="btn btn-primary" />
<div></div><div></div></div><!--end tabpage 37-->
</div>
<!--end tab 38-->
</div>
</div><!--end box 39-->

</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_V WHERE [CONTRACT_V_ID] = @CONTRACT_V_ID" 
            SelectCommand="select 
CRMT_PMM_PROJECT_CONTRACT_V.VENDOR_ID
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_CODE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_NAME
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_SIGN_DATE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_START_DATE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_END_DATE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_REMARK
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD.PERIOD_DURATION_TOTAL
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD.PERIOD_DURATION_PERCENT
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_NO
 
from CRMT_PMM_PROJECT_CONTRACT_V 
left join CRMT_PMM_PROJECT_CONTRACT_V_PERIOD on  
left join CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET on  
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_ID=@CONTRACT_V_ID" 
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT_V
(
VENDOR_ID
,CONTRACT_V_CODE
,CONTRACT_V_NAME
,CONTRACT_V_SIGN_DATE
,CONTRACT_V_START_DATE
,CONTRACT_V_END_DATE
,CONTRACT_V_AMOUNT
,CONTRACT_V_REMARK
)
values
(
@VENDOR_ID
,@CONTRACT_V_CODE
,@CONTRACT_V_NAME
,@CONTRACT_V_SIGN_DATE
,@CONTRACT_V_START_DATE
,@CONTRACT_V_END_DATE
,@CONTRACT_V_AMOUNT
,@CONTRACT_V_REMARK
)" 
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT_V 
set 
VENDOR_ID=@VENDOR_ID
,CONTRACT_V_CODE=@CONTRACT_V_CODE
,CONTRACT_V_NAME=@CONTRACT_V_NAME
,CONTRACT_V_SIGN_DATE=@CONTRACT_V_SIGN_DATE
,CONTRACT_V_START_DATE=@CONTRACT_V_START_DATE
,CONTRACT_V_END_DATE=@CONTRACT_V_END_DATE
,CONTRACT_V_AMOUNT=@CONTRACT_V_AMOUNT
,CONTRACT_V_REMARK=@CONTRACT_V_REMARK
 
where  1=1 
 AND CONTRACT_V_ID=@CONTRACT_V_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="CONTRACT_V_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="CONTRACT_V_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_PERIOD" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select PERIOD_NO, from CRMT_PMM_PROJECT_CONTRACT_V_PERIOD" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select PERIOD_DET_NO,PERIOD_V_DET_ID from CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET" >
             </asp:SqlDataSource>

</div>
</asp:Content>

