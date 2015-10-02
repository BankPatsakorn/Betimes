<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .dis-ctl
        {
            background-color: #DDDDDD;
        }

        .control-label
        {
            width: 150px;
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        var lkuValueId = "";
        var lkuLabelId = "";
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
            selectedPopupView = viewName;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <div class="form-group col-sm-12" style="margin-top: 50px;">
        <div class="col-sm-offset-10 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ย้อนกลับ" CssClass="btn btn-success btn-80" OnClick="btnBack_Click" />
            <asp:Button ID="Button1" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">ผู้เข้าร่วมประชุม</span>
    </div>

    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-6">
                <!--col 19-->

                <div id="Div2" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">กลุ่มผู้เข้าร่วมประชุม:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ASPxComboBox1" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            Width="100%" IncrementalFilteringMode="StartsWith" OnSelectedIndexChanged="dropdown_SelectedIndexChanged" AutoPostBack="True">
                            <Items>
                                <dx:ListEditItem Text="ผู้บริหาร สปน." Value="0" />
                                <dx:ListEditItem Text="บุคคลภายใน" Value="1" />
                                <dx:ListEditItem Text="บุคคลภายนอก" Value="2" />
                            </Items>
                        </dx:ASPxComboBox>
                    </div>
                </div>
                <div id="MEMBER_OWNER_OFFICER_ID" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ-นามสกุล:</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <dx:ASPxTextBox ID="ctlMEMBER_OWNER_OFFICER_ID" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                            <dx:ASPxTextBox ID="ctlMEMBER_OWNER_OFFICER_ID_label" Width="100%" Height="30"
                                runat="server">
                            </dx:ASPxTextBox>
                            <span class="input-group-btn">
                                <button id="btnMEMBER_OWNER_OFFICER_ID" class="btn btn-primary" style="width: 30px; height: 30px"
                                    onclick="OpenLku('lkuMEMBER_OWNER_OFFICER_ID', 'BOARD_LookupListView.aspx', '<%=ctlMEMBER_OWNER_OFFICER_ID.ClientID %>_I', '<%=ctlMEMBER_OWNER_OFFICER_ID_label.ClientID %>_I')" type="button">
                                    <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <div id="divPrename" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">คำนำหน้าชื่อ:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ASPxComboBox2" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            Width="100%" IncrementalFilteringMode="StartsWith">
                            <Items>
                                <dx:ListEditItem Text="นาย" Value="0" />
                                <dx:ListEditItem Text="นาง" Value="1" />
                                <dx:ListEditItem Text="นางสาว" Value="2" />
                            </Items>
                        </dx:ASPxComboBox>
                    </div>
                </div>
                <div id="divname" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ASPxTextBox3" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="divlastname" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">นามสกุล:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ASPxTextBox4" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <a id="lkuMEMBER_OWNER_OFFICER_ID" href="#" class="fancyBoxLku" style="display: none"></a>
                <div id="OFFICER_OPSITION_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่ง:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlOFFICER_OPSITION_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                        <dx:ASPxTextBox ID="ctlOFFICER_OPSITION_NAME_OUT" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="ORG" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงาน:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlORG" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                        <dx:ASPxTextBox ID="ctlORGOUT" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="divEmail" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">Email:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ASPxTextBox1" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="divPhone" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ASPxTextBox2" Height="30" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="MEETING_POSITION_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่งประชุม:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ctlMEETING_POSITION_ID" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            DataSourceID="dsRMSM_MDM_MEETING_POSITION_INFO"
                            TextField="MEETING_POSITION_NAME" ValueField="MEETING_POSITION_ID"
                            Width="100%" IncrementalFilteringMode="StartsWith" />
                    </div>
                </div>
                <div id="MEETING_MEMBER_TYPE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะของบุคคล:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlMEETING_MEMBER_TYPE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="MEETING_MEMBER_STATUS" runat="server" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะยืนยันการเข้าประชุม:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlMEETING_MEMBER_STATUS" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
            </div>
            <!--end col 26-->
        </div>
        <!--end row 27-->

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_MEMBER WHERE [MEETING_MEMBER_ID] = @MEETING_MEMBER_ID"
            SelectCommand="select 
RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_ID
,RMSM_RMM_MEETING_MEMBER.MEMBER_OWNER_OFFICER_ID
,VIEW_PERSONAL.NAME
,VIEW_PERSONAL.OFFICER_OPSITION_NAME
,VIEW_PERSONAL.ORG
,RMSM_RMM_MEETING_MEMBER.MEETING_POSITION_ID
,case when RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_TYPE=0 then 'ผู้บริหาร สปน.'
when RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_TYPE=1 then 'บุคคลภายใน สปน.'
when RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_TYPE=2 then 'บุคคลภายนอก สปน.'
end as MEETING_MEMBER_TYPE
,(select MEETING_STATUS_NAME from [dbo].[RMSM_MDM_MEETING_STATUS_INFO] where MEETING_STATUS_ID=RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_STATUS) as MEETING_MEMBER_STATUS
 
from RMSM_RMM_MEETING_MEMBER 
left join [OPM_COMMON_DATA]..VIEW_PERSONAL on RMSM_RMM_MEETING_MEMBER.MEMBER_OWNER_OFFICER_ID = [OPM_COMMON_DATA]..VIEW_PERSONAL.OFFICER_ID 
left join RMSM_MDM_MEETING_STATUS_INFO on RMSM_RMM_MEETING_MEMBER.MEETING_MEMBER_STATUS 
= RMSM_MDM_MEETING_STATUS_INFO.[MEETING_STATUS_ID]  
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
 AND MEETING_MEMBER_ID=@MEETING_MEMBER_ID">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsVIEW_PERSONAL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select NAME, from VIEW_PERSONAL"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_MEETING_STATUS_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_STATUS_NAME,MEETING_STATUS_ID from RMSM_MDM_MEETING_STATUS_INFO"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_MEETING_POSITION_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_POSITION_NAME,MEETING_POSITION_ID from RMSM_MDM_MEETING_POSITION_INFO"></asp:SqlDataSource>

    </div>
</asp:Content>

