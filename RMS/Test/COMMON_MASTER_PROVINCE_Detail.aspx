<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="COMMON_MASTER_PROVINCE_Detail.aspx.cs" Inherits="COMMON_MASTER_PROVINCE_Detail" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('.fancyBox').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    alert(0);
                    grid_d.Refresh();
                }
            });
        });
        function ClientValidation() {
            return ASPxClientEdit.ValidateGroup("");
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
                        <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
                    </div>
     </div>
    <div>
<h1>PROVINCE</h1>
</div>
<div>
<input type="button" class='btn btn-primary' value=' Save ' />
</div>
<div  class="col-sm-12">
<div class="tabbable"><!--open tabhead 1-->
<ul id="tabMain1" class="nav nav-tabs tab-bricky">
<li><!--open tabpage 2-->
<a href="#tab1" data-toggle="tab">
Tab1
</a>
</li>
<li><!--open tabpage 9-->
<a href="#tab2" data-toggle="tab">
Tab2
</a>
</li>
</ul>
<!--end tabhead 14-->
<div class="tab-content"><!--open tab 1-->
<div class="tab-pane active" id="tab1"><!--open tabpage 2-->
<div class="panel panel-default"><!--open box 3-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
Box1
</div>
<div class="panel-body"><!--open box body-->
<div ID="PROVINCE_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">PROVINCE CODE:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPROVINCE_CODE" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="PROVINCE_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">PROVINCE NAME:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlPROVINCE_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="REGION_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">REGION:</label>
                    <div class="col-sm-8">
<dx:ASPxComboBox 
    ID="ctlREGION_ID"  runat="server" 
    DropDownStyle="DropDown"   CssClass="form-control"
    DataSourceID="dsCOMMON_MASTER_REGION" 
    TextField="REGION_NAME_THA" ValueField="REGION_ID"
    Width="100%" />
                         </div>
    </div>
<div ID="UPDATE_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">UPDATE DATE:</label>
                    <div class="col-sm-8">
<dx:ASPxDateEdit ID="ctlUPDATE_DATE" CssClass="form-control"  AutoPostBack="true"  runat="server" EditFormat="Custom" Width="200">
   <TimeSectionProperties>
     <TimeEditProperties EditFormatString="hh:mm tt" />
   </TimeSectionProperties>
</dx:ASPxDateEdit>
                        </div>
    </div>
<div ID="OptimisticLockField" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">OptimisticLockField:</label>
                    <div class="col-sm-8">
<dx:ASPxSpinEdit ID="ctlOptimisticLockField"  CssClass="form-control" runat="server"  Width="200">
 <SpinButtons ShowIncrementButtons="false"></SpinButtons>
</dx:ASPxSpinEdit>
                        </div>
    </div>
<div><input type="button" id="btnCOMMON_MASTER_DISTRICT_List_new" class='btn btn-primary' value=' Add ' onclick="location='COMMON_MASTER_DISTRICT_Detail.aspx?id=-1';" /></div><div><div>
<dx:ASPxGridView ID="viewCOMMON_MASTER_DISTRICT_List" runat="server" Width="100%" AutoGenerateColumns="False" 
DataSourceID="dsCOMMON_MASTER_DISTRICT_List" ClientInstanceName="grid_d" 
    KeyFieldName="DISTRICT_ID"  Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="DISTRICT_ID" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCOMMON_MASTER_DISTRICT_List','COMMON_MASTER_DISTRICT_Detail.aspx?DISTRICT_ID=<%#Eval("DISTRICT_ID") %>&PROVINCE_ID=<%#Eval("PROVINCE_ID") %>');"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="code" FieldName="DISTRICT_CODE" VisibleIndex="3"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="name" FieldName="DISTRICT_NAME" VisibleIndex="4"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="updatetime" FieldName="UPDATE_DATE" VisibleIndex="5"></dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxCOMMON_MASTER_DISTRICT_List" class='fancyBox'  style="display:none"></a>

</div></div></div>
</div><!--end box 7-->
</div><!--end tabpage 8-->
<div class="tab-pane " id="tab2"><!--open tabpage 9-->
<div class="panel panel-default"><!--open box 10-->
<div class="panel-heading">
<i class="fa fa-external-link-square"></i>
Box2
</div>
<div class="panel-body"><!--open box body-->
<!--button11-->
<input type="button" value="button xxx" class="btn btn-primary" />
</div>
</div><!--end box 12-->
</div><!--end tabpage 13-->
</div>
<!--end tab 14-->

</div>
<div>
<asp:SqlDataSource ID="dsCOMMON_MASTER_DISTRICT_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM COMMON_MASTER_DISTRICT WHERE [DISTRICT_ID] = @DISTRICT_ID" 
            SelectCommand="select COMMON_MASTER_DISTRICT.DISTRICT_ID,COMMON_MASTER_PROVINCE.PROVINCE_ID,COMMON_MASTER_DISTRICT.DISTRICT_CODE,COMMON_MASTER_DISTRICT.DISTRICT_NAME,COMMON_MASTER_DISTRICT.UPDATE_DATE,COMMON_MASTER_DISTRICT.OptimisticLockField from COMMON_MASTER_DISTRICT left join COMMON_MASTER_PROVINCE on COMMON_MASTER_DISTRICT.PROVINCE_ID = COMMON_MASTER_PROVINCE.PROVINCE_ID  where  1=1  AND COMMON_MASTER_DISTRICT.PROVINCE_ID=@PROVINCE_ID" >
            <DeleteParameters>
                <asp:Parameter Name="DISTRICT_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="PROVINCE_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource><asp:SqlDataSource ID="dsCOMMON_MASTER_PROVINCE_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM COMMON_MASTER_PROVINCE WHERE [PROVINCE_ID] = @PROVINCE_ID" 
            SelectCommand="select COMMON_MASTER_REGION.REGION_ID,COMMON_MASTER_PROVINCE.PROVINCE_CODE,COMMON_MASTER_PROVINCE.PROVINCE_NAME,COMMON_MASTER_PROVINCE.UPDATE_DATE,COMMON_MASTER_PROVINCE.OptimisticLockField,COMMON_MASTER_PROVINCE.REGION_ID from COMMON_MASTER_PROVINCE left join COMMON_MASTER_REGION on COMMON_MASTER_PROVINCE.REGION_ID = COMMON_MASTER_REGION.REGION_ID  where  1=1  AND COMMON_MASTER_PROVINCE.PROVINCE_ID=@PROVINCE_ID" 
            InsertCommand="insert into COMMON_MASTER_PROVINCE(REGION_ID,PROVINCE_CODE,PROVINCE_NAME,UPDATE_DATE,OptimisticLockField)values(@REGION_ID,@PROVINCE_CODE,@PROVINCE_NAME,@UPDATE_DATE,@OptimisticLockField)" 
            UpdateCommand="update COMMON_MASTER_PROVINCE set REGION_ID=@REGION_ID,PROVINCE_CODE=@PROVINCE_CODE,PROVINCE_NAME=@PROVINCE_NAME,UPDATE_DATE=@UPDATE_DATE,OptimisticLockField=@OptimisticLockField where PROVINCE_ID=@PROVINCE_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="PROVINCE_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="PROVINCE_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>
<asp:SqlDataSource ID="dsCOMMON_MASTER_REGION" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                    SelectCommand="select REGION_NAME_THA,REGION_ID from COMMON_MASTER_REGION" >
             </asp:SqlDataSource>

</div>
</asp:Content>

