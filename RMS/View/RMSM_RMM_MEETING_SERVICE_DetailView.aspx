﻿<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_SERVICE_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_SERVICE_DetailView" %>

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
        <span style="font-size: 23px">บริการการประชุม</span>
    </div>

<div  class="col-sm-12">
<div  class="row"> <!--row 18-->
<div  class="col-sm-6"> <!--col 19-->
<div ID="SERVICE_ID" class="form-group col-sm-12">
    <label for="" class="col-sm-4 control-label">บริการ:</label>
    <div class="col-sm-8">
        <div class="input-group">
            <dx:ASPxTextBox ID="ctlSERVICE_ID" runat="server" ClientVisible="false"></dx:ASPxTextBox>
            <dx:ASPxTextBox ID="ctlSERVICE_ID_label" Width="100%" Height="30"
    runat="server"></dx:ASPxTextBox>
            <span class="input-group-btn">
                  <button id="btnSERVICE_ID" class="btn btn-primary" style="width:30px;height:30px"
                     onclick="OpenLku('lkuSERVICE_ID', 'SERVICE_INFO_LookupListView.aspx', '<%=ctlSERVICE_ID.ClientID %>_I', '<%=ctlSERVICE_ID_label.ClientID %>_I')"  type="button">
                     <span class="glyphicon glyphicon-search" style="margin-left:-5px"></span></button>
            </span>
        </div>
    </div>
</div>
<a id="lkuSERVICE_ID" href="#" class="fancyBoxLku" style="display:none"></a>
</div><!--end col 21-->
</div><!--end row 22-->

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SERVICE_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="" 
            SelectCommand="SELECT RMSM_MDM_SERVICE_INFO.SERVICE_ID
,[dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_ID
,[dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_NAME
FROM [dbo].[RMSM_RMM_MEETING_SERVICE]
LEFT JOIN [dbo].[RMSM_MDM_SERVICE_INFO] on
[dbo].[RMSM_RMM_MEETING_SERVICE].SERVICE_ID = [dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_ID
WHERE MEETING_SERVICE_ID = @MEETING_SERVICE_ID" 
            InsertCommand="" 
            UpdateCommand="" 
            >
            <DeleteParameters>
                <asp:Parameter Name="SERVICE_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="MEETING_SERVICE_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

