<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_ROOM_INFO_ListView.aspx.cs" Inherits="RMSM_MDM_ROOM_INFO_ListView" %>

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
    <div class="form-group col-sm-12" style="margin-top: 20px;">
        <div class="col-sm-offset-3 col-sm-6">
        </div>
    </div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">การจัดการห้องประชุม </span><span style="font-size: 20px; color: gray;">(RMS_UT0501)</span>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div id="ROOM_ID" class="form-group col-sm-6">
                <label for="" class="col-sm-4">ห้องประชุม:</label>
                <div class="col-sm-6">
                    <dx:ASPxComboBox
                        ID="ctlROOM_ID" runat="server" Height="30"
                        DropDownStyle="DropDown" DataSourceID="dsRMSM_MDM_ROOM_INFO"
                        TextField="ROOM_NAME" ValueField="ROOM_ID" SelectedIndex="0"
                        Width="100%" IncrementalFilteringMode="StartsWith" />
                </div>

            </div>
        </div>
    </div>

    <div>


        <input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location = 'RMSM_MDM_ROOM_INFO_DetailView.aspx?id=-1';" />
        <input type="button" class='btn btn-primary' value='   ค้นหา   ' onclick="location = '#';" />
    </div>
    <div>&nbsp;</div>
    <div>
        <div>
             <label for="" class="foundNumberObject">พบ xxx รายการ</label>

            <dx:ASPxGridView ID="viewRMSM_MDM_ROOM_INFO_ListView" runat="server" Width="100%"
                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                DataSourceID="dsRMSM_MDM_ROOM_INFO_ListView" KeyFieldName="ROOM_ID" ClientInstanceName="viewRMSM_MDM_ROOM_INFO_ListView" Theme="Metropolis">
                <Columns>


                    <dx:GridViewDataTextColumn FieldName="ROOM_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                        <DataItemTemplate>
                            <a target="_self" href="RMSM_MDM_ROOM_INFO_DetailView.aspx?ROOM_ID=<%#Eval("ROOM_ID") %>">
                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="รหัสห้องประชุม" FieldName="ROOM_CODE" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="ROOM_NAME" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="รูป" FieldName="ROOM_MAPPING" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="สถานะของห้อง" FieldName="ROOM_MAPPING" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                <SettingsCommandButton>
                    <DeleteButton>
                        <Image ToolTip="ลบ" Url="Images/del.png" />
                    </DeleteButton>
                </SettingsCommandButton>
            </dx:ASPxGridView>
            <a id="fancyBoxRMSM_MDM_ROOM_INFO_ListView" class='fancyBox' style="display: none"></a>

        </div>
    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_ROOM_INFO WHERE [ROOM_ID] = @ROOM_ID"
            SelectCommand="select RMSM_MDM_ROOM_INFO.ROOM_ID
,RMSM_MDM_ROOM_INFO.UNIT_ID
,RMSM_MDM_ROOM_INFO.ADMIN_ID
,RMSM_MDM_ROOM_INFO.ROOM_CODE
,RMSM_MDM_ROOM_INFO.ROOM_NAME
,RMSM_MDM_ROOM_INFO.ROOM_MAPPING
 from RMSM_MDM_ROOM_INFO where  1=1  AND RMSM_MDM_ROOM_INFO.ROOM_ID=@ROOM_ID">
            <DeleteParameters>
                <asp:Parameter Name="ROOM_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="ROOM_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>



    <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="select '-1' ROOM_ID,'กรุณาเลือก' ROOM_NAME UNION select ROOM_ID,ROOM_NAME from RMSM_MDM_ROOM_INFO where RECORD_STATUS='A'"></asp:SqlDataSource>
</asp:Content>

