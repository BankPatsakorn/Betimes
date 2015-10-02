<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_MEMBER_OPM_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_MEMBER_OPM_DetailView" %>

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
        <span style="font-size: 23px">บุคคลภายใน สปน.</span>
    </div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="MEMBER_OWNER_OFFICER_ID" class="form-group col-sm-12">
    <label for="" class="col-sm-4 control-label">ชื่อ-นามสกุล:</label>
    <div class="col-sm-8">
        <div class="input-group">
            <dx:ASPxTextBox ID="ctlMEMBER_OWNER_OFFICER_ID" runat="server" ClientVisible="false"></dx:ASPxTextBox>
            <dx:ASPxTextBox ID="ctlMEMBER_OWNER_OFFICER_ID_label" Width="100%" Height="30"
    runat="server"></dx:ASPxTextBox>
            <span class="input-group-btn">
                  <button id="btnMEMBER_OWNER_OFFICER_ID" class="btn btn-primary" style="width:30px;height:30px"
                     onclick="OpenLku('lkuMEMBER_OWNER_OFFICER_ID', 'VIEW_PERSONAL_LookupListView.aspx', '<%=ctlMEMBER_OWNER_OFFICER_ID.ClientID %>_I', '<%=ctlMEMBER_OWNER_OFFICER_ID_label.ClientID %>_I')"  type="button">
                     <span class="glyphicon glyphicon-search" style="margin-left:-5px"></span></button>
            </span>
        </div>
    </div>
</div>
<a id="lkuMEMBER_OWNER_OFFICER_ID" href="#" class="fancyBoxLku" style="display:none"></a>
<div ID="OFFICER_OPSITION_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่ง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlOFFICER_OPSITION_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="ORG" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงาน:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlORG" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="MEETING_POSITION_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่งประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlMEETING_POSITION_ID"  runat="server" 
    DropDownStyle="DropDown"   Height="30"
    DataSourceID="dsRMSM_MDM_MEETING_POSITION_INFO" 
    TextField="MEETING_POSITION_NAME" ValueField="MEETING_POSITION_ID"
    Width="100%" IncrementalFilteringMode = "StartsWith" />
                         </div>
    </div>
<div ID="MEETING_MEMBER_TYPE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะของบุคคล:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_MEMBER_TYPE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="MEETING_MEMBER_STATUS" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะยืนยันการเข้าประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_MEMBER_STATUS" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 26-->
</div><!--end row 27-->

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_MEMBER_OPM_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_MEMBER WHERE [MEETING_MEMBER_ID] = @MEETING_MEMBER_ID" 
            SelectCommand="select 
RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_ID
,RMSM_RMM_MEETING_MEMBER.MEMBER_OWNER_OFFICER_ID
,VIEW_PERSONAL.OFFICER_OPSITION_NAME
,VIEW_PERSONAL.ORG
,RMSM_RMM_MEETING_MEMBER.MEETING_POSITION_ID
,RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_TYPE
,RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_STATUS
 
from RMSM_RMM_MEETING_MEMBER 
left join VIEW_PERSONAL on RMSM_RMM_MEETING_MEMBER.MEMBER_OWNER_OFFICER_ID = VIEW_PERSONAL.MEMBER_OWNER_OFFICER_ID  AND RMSM_RMM_MEETING_MEMBER.MEMBER_DELEGATE_OFFICER_ID = VIEW_PERSONAL.MEMBER_DELEGATE_OFFICER_ID  
left join RMSM_MDM_MEETING_POSITION_INFO on RMSM_RMM_MEETING_MEMBER.MEETING_POSITION_ID = RMSM_MDM_MEETING_POSITION_INFO.MEETING_POSITION_ID  
where  1=1  AND RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_ID=@MEETING_MEMBER_ID" 
            InsertCommand="insert into RMSM_RMM_MEETING_MEMBER
(
MEMBER_OWNER_OFFICER_ID
,MEETING_POSITION_ID
,MEETING_MEMBER_TYPE
,MEETING_MEMBER_STATUS
)
values
(
@MEMBER_OWNER_OFFICER_ID
,@MEETING_POSITION_ID
,@MEETING_MEMBER_TYPE
,@MEETING_MEMBER_STATUS
)" 
            UpdateCommand="update RMSM_RMM_MEETING_MEMBER 
set 
MEMBER_OWNER_OFFICER_ID=@MEMBER_OWNER_OFFICER_ID
,MEETING_POSITION_ID=@MEETING_POSITION_ID
,MEETING_MEMBER_TYPE=@MEETING_MEMBER_TYPE
,MEETING_MEMBER_STATUS=@MEETING_MEMBER_STATUS
 
where  1=1 
 AND MEETING_MEMBER_ID=@MEETING_MEMBER_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsVIEW_PERSONAL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select NAME, from VIEW_PERSONAL" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_MDM_MEETING_POSITION_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select MEETING_POSITION_NAME,MEETING_POSITION_ID from RMSM_MDM_MEETING_POSITION_INFO" >
             </asp:SqlDataSource>

</div>
</asp:Content>

