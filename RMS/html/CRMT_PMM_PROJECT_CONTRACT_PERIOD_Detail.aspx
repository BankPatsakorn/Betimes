<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail" %>

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
งวดงาน
</div>
<div class="panel-body"><!--open box body-->
<div ID="PERIOD_NO" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">งวดงานที่ :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_NO" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_DESC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รายละเอียด :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_DESC" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_DateTime" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่ส่งมอบตามสัญญา :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPERIOD_DateTime" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="PERIOD_AMOUNT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ค่าจ้าง(บาท) :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_AMOUNT" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_PERCENT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เปอร์เซ็นต์เงิน :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_PERCENT" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_START_DateTime" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่เริ่มต้น :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPERIOD_START_DateTime" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="PERIOD_END_DateTime" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่สิ้นสุด :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPERIOD_END_DateTime" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="PERIOD_DURATION_DateTime" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">จำนวนวัน :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPERIOD_DURATION_DateTime" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PERIOD_DELIVERY_DateTime" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่ส่งจริง :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPERIOD_DELIVERY_DateTime" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="PERIOD_BORAD_DateTime" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่ตรวจรับงาน :</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlPERIOD_BORAD_DateTime" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="0">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="PERIOD_STATUS" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะ :</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlPERIOD_STATUS"  runat="server" 
    DropDownStyle="DropDown"   CssClass="form-control"
    DataSourceID="ds" 
    TextField="" ValueField=""
    Width="100%" />
                         </div>
    </div>
</div>
</div><!--end box 26-->

</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_PERIOD WHERE [PERIOD_ID] = @PERIOD_ID" 
            SelectCommand="select 
CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_NO
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DESC
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_PERCENT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_START_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_END_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DURATION_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DELIVERY_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_BORAD_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_STATUS
 
from CRMT_PMM_PROJECT_CONTRACT_PERIOD 
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_ID=@PERIOD_ID" 
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT_PERIOD
(
PERIOD_NO
,PERIOD_DESC
,PERIOD_DateTime
,PERIOD_AMOUNT
,PERIOD_PERCENT
,PERIOD_START_DateTime
,PERIOD_END_DateTime
,PERIOD_DURATION_DateTime
,PERIOD_DELIVERY_DateTime
,PERIOD_BORAD_DateTime
,PERIOD_STATUS
)
values
(
@PERIOD_NO
,@PERIOD_DESC
,@PERIOD_DateTime
,@PERIOD_AMOUNT
,@PERIOD_PERCENT
,@PERIOD_START_DateTime
,@PERIOD_END_DateTime
,@PERIOD_DURATION_DateTime
,@PERIOD_DELIVERY_DateTime
,@PERIOD_BORAD_DateTime
,@PERIOD_STATUS
)" 
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT_PERIOD 
set 
PERIOD_NO=@PERIOD_NO
,PERIOD_DESC=@PERIOD_DESC
,PERIOD_DateTime=@PERIOD_DateTime
,PERIOD_AMOUNT=@PERIOD_AMOUNT
,PERIOD_PERCENT=@PERIOD_PERCENT
,PERIOD_START_DateTime=@PERIOD_START_DateTime
,PERIOD_END_DateTime=@PERIOD_END_DateTime
,PERIOD_DURATION_DateTime=@PERIOD_DURATION_DateTime
,PERIOD_DELIVERY_DateTime=@PERIOD_DELIVERY_DateTime
,PERIOD_BORAD_DateTime=@PERIOD_BORAD_DateTime
,PERIOD_STATUS=@PERIOD_STATUS
 
where  1=1 
 AND PERIOD_ID=@PERIOD_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="PERIOD_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="PERIOD_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

