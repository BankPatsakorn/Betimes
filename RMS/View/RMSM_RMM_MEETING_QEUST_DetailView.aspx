<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_QEUST_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_QEUST_DetailView" %>

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
        <span style="font-size: 23px">สอบถามเรื่องที่ประชุม</span>
    </div>

<div  class="col-sm-12">
<div class="col-sm-12">
<div class="tabbable"><!--open tabhead 18-->
<ul id="ultab18" class="nav nav-tabs tab-bricky">
<li class="" ><!--open tabpage 19-->
<a href="#tabpage1" data-toggle="tab">
รายละเอียดการประชุม
</a>
</li>
<li class="" ><!--open tabpage 87-->
<a href="#tabpage2" data-toggle="tab">
ผู้เข้าร่วมการประชุม
</a>
</li>
<li class="" ><!--open tabpage 94-->
<a href="#tabpage3" data-toggle="tab">
ผังที่นั่ง
</a>
</li>
<li class="" ><!--open tabpage 97-->
<a href="#tabpage4" data-toggle="tab">
ระเบียบวาระการประชุม
</a>
</li>
<li class="" ><!--open tabpage 99-->
<a href="#tabpage5" data-toggle="tab">
ระเบียบวาระการประชุม
</a>
</li>
<li class="" ><!--open tabpage 102-->
<a href="#tabpage6" data-toggle="tab">
รายละอียดระเบียบวาระการประชุม
</a>
</li>
<li class="" ><!--open tabpage 118-->
<a href="#tabpage7" data-toggle="tab">
รายละอียดระเบียบวาระการประชุมย่อย
</a>
</li>
</ul><!--end tabhead 137-->
</div><!--end tabhead 137-->
<div class="tab-content"><!--open tab content 18-->
<div class="tab-pane " id="tabpage1"><!--open tabpage 19-->
<div class="row">
<div class="col-sm-12">
<div  class="row"> <!--row 20-->
<div  class="col-sm-6"> <!--col 21-->
<div ID="MEETING_RESERVE_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่จองห้องประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_RESERVE_DATE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 23-->
<div  class="col-sm-6"> <!--col 24-->
<div ID="MEETING_REQUEST_START_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่ใช้ห้องประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_REQUEST_START_DATE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 26-->
</div><!--end row 27-->
<div  class="row"> <!--row 28-->
<div  class="col-sm-6"> <!--col 29-->
<div ID="MEETING_REQUEST_START_TIME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เวลาการประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_REQUEST_START_TIME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 31-->
<div  class="col-sm-6"> <!--col 32-->
<div ID="ROOM_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ห้องประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlROOM_ID" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 34-->
</div><!--end row 35-->
<div  class="row"> <!--row 36-->
<div  class="col-sm-6"> <!--col 37-->
<div ID="MEETING_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รหัสการประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_CODE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 39-->
<div  class="col-sm-6"> <!--col 40-->
<div ID="MEETING_SUBJECT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อหัวข้อ/ชื่อเรื่อง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_SUBJECT" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 42-->
</div><!--end row 43-->
<div  class="row"> <!--row 44-->
<div  class="col-sm-6"> <!--col 45-->
<div ID="BOARD_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">คณะกรรมการที่ประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlBOARD_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 47-->
<div  class="col-sm-6"> <!--col 48-->
<div ID="MEETING_AMOUNT" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">จำนวนผู้เข้าร่วม(คน):</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_AMOUNT" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 50-->
</div><!--end row 51-->
<div  class="row"> <!--row 52-->
<div  class="col-sm-6"> <!--col 53-->
<div ID="NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ผู้ขอใช้ห้องประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlNAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 55-->
<div  class="col-sm-6"> <!--col 56-->
<div ID="OFFICER_OPSITION_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่ง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlOFFICER_OPSITION_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 58-->
</div><!--end row 59-->
<div  class="row"> <!--row 60-->
<div  class="col-sm-6"> <!--col 61-->
<div ID="MEETING_REQUEST_OFFICER_TEL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์ :</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_REQUEST_OFFICER_TEL" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 63-->
<div  class="col-sm-6"> <!--col 64-->
<div ID="ORG" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงานที่จอง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlORG" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="300"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 66-->
</div><!--end row 67-->
<div  class="row"> <!--row 68-->
<div  class="col-sm-6"> <!--col 69-->
<div ID="MEETING_ADMIN" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ผู้ดูแลห้องประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_ADMIN" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="820"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 71-->
</div><!--end row 72-->
<div  class="panel panel-default"><!--open box 73-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    โสตทัศนูปกรณ์
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body73-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_EQUIPMENT_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_EQUIPMENT_ListView" KeyFieldName="MEETING_EQUIPMENT_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_EQUIPMENT_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MEETING_EQUIPMENT_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_EQUIPMENT_ListView','RMSM_RMM_MEETING_EQUIPMENT_DetailView.aspx?MEETING_EQUIPMENT_ID=<%#Eval("MEETING_EQUIPMENT_ID") %>', viewRMSM_RMM_MEETING_EQUIPMENT_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่ออุปกรณ์" FieldName="EQUIPMENT_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="จำนวน" FieldName="EQUIPMENT_AMOUNT" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="หน่วย" FieldName="COUNT_UNIT_NAME" VisibleIndex="5">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_EQUIPMENT_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 75-->
</div><!--end box 75-->
<div  class="panel panel-default"><!--open box 76-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    บริการการประชุม
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body76-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_SERVICE_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_SERVICE_ListView" KeyFieldName="MEETING_SERVICE_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_SERVICE_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MEETING_SERVICE_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_SERVICE_ListView','RMSM_RMM_MEETING_SERVICE_DetailView.aspx?MEETING_SERVICE_ID=<%#Eval("MEETING_SERVICE_ID") %>', viewRMSM_RMM_MEETING_SERVICE_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="บริการ" FieldName="SERVICE_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_SERVICE_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 78-->
</div><!--end box 78-->
<div  class="row"> <!--row 79-->
<div  class="col-sm-{value}"> <!--col 80-->
<div ID="MEETING_NOTE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หมายเหตุ:</label>
                    <div class="col-sm-8">
