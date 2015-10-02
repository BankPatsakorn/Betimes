﻿<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView" %>

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
        <span style="font-size: 23px">แนบ URL</span>
    </div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="URL_LINK" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">link URL:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlURL_LINK" runat="server" Height="30" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="CREATE_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่นำเข้า:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlCREATE_DATE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 22-->
</div><!--end row 23-->

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_DETAIL_URL WHERE [AGENDA_DETAIL_URL_ID] = @AGENDA_DETAIL_URL_ID" 
            SelectCommand="select 
RMSM_RMM_MEETING_AGENDA_DETAIL_URL.AGENDA_DETAIL_URL_ID
,RMSM_RMM_MEETING_AGENDA_DETAIL_URL.URL_LINK
,RMSM_RMM_MEETING_AGENDA_DETAIL_URL.CREATE_DATE
 
from RMSM_RMM_MEETING_AGENDA_DETAIL_URL 
where  1=1  AND RMSM_RMM_MEETING_AGENDA_DETAIL_URL.AGENDA_DETAIL_URL_ID=@AGENDA_DETAIL_URL_ID" 
            InsertCommand="insert into RMSM_RMM_MEETING_AGENDA_DETAIL_URL
(
URL_LINK
,CREATE_DATE
)
values
(
@URL_LINK
,@CREATE_DATE
)" 
            UpdateCommand="update RMSM_RMM_MEETING_AGENDA_DETAIL_URL 
set 
URL_LINK=@URL_LINK
,CREATE_DATE=@CREATE_DATE
 
where  1=1 
 AND AGENDA_DETAIL_URL_ID=@AGENDA_DETAIL_URL_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_DETAIL_URL_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="AGENDA_DETAIL_URL_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>
