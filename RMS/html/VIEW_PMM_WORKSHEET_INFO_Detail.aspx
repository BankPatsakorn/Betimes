<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="VIEW_PMM_WORKSHEET_INFO_Detail.aspx.cs" Inherits="VIEW_PMM_WORKSHEET_INFO_Detail" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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

        function OpenChildDetail(id, href,viewname) {
            $("#" + id).attr("href", href);
            $("#" + id).click();
            selectedPopupView = viewname;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-group col-sm-12" style="margin-top: 20px;">
        <div class="col-sm-offset-3 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div>
        <h1></h1>
    </div>
    <%--<div>
        <input type="button" class='btn btn-primary' value=' Save ' />
    </div>--%>
    <div class="col-sm-12">
        <div class="panel panel-default">
            <!--open box 14-->
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
                ข้อมูลโครงการ
            </div>
            <div class="panel-body">
                <!--open box body-->
                <div class="row">
                    <div class="col-md-6">
                <div id="OPEN_REQUEST_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่รับมอบหมาย :</label>
                    <div class="col-sm-8">
                        <dx:ASPxDateEdit ID="ctlOPEN_REQUEST_DATE" CssClass="form-control" AutoPostBack="true" runat="server" EditFormat="Custom" Width="100%">
                            <TimeSectionProperties>
                                <TimeEditProperties EditFormatString="hh:mm tt" />
                            </TimeSectionProperties>
                        </dx:ASPxDateEdit>
                    </div>
                </div>
                <div id="PROJECT_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เลขที่โครงการ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlPROJECT_CODE" CssClass="form-control" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                    </div>
                    <div class="col-md-6">
                <div id="OPEN_STATUS" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะโครงการ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ctlOPEN_STATUS" runat="server"
                            DropDownStyle="DropDown" CssClass="form-control"
                            DataSourceID="dsOPEN_STATUS"
                            TextField="status_name" ValueField="status_id"
                            Width="100%" />
                    </div>
                </div>
                
                    </div>
                </div>
                <div class="row">
                <div id="PROJECT_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-2 control-label" style="padding-left:30px">ชื่อโครงการ :</label>
                    <div class="col-sm-10" style="padding-right:30px">
                        <dx:ASPxTextBox ID="ctlPROJECT_NAME" CssClass="form-control" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div> 
                </div>
                <div class="row">             
                    <div class="col-md-6">
                <div id="ORGANIZE_NAME_THA1" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อลูกค้า :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlORGANIZE_NAME_THA1" CssClass="form-control" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="CREATE_USER_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">Sale Account :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlCREATE_USER_ID" CssClass="form-control" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                    </div>
                    <div class="col-md-6">
                <div id="ORGANIZE_NAME_THA2" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงาน :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlORGANIZE_NAME_THA2" CssClass="form-control" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="ORGANIZE_NAME_THA" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">กระทรวง :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlORGANIZE_NAME_THA" CssClass="form-control" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                    </div>
                </div>
                <div id="tab01" class="form-group col-sm-12">
                <div class="tabbable">
                    <!--open tabhead 23-->
                    <ul id="tabB" class="nav nav-tabs tab-bricky">
                        <li>
                            <!--open tabpage 24-->
                            <a href="#grideTab1" data-toggle="tab">สัญญาโครงการ
                            </a>
                        </li>
                        <li>
                            <!--open tabpage 33-->
                            <a href="#grideTab2" data-toggle="tab">สัญญาจ้างบริษัท
                            </a>
                        </li>
                        <li>
                            <!--open tabpage 42-->
                            <a href="#grideTab3" data-toggle="tab">ใบขอเปิดใช้บริการ
                            </a>
                        </li>
                    </ul>
                    <!--end tabhead 47-->
                    <div class="tab-content">
                        <!--open tab 23-->
                        <div class="tab-pane active" id="grideTab1">
                            <!--open tabpage 24-->
                            <div class="form-group col-sm-12">
                                <label for="" class="col-sm-4 control-label">สัญญา :</label>
                                <div class="col-sm-8">
                                    &nbsp;
                                </div>
                            </div>
                            <!--button26-->
                            <%--<input type="button" value="เพิ่มสัญญา" class="btn btn-primary" />--%>
                            <div>
                                <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_List_new" class='btn btn-primary' value=' เพิ่มสัญญา ' onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_List', 'CRMT_PMM_PROJECT_CONTRACT_Detail.aspx?CONTRACT_ID=-1', viewCRMT_PMM_PROJECT_CONTRACT_List);" /></div>
                            <div>
                                <div>

                                    <input type="hidden" id ="CONTRACT_ID_SELECTED" class="CONTRACT_ID_SELECTED" runat="server" value="-1">
                                    <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                        DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_List" KeyFieldName="CONTRACT_ID" 
                                        ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_List" Theme="Metropolis"  
                                        OnSelectionChanged="viewCRMT_PMM_PROJECT_CONTRACT_List_SelectionChanged">
                                        <Columns>

                                            <dx:GridViewCommandColumn 
                                                ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="10">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewCommandColumn  ShowSelectButton ="true"
                                                 ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="CONTRACT_ID" ReadOnly="True" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                <DataItemTemplate>
                                                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_List','CRMT_PMM_PROJECT_CONTRACT_Detail.aspx?CONTRACT_ID=<%#Eval("CONTRACT_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_List);"></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="สัญญาเลขที่" FieldName="CONTRACT_CODE" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="ชื่อสัญญา" FieldName="CONTRACT_NAME" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่ลงนาม" FieldName="CONTRACT_SIGN_DATE" VisibleIndex="5">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่เริ่มงาน" FieldName="CONTRACT_START_DATE" VisibleIndex="6">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="CONTRACT_END_DATE" VisibleIndex="7">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataTextColumn Caption="มูลค่าสัญญา(บาท)" FieldName="CONTRACT_AMOUNT" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="หมายเหตุ" FieldName="CONTRACT_REMARK" VisibleIndex="9">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="False"  ShowFilterRowMenu="true"/>
                                        <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ProcessSelectionChangedOnServer="True" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                            </DeleteButton>
                                            <SelectButton>
                                                <Image ToolTip="เลือก" Url="../Images/search.jpg" Height="15" Width="15" />
                                            </SelectButton>
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_List" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                            <div class="panel panel-default">
                                <!--open box 28-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    บุคลากรในโครงการ
                                </div>
                                <div class="panel-body">
                                    <!--open box body-->
                                    <!--button29-->
                                    <%--<input type="button" value="เพิ่มบุคคลากร" class="btn btn-primary" />--%>
                                    <div>
                                        <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_MEMBER_List_new" class='btn btn-primary' value=' เพิ่มบุคคลากร ' onclick="location = 'CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.aspx?PROJECT_MEMBER_ID=-1&CONTRACT_ID=' + $('.CONTRACT_ID_SELECTED').val();" /></div>
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                                DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" KeyFieldName="PROJECT_MEMBER_ID" ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="PROJECT_MEMBER_ID" ReadOnly="True" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                        <DataItemTemplate>
                                                            <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_MEMBER_List','CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.aspx?PROJECT_MEMBER_ID=<%#Eval("PROJECT_MEMBER_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List);"></a>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ชื่อ" FieldName="PROJECT_MEMBER_NAME" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="สกุล" FieldName="PROJECT_MEMBER_LNAME" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="สังกัด" FieldName="PROJECT_MEMBER_ORG" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="เบอร์โทรศัพท์" FieldName="PROJECT_MEMBER_TEL" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataDateColumn Caption="วันที่เริ่มปฏิบัติงาน" FieldName="PROJECT_MEMBER_START_DATE" VisibleIndex="7">
                                                    </dx:GridViewDataDateColumn>

                                                    <dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="PROJECT_MEMBER_END_DATE" VisibleIndex="8">
                                                    </dx:GridViewDataDateColumn>
                                                </Columns>
                                                <Settings ShowFilterRow="True" ShowGroupPanel="False" ShowFilterRowMenu="true"/>
                                                <SettingsBehavior ConfirmDelete="true" ProcessSelectionChangedOnServer="True" />
                                                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                <SettingsCommandButton>
                                                    <DeleteButton>
                                                        <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                            </dx:ASPxGridView>
                                            <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" class='fancyBox' style="display: none"></a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end box 31-->
                        </div>
                        <!--end tabpage 32-->
                        <div class="tab-pane " id="grideTab2">
                            <!--open tabpage 33-->
                            <div class="form-group col-sm-12">
                                <label for="" class="col-sm-4 control-label">สัญญา :</label>
                                <div class="col-sm-8">
                                    &nbsp;
                                </div>
                            </div>
                            <!--button35-->
                            <%--<input type="button" value="เพิ่มบริษัท" class="btn btn-primary" />--%>
                            <div>
                                <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_V_List_new" class='btn btn-primary' value=' เพิ่มบริษัท ' onclick="location = 'CRMT_PMM_PROJECT_CONTRACT_V_Detail.aspx?id=-1';" /></div>
                            <div>
                                <div>


                                    <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_V_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                        DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_V_List" KeyFieldName="CONTRACT_V_ID" ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_V_List" Theme="Metropolis">
                                        <Columns>

                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="CONTRACT_V_ID" ReadOnly="True" VisibleIndex="2">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                <DataItemTemplate>
                                                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_V_List','CRMT_PMM_PROJECT_CONTRACT_V_Detail.aspx?CONTRACT_V_ID=<%#Eval("CONTRACT_V_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_V_List);"></a>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="สัญญาเลขที่" FieldName="VENDOR_ID" VisibleIndex="3">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataTextColumn Caption="ชื่อสัญญา" FieldName="CONTRACT_V_CODE" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="ชื่อบริษัท" FieldName="CONTRACT_V_NAME" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่ลงนาม" FieldName="CONTRACT_V_SIGN_DATE" VisibleIndex="6">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่เริ่มงาน" FieldName="CONTRACT_V_START_DATE" VisibleIndex="7">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="CONTRACT_V_END_DATE" VisibleIndex="8">
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewDataSpinEditColumn Caption="มูลค่าสัญญา(บาท)" FieldName="CONTRACT_V_AMOUNT" VisibleIndex="9">
                                            </dx:GridViewDataSpinEditColumn>

                                            <dx:GridViewDataTextColumn Caption="หมายเหตุ" FieldName="CONTRACT_V_REMARK" VisibleIndex="10">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="False" ShowFilterRowMenu="true"/>
                                        <SettingsBehavior ConfirmDelete="true" />
                                        <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                        <SettingsCommandButton>
                                            <DeleteButton>
                                                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                            </DeleteButton>
                                        </SettingsCommandButton>
                                    </dx:ASPxGridView>
                                    <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_V_List" class='fancyBox' style="display: none"></a>

                                </div>
                            </div>
                            <div class="panel panel-default">
                                <!--open box 37-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    บุคลากรที่เกี่ยวข้อง
                                </div>
                                <div class="panel-body">
                                    <!--open box body-->
                                    <!--button38-->
                                    <%--<input type="button" value="เพิ่มบุคคลากร" class="btn btn-primary" />--%>
                                    <div>
                                        <input type="button" id="btnCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List_new" class='btn btn-primary' value=' เพิ่มบุคคลากร ' onclick="location = 'CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.aspx?id=-1';" /></div>
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List" runat="server" Width="100%" AutoGenerateColumns="False"
                                                DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List" KeyFieldName="PROJECT_V_MEMBER_ID" ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="PROJECT_V_MEMBER_ID" ReadOnly="True" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                                                        <DataItemTemplate>
                                                            <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List','CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.aspx?PROJECT_V_MEMBER_ID=<%#Eval("PROJECT_V_MEMBER_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List);"></a>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ชื่อ" FieldName="CONTRACT_V_FNAME_NAME_THA" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="สกุล" FieldName="CONTRACT_V_LNAME_NAME_THA" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ตำแหน่ง" FieldName="CONTRACT_V_COMPANY_POSITION" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="หน่วยงาน" FieldName="CONTRACT_V_COMPANY_NAME" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="เบอร์โทรศัพท์" FieldName="CONTRACT_V_COMPANY_TEL" VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="อีเมล" FieldName="CONTRACT_V_COMPANY_EMAIL" VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <Settings ShowFilterRow="True" ShowGroupPanel="False" ShowFilterRowMenu="true"/>
                                                <SettingsBehavior ConfirmDelete="true" />
                                                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                <SettingsCommandButton>
                                                    <DeleteButton>
                                                        <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                            </dx:ASPxGridView>
                                            <a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List" class='fancyBox' style="display: none"></a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end box 40-->
                        </div>
                        <!--end tabpage 41-->
                        <div class="tab-pane " id="grideTab3">
                            <!--open tabpage 42-->
                            <div class="panel panel-default">
                                <!--open box 43-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    ใบขอเปิดใช้บริการ
                                </div>
                                <div class="panel-body">
                                    <!--open box body-->
                                    <div></div>
                                    <div></div>
                                </div>
                            </div>
                            <!--end box 45-->
                        </div>
                        <!--end tabpage 46-->
                    </div>
                    <!--end tab 47-->
                </div>
              </div>
            </div>
            <!--end box 48-->

        </div>
        <div>
            <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT WHERE [CONTRACT_ID] = @CONTRACT_ID"
                SelectCommand="select CRMT_PMM_PROJECT_CONTRACT.CONTRACT_ID
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_CODE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_NAME
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_SIGN_DATE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_START_DATE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_END_DATE
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT.CONTRACT_REMARK
 from CRMT_PMM_PROJECT_CONTRACT where  1=1 and CRMT_PMM_PROJECT_CONTRACT.WORKSHEET_ID = @OPEN_ID">
                <DeleteParameters>
                    <asp:Parameter Name="CONTRACT_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter Name="OPEN_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_MEMBER WHERE [PROJECT_MEMBER_ID] = @PROJECT_MEMBER_ID"
                SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_ID
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_NAME
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_LNAME
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_ORG
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_TEL
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_START_DATE
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_END_DATE
 from CRMT_PMM_PROJECT_CONTRACT_MEMBER where  1=1 and CONTRACT_ID = @CONTRACT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_MEMBER_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_V WHERE [CONTRACT_V_ID] = @CONTRACT_V_ID"
                SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_ID
,CRMT_PMM_PROJECT_CONTRACT_V.VENDOR_ID
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_CODE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_NAME
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_SIGN_DATE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_START_DATE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_END_DATE
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT_V.CONTRACT_V_REMARK
 from CRMT_PMM_PROJECT_CONTRACT_V where  1=1 and CRMT_PMM_PROJECT_CONTRACT_V.WORKSHEET_ID = @OPEN_ID">
                <DeleteParameters>
                    <asp:Parameter Name="CONTRACT_V_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_V_MEMBER WHERE [PROJECT_V_MEMBER_ID] = @PROJECT_V_MEMBER_ID"
                SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.PROJECT_V_MEMBER_ID
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_FNAME_NAME_THA
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_LNAME_NAME_THA
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_POSITION
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_NAME
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_TEL
,CRMT_PMM_PROJECT_CONTRACT_V_MEMBER.CONTRACT_V_COMPANY_EMAIL
 from CRMT_PMM_PROJECT_CONTRACT_V_MEMBER where  1=1 and CONTRACT_V_ID in (select CONTRACT_V_ID from CRMT_PMM_PROJECT_CONTRACT_V where WORKSHEET_ID = @OPEN_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_V_MEMBER_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsVIEW_PMM_WORKSHEET_INFO_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                DeleteCommand="DELETE FROM CRMM_PMM_WORKSHEET_INFO WHERE [OPEN_ID] = @OPEN_ID"
                SelectCommand="select 
VIEW_PMM_WORKSHEET_INFO.OPEN_REQUEST_DATE2 OPEN_REQUEST_DATE
,VIEW_PMM_WORKSHEET_INFO.PROJECT_CODE
,CRMM_PMM_WORKSHEET_INFO.OPEN_STATUS
,VIEW_PMM_WORKSHEET_INFO.PROJECT_NAME
,VIEW_PMM_WORKSHEET_INFO.ORGANIZE_NAME_THA
,VIEW_PMM_WORKSHEET_INFO.CREATE_USER_ID
,VIEW_COMMON_MASTER_ORGANIZE_LV2.ORGANIZE_NAME_THA
,VIEW_COMMON_MASTER_ORGANIZE_LV1.ORGANIZE_NAME_THA

from CRMM_PMM_WORKSHEET_INFO 
left join VIEW_PMM_WORKSHEET_INFO on  CRMM_PMM_WORKSHEET_INFO.OPEN_ID = VIEW_PMM_WORKSHEET_INFO.OPEN_ID 
left join COMMON_DATA..COMMON_MASTER_ORGANIZE on VIEW_PMM_WORKSHEET_INFO.CUST_CODE = COMMON_MASTER_ORGANIZE.ORGANIZE_ID
left join COMMON_DATA..VIEW_COMMON_MASTER_ORGANIZE_LV1 on  COMMON_MASTER_ORGANIZE.ORGANIZE_CODE_LEV1 = VIEW_COMMON_MASTER_ORGANIZE_LV1.ORGANIZE_CODE_LEV1
left join COMMON_DATA..VIEW_COMMON_MASTER_ORGANIZE_LV2 on   COMMON_MASTER_ORGANIZE.ORGANIZE_CODE_LEV1 = VIEW_COMMON_MASTER_ORGANIZE_LV2.ORGANIZE_CODE_LEV1 and
COMMON_MASTER_ORGANIZE.ORGANIZE_CODE_LEV2 = VIEW_COMMON_MASTER_ORGANIZE_LV2.ORGANIZE_CODE_LEV2
where  1=1  AND CRMM_PMM_WORKSHEET_INFO.OPEN_ID=@OPEN_ID"
                InsertCommand="insert into CRMM_PMM_WORKSHEET_INFO(OPEN_STATUS) values(@OPEN_STATUS)"
                UpdateCommand="update CRMM_PMM_WORKSHEET_INFO set OPEN_STATUS=@OPEN_STATUS where  1=1  AND OPEN_ID=@OPEN_ID">
                <DeleteParameters>
                    <asp:Parameter Name="OPEN_ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter Name="OPEN_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="dsVIEW_PMM_WORKSHEET_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="select OPEN_CODE,OPEN_ID from VIEW_PMM_WORKSHEET_INFO"></asp:SqlDataSource>

            <asp:SqlDataSource ID="dsVIEW_COMMON_MASTER_ORGANIZE_LV1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="select ORGANIZE_NAME_THA,ORGANIZE_ID from VIEW_COMMON_MASTER_ORGANIZE_LV1"></asp:SqlDataSource>

            <asp:SqlDataSource ID="dsVIEW_COMMON_MASTER_ORGANIZE_LV2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="select ORGANIZE_NAME_THA,ORGANIZE_ID from VIEW_COMMON_MASTER_ORGANIZE_LV2"></asp:SqlDataSource>

            <asp:SqlDataSource ID="dsOPEN_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="select 'True' as status_id,'รับทราบ' as status_name
                union 
                select 'False','ไม่รับทราบ'"></asp:SqlDataSource>

        </div>
</div>
</asp:Content>