<dx:ASPxMemo ID="ctlMEETING_NOTE" runat="server" 
        Width="820" Height="100" >
    </dx:ASPxMemo>
                         </div>
    </div>
</div><!--end col 82-->
</div><!--end row 83-->
<!--button84-->
<input type="button" value="พิมพ์ใบสรุปการจอง" class="btn btn-primary" />
<!--button85-->
<input type="button" value="พิมพ์ป้ายชื่อเข้าร่วมประชุม" class="btn btn-primary" />
</div>
</div>
</div><!--end tabpage 86-->
<div class="tab-pane " id="tabpage2"><!--open tabpage 87-->
<div class="row">
<div class="col-sm-12">
<div  class="panel panel-default"><!--open box 88-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body88-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" KeyFieldName="MEETING_MEMBER_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MEETING_MEMBER_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_MEMBER_MANAGER_ListView','RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.aspx?MEETING_MEMBER_ID=<%#Eval("MEETING_MEMBER_ID") %>', viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อ-นามสกุล" FieldName="NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ตำแหน่ง" FieldName="OFFICER_OPSITION_NAME" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="หน่วยงาน" FieldName="ORG" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ตำแหน่งประชุม" FieldName="MEETING_POSITION_NAME" VisibleIndex="6">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataSpinEditColumn Caption="สถานะของบุคคล" FieldName="MEETING_MEMBER_TYPE" VisibleIndex="7">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataTextColumn Caption="สถานะการเข้าร่วม" FieldName="MEETING_STATUS_NAME" VisibleIndex="8">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" class='fancyBox'  style="display:none"></a>

</div></div><!--button90-->
<input type="button" value="พิมพ์ใบสรุปการจอง" class="btn btn-primary" />
<!--button91-->
<input type="button" value="พิมพ์ป้ายชื่อเข้าร่วมประชุม" class="btn btn-primary" />
</div><!--end box body 92-->
</div><!--end box 92-->
</div>
</div>
</div><!--end tabpage 93-->
<div class="tab-pane " id="tabpage3"><!--open tabpage 94-->
<div class="row">
<div class="col-sm-12">
<div  class="form-group col-sm-12">
                    <label for="" class="col-sm-12"></label>
    </div>
