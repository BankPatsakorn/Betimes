<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="COMMON_MASTER_DISTRICT_Detail.aspx.cs" Inherits="COMMON_MASTER_DISTRICT_Detail" %>

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
                    location.reload();
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
<h1>DISTRICT_Detail</h1>
</div>
<div>
<input type="button" class='btn btn-primary' value=' Save ' />
</div>
<div  class="col-sm-12">
<div ID="DISTRICT_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">DISTRICT CODE:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlDISTRICT_CODE" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>
<div ID="DISTRICT_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">DISTRICT NAME:</label>
                    <div class="col-sm-8">
<dx:ASPxTextBox ID="ctlDISTRICT_NAME" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                        </div>
    </div>

</div>
<div>
<asp:SqlDataSource ID="dsCOMMON_MASTER_DISTRICT_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM COMMON_MASTER_DISTRICT WHERE [DISTRICT_ID] = @DISTRICT_ID" 
            SelectCommand="select COMMON_MASTER_DISTRICT.PROVINCE_ID,COMMON_MASTER_DISTRICT.DISTRICT_CODE,
    COMMON_MASTER_DISTRICT.DISTRICT_NAME,COMMON_MASTER_DISTRICT.UPDATE_DATE,COMMON_MASTER_DISTRICT.OptimisticLockField from COMMON_MASTER_DISTRICT where  1=1  AND COMMON_MASTER_DISTRICT.DISTRICT_ID=@DISTRICT_ID AND COMMON_MASTER_DISTRICT.PROVINCE_ID=@PROVINCE_ID" 
            InsertCommand="insert into COMMON_MASTER_DISTRICT(PROVINCE_ID,DISTRICT_CODE,DISTRICT_NAME,UPDATE_DATE,OptimisticLockField)values(@PROVINCE_ID,@DISTRICT_CODE,@DISTRICT_NAME,@UPDATE_DATE,@OptimisticLockField)" 
            UpdateCommand="update COMMON_MASTER_DISTRICT set PROVINCE_ID=@PROVINCE_ID,DISTRICT_CODE=@DISTRICT_CODE,DISTRICT_NAME=@DISTRICT_NAME,UPDATE_DATE=@UPDATE_DATE,OptimisticLockField=@OptimisticLockField where DISTRICT_ID=@DISTRICT_ID" 
            >
            <DeleteParameters>
                <asp:Parameter Name="DISTRICT_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>
<asp:Parameter Name="DISTRICT_ID" Type="Int32" /><asp:Parameter Name="PROVINCE_ID" Type="Int32" />
</SelectParameters>
             </asp:SqlDataSource>

</div>
</asp:Content>

