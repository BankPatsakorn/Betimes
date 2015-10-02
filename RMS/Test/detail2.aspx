<%@ Page Title="" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="detail2.aspx.cs" UICulture="th" Culture="th-TH" Inherits="Test_detail2" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function ClientValidation() {
            return ASPxClientEdit.ValidateGroup("");
        }
    </script>
    <script type="text/javascript">
        var lastCountry = null;
        function OnCountryChanged(cmbCountry) {
            //if (cmbCity.InCallback())
            //    lastCountry = cmbCountry.GetValue().toString();
            //else
            //    cmbCity.PerformCallback(cmbCountry.GetValue().toString());
        }
        function OnEndCallback(s, e) {
            //if (lastCountry) {
            //    cmbCity.PerformCallback(lastCountry);
            //    lastCountry = null;
            //}
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="form-horizontal" role="form">
    <div class="form-group" id="PROVINCE_NAME">
                    <label for="txtMeetingStartDate" class="col-sm-4 control-label">PROVINCE_NAME:</label>
                    <div class="col-sm-8">
                        <div class="input-group">

                         <dx:ASPxTextBox ID="ctlPROVINCE_NAME" runat="server" Width="200px" 
                        MaxLength="128">
                        <ValidationSettings ErrorDisplayMode="ImageWithText">
                            <RequiredField IsRequired="True" ErrorText="Name is required." />
                        </ValidationSettings>
                    </dx:ASPxTextBox>

                        </div>
                    </div>
                </div>
                <div class="form-group" id="PROVINCE_CODE">
                    <label for="txtMeetingStartDate" class="col-sm-4 control-label">PROVINCE_CODE:</label>
                    <div class="col-sm-8">
                        <div class="input-group">

                            <dx:ASPxTextBox ID="ctlPROVINCE_CODE" runat="server" Width="200px" 
                        MaxLength="128">
                        <ValidationSettings ErrorDisplayMode="ImageWithText">
                            <RequiredField IsRequired="True" ErrorText="Name is required." />
                        </ValidationSettings>
                    </dx:ASPxTextBox>

                        </div>
                    </div>
                </div>
                
                <div class="form-group" id="Div1">
                    <label for="txtMeetingStartDate" class="col-sm-4 control-label">REGION:</label>
                    <div class="col-sm-8">
                        <div class="input-group">

                            <dx:ASPxComboBox runat="server" ID="ctlREGION_ID" DropDownStyle="DropDownList" IncrementalFilteringMode="StartsWith"
                    DataSourceID="srcDDL1" TextField="REGION_NAME_THA" ValueField="REGION_ID"
                    EnableSynchronization="False">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />
                                <ValidationSettings ErrorDisplayMode="ImageWithText">
                                    <RequiredField IsRequired="True" ErrorText="Name is required." />
                                   
                                </ValidationSettings>
                            </dx:ASPxComboBox>

                        </div>
                    </div>
                </div>

        
    <div class="form-group" id="Div3">
                    <label for="txtMeetingStartDate" class="col-sm-4 control-label">IS GOOD:</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <dx:ASPxCheckBox ID="ctlIS_GOOD" runat="server" ></dx:ASPxCheckBox>
                           
                        </div>
                    </div>
                </div>

        <div class="form-group" id="Div2">
                    <label for="txtMeetingStartDate" class="col-sm-4 control-label">UPDATE DATE:</label>
                    <div class="col-sm-8">
                        <div class="input-group">

                            <dx:ASPxDateEdit ID="ctlUPDATE_DATE" runat="server" EditFormat="Custom" Width="200"></dx:ASPxDateEdit>

                        </div>
                    </div>
                </div>

                <div class="form-group" style="margin-top: 20px;">
                    <div class="col-sm-offset-3 col-sm-6">
                        <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                    </div>
                </div>
        </div>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                DeleteCommand ="update  COMMON_MASTER_PROVINCE set DEL_FLAG='N' where COMMON_MASTER_PROVINCE.PROVINCE_ID=@PROVINCE_ID"
                SelectCommand="select COMMON_MASTER_PROVINCE.PROVINCE_ID,COMMON_MASTER_PROVINCE.PROVINCE_CODE,REGION_ID,
            COMMON_MASTER_PROVINCE.PROVINCE_NAME,COMMON_MASTER_PROVINCE.UPDATE_DATE 
                ,COMMON_MASTER_PROVINCE.IS_GOOD
                from COMMON_MASTER_PROVINCE 
            where  1=1 and COMMON_MASTER_PROVINCE.PROVINCE_ID=@PROVINCE_ID "
                UpdateCommand="update  COMMON_MASTER_PROVINCE
                set COMMON_MASTER_PROVINCE.PROVINCE_CODE=@PROVINCE_CODE, COMMON_MASTER_PROVINCE.PROVINCE_NAME=@PROVINCE_NAME,REGION_ID=@REGION_ID
            ,COMMON_MASTER_PROVINCE.UPDATE_DATE=@UPDATE_DATE 
                ,COMMON_MASTER_PROVINCE.IS_GOOD = @IS_GOOD
            where  1=1 and COMMON_MASTER_PROVINCE.PROVINCE_ID=@PROVINCE_ID "
                InsertCommand="insert into COMMON_MASTER_PROVINCE (PROVINCE_CODE,PROVINCE_NAME,REGION_ID,UPDATE_DATE)values(@PROVINCE_CODE,@PROVINCE_NAME,@REGION_ID,@UPDATE_DATE)"
                 >
             </asp:SqlDataSource>
              <asp:SqlDataSource ID="srcDDL1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                SelectCommand="select REGION_ID,cast(REGION_ID as varchar(10)) + ' ' + REGION_NAME_THA as REGION_NAME_THA from COMMON_MASTER_REGION"></asp:SqlDataSource>
</asp:Content>