</div>
</div>
</div><!--end tabpage 96-->
<div class="tab-pane " id="tabpage4"><!--open tabpage 97-->
<div class="row">
<div class="col-sm-12">
<div class="col-sm-12">
<div class="tabbable"><!--open tabhead 98-->
<ul id="ultab98" class="nav nav-tabs tab-bricky">
<li class="" ><!--open tabpage 99-->
<a href="#tabpage5" data-toggle="tab">
ระเบียบวาระการประชุม
</a>
</li>
<li class="" ><!--open tabpage 102-->
<a href="#tabpage6" data-toggle="tab">
รายละอียดระเบียบวาระการประชุม
</a>
</li>
<li class="" ><!--open tabpage 118-->
<a href="#tabpage7" data-toggle="tab">
รายละอียดระเบียบวาระการประชุมย่อย
</a>
</li>
</ul><!--end tabhead 135-->
</div><!--end tabhead 135-->
<div class="tab-content"><!--open tab content 98-->
<div class="tab-pane " id="tabpage5"><!--open tabpage 99-->
<div class="row">
<div class="col-sm-12">
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_ListView" KeyFieldName="AGENDA_SUB_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_ListView','RMSM_RMM_MEETING_AGENDA_DetailView.aspx?AGENDA_SUB_ID=<%#Eval("AGENDA_SUB_ID") %>', viewRMSM_RMM_MEETING_AGENDA_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ระเบียบวาระที่" FieldName="AGENDA_SUB_SEQ" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="เรื่อง" FieldName="AGENDA_SUB_TOPIC" VisibleIndex="4">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div>
</div>
</div><!--end tabpage 101-->
<div class="tab-pane " id="tabpage6"><!--open tabpage 102-->
<div class="row">
<div class="col-sm-12">
<div  class="row"> <!--row 103-->
<div  class="col-sm-6"> <!--col 104-->
<div ID="MEETING_AGENDA_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ระเบียบวาระการประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlMEETING_AGENDA_ID" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_SUB_TOPIC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เรื่อง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_SUB_TOPIC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_SUB_DESC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รายละเอียด:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_SUB_DESC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_SUB_BOARD" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">มติที่ประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_SUB_BOARD" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 109-->
</div><!--end row 110-->
<div  class="panel panel-default"><!--open box 111-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body111-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" KeyFieldName="AGENDA_SUB_DOC"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_DOC" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView','RMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView.aspx?AGENDA_SUB_DOC=<%#Eval("AGENDA_SUB_DOC") %>', viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อเอกสาร" FieldName="DOC_LOGICAL_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="วันที่นำเข้า" FieldName="DOC_IMPORT_DATE" VisibleIndex="4">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 113-->
</div><!--end box 113-->
<div  class="panel panel-default"><!--open box 114-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body114-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" KeyFieldName="AGENDA_SUB_URL_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_URL_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView','RMSM_RMM_MEETING_AGENDA_SUB_URL_DetailView.aspx?AGENDA_SUB_URL_ID=<%#Eval("AGENDA_SUB_URL_ID") %>', viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="URL" FieldName="URL_LINK" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่นำเข้า" FieldName="CREATE_DATE" VisibleIndex="4">
</dx:GridViewDataDateColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 116-->
</div><!--end box 116-->
</div>
</div>
</div><!--end tabpage 117-->
<div class="tab-pane " id="tabpage7"><!--open tabpage 118-->
<div class="row">
<div class="col-sm-12">
<div  class="row"> <!--row 119-->
<div  class="col-sm-6"> <!--col 120-->
<div ID="AGENDA_SUB_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ระเบียบวาระการประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_SUB_ID" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_DETAIL_SEQ" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ระเบียบวาระที่:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_DETAIL_SEQ" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_DETAIL_TOPIC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เรื่อง:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_DETAIL_TOPIC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_DETAIL_DESC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รายละเอียด:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_DETAIL_DESC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="AGENDA_DETAIL_BOARD" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">มติที่ประชุม:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlAGENDA_DETAIL_BOARD" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="800"></dx:ASPxTextBox>
                        </div>
    </div>
</div><!--end col 126-->
</div><!--end row 127-->
<div  class="panel panel-default"><!--open box 128-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body128-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" KeyFieldName="AGENDA_DETAIL_DOC"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_DETAIL_DOC" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView','RMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.aspx?AGENDA_DETAIL_DOC=<%#Eval("AGENDA_DETAIL_DOC") %>', viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อเอกสาร" FieldName="DOC_LOGICAL_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="วันที่นำเข้า" FieldName="DOC_IMPORT_DATE" VisibleIndex="4">
</dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 130-->
</div><!--end box 130-->
<div  class="panel panel-default"><!--open box 131-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
    แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
</div>
<div class="panel-body"><!--open box body131-->
<div><div>


<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" Width="100%" 
AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" KeyFieldName="AGENDA_DETAIL_URL_ID"  ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_DETAIL_URL_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView','RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.aspx?AGENDA_DETAIL_URL_ID=<%#Eval("AGENDA_DETAIL_URL_ID") %>', viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView);"><img src="images/edit.png" style="border:none" alt="edit" /></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="URL" FieldName="URL_LINK" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่นำเข้า" FieldName="CREATE_DATE" VisibleIndex="4">
</dx:GridViewDataDateColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="Images/del.png" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" class='fancyBox'  style="display:none"></a>

</div></div></div><!--end box body 133-->
</div><!--end box 133-->
</div>
</div>
</div><!--end tabpage 134-->
</div><!--end tab 135-->
</div>
</div>
</div>
</div><!--end tabpage 136-->
</div><!--end tab 137-->
</div>

</div>
<div>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_EQUIPMENT_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_EQUIPMENT WHERE [MEETING_EQUIPMENT_ID] = @MEETING_EQUIPMENT_ID" 
            SelectCommand="SELECT [dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_ID
,[dbo].[RMSM_RMM_MEETING_EQUIPMENT].MEETING_EQUIPMENT_ID
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_NAME
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].[EQUIPMENT_AMOUNT]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_NAME
FROM [dbo].[RMSM_RMM_MEETING_EQUIPMENT]
LEFT JOIN [dbo].[RMSM_MDM_EQUIPMENT_INFO] on
[dbo].[RMSM_RMM_MEETING_EQUIPMENT].EQUIPMENT_ID = [dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO] on
[dbo].[RMSM_MDM_EQUIPMENT_INFO].[COUNT_UNIT_ID] = [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
WHERE [dbo].[RMSM_RMM_MEETING_EQUIPMENT].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_EQUIPMENT_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SERVICE_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_SERVICE WHERE [MEETING_SERVICE_ID] = @MEETING_SERVICE_ID" 
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING_SERVICE].MEETING_SERVICE_ID
,[dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_ID 
,[dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_NAME 
FROM [dbo].[RMSM_RMM_MEETING_SERVICE]
LEFT JOIN [dbo].[RMSM_MDM_SERVICE_INFO] on
[dbo].[RMSM_RMM_MEETING_SERVICE].SERVICE_ID = [dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_ID 
WHERE [dbo].[RMSM_RMM_MEETING_SERVICE].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_SERVICE_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_MEMBER WHERE [MEETING_MEMBER_ID] = @MEETING_MEMBER_ID" 
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
,[dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_ID]
,[dbo].[RMSM_MDM_MEETING_STATUS_INFO].[MEETING_STATUS_ID]
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_OPSITION_NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].ORG
,[dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_NAME]
,case when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 0 then 'ผู้บริหาร สปน.' 
 when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 1 then 'บุลลคภายใน สปน.' 
 when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 2 then 'บุลลคภายนอก สปน.' end as MEETING_MEMBER_TYPE
,[dbo].[RMSM_MDM_MEETING_STATUS_INFO].MEETING_STATUS_NAME
FROM [dbo].[RMSM_RMM_MEETING_MEMBER]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEMBER_OWNER_OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [dbo].[RMSM_MDM_MEETING_POSITION_INFO] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_POSITION_ID = [dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_ID]
LEFT JOIN [dbo].[RMSM_MDM_MEETING_STATUS_INFO] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_STATUS = [dbo].[RMSM_MDM_MEETING_STATUS_INFO].[MEETING_STATUS_ID]
WHERE [dbo].[RMSM_RMM_MEETING_MEMBER].RECORD_STATUS = 'A' " >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB WHERE [AGENDA_SUB_ID] = @AGENDA_SUB_ID" 
            SelectCommand="SELECT RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_ID
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
FROM  [dbo].[RMSM_RMM_MEETING_AGENDA_SUB]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_DOC WHERE [AGENDA_SUB_DOC] = @AGENDA_SUB_DOC" 
            SelectCommand="SELECT [AGENDA_SUB_DOC]
,[DOC_LOGICAL_NAME]
,[DOC_IMPORT_DATE]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO] on
[dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC].DOC_TYPE_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_DOC" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_URL WHERE [AGENDA_SUB_URL_ID] = @AGENDA_SUB_URL_ID" 
            SelectCommand="SELECT [AGENDA_SUB_URL_ID]
,[URL_NO]
,[URL_LINK]
,[CREATE_DATE]
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_URL]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_URL].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_URL_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_DETAIL_DOC WHERE [AGENDA_DETAIL_DOC] = @AGENDA_DETAIL_DOC" 
            SelectCommand="SELECT [AGENDA_DETAIL_DOC]
,[DOC_LOGICAL_NAME]
,[DOC_IMPORT_DATE]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_DOC]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO] on
[dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_DOC].DOC_TYPE_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_DOC].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_DETAIL_DOC" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_DETAIL_URL WHERE [AGENDA_DETAIL_URL_ID] = @AGENDA_DETAIL_URL_ID" 
            SelectCommand="SELECT [AGENDA_DETAIL_URL_ID]
,[URL_NO]
,[URL_LINK]
,[CREATE_DATE]
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_URL]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_URL].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_DETAIL_URL_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_QEUST_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="" 
            SelectCommand="SELECT DISTINCT [dbo].[RMSM_RMM_MEETING].MEETING_ID
,RMSM_RMM_MEETING.MEETING_RESERVE_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_START_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_START_TIME
,RMSM_RMM_MEETING.ROOM_ID
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME
,RMSM_RMM_MEETING.MEETING_CODE
,RMSM_RMM_MEETING.MEETING_SUBJECT
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME as BOARD_NAME
,[dbo].[RMSM_RMM_MEETING].MEETING_AMOUNT
,RMSM_RMM_MEETING.MEETING_REQUEST_OFFICER
,xx.NAME
,xx.OFFICER_OPSITION_NAME
,RMSM_RMM_MEETING.MEETING_REQUEST_OFFICER_TEL
,xx.ORG
,RMSM_RMM_MEETING.MEETING_ADMIN
,RMSM_RMM_MEETING.MEETING_NOTE
,RMSM_RMM_MEETING_AGENDA_SUB.MEETING_AGENDA_ID
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_SUB_ID
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_SEQ
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_TOPIC
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_DESC
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_BOARD
FROM [dbo].[RMSM_RMM_MEETING]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_RMM_MEETING].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
LEFT JOIN [dbo].[RMSM_MDM_BOARD_MEMBER] on
[dbo].[RMSM_RMM_MEETING].BOARD_ID = [dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID
LEFT JOIN [OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO] on
[dbo].[RMSM_MDM_BOARD_MEMBER].BOARD_ID = [OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].BOARD_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[OPM_BIS].[dbo].[BISM_MDM_BOARD_INFO].OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] as xx on
[dbo].[RMSM_RMM_MEETING].MEETING_REQUEST_OFFICER = xx.OFFICER_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA] on
[dbo].[RMSM_RMM_MEETING].MEETING_ID = [dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA_SUB] on
[dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_AGENDA_ID = [dbo].[RMSM_RMM_MEETING_AGENDA_SUB].MEETING_AGENDA_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL] on
[dbo].[RMSM_RMM_MEETING_AGENDA_SUB].AGENDA_SUB_ID = [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL].AGENDA_SUB_ID
WHERE [dbo].[RMSM_RMM_MEETING].MEETING_ID = @MEETING_ID" 
            InsertCommand="" 
            UpdateCommand="" 
            >
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="MEETING_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_MDM_BOARD_MEMBER" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select BOARD_MEMBER_ID,BOARD_MEMBER_ID from RMSM_MDM_BOARD_MEMBER" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsBISM_MDM_BOARD_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select OFFICER_ID,BOARD_ID from BISM_MDM_BOARD_INFO" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsVIEW_PERSONAL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select NAME, from VIEW_PERSONAL" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select MEETING_AGENDA_TOPIC,MEETING_AGENDA_ID from RMSM_RMM_MEETING_AGENDA" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select AGENDA_SUB_TOPIC,AGENDA_SUB_ID from RMSM_RMM_MEETING_AGENDA_SUB" >
             </asp:SqlDataSource>

<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select AGENDA_DETAIL_TOPIC,AGENDA_DETAIL_ID from RMSM_RMM_MEETING_AGENDA_DETAIL" >
             </asp:SqlDataSource>

</div>
</asp:Content>

