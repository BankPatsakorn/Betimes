<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_POPUP_INFO_ListView.aspx.cs" Inherits="RMSM_MDM_POPUP_INFO_ListView" %>

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
    </div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">จัดการ Pop Up</span><span style="font-size: 20px; color: gray;"> (RMS_UT0508)</span>
    </div>

    <asp:UpdatePanel ID="UpdatePanelIsssAR" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <!--row 18-->
                    <div class="col-sm-6">
                        <!--col 19-->
                        <div id="POPUP_NAME" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">ชื่อ Pop Up:</label>
                            <div class="col-sm-8">
                                <dx:ASPxTextBox ID="ctlPOPUP_NAME" runat="server" Height="30" Width="300"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Div1" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">ข้อความ:</label>
                            <div class="col-sm-8">
                                <dx:ASPxTextBox ID="ctlPOPUP_DETAIL" runat="server" Height="30" Width="300"></dx:ASPxTextBox>
                            </div>
                        </div>
                          <div id="ROOM_ID" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxComboBox
                                                ID="ctlROOM_ID" runat="server"
                                                DropDownStyle="DropDown" Height="30"
                                                DataSourceID="dsRMSM_MDM_ROOM_INFO"
                                                TextField="ROOM_NAME" ValueField="ROOM_ID"
                                                Width="100%" IncrementalFilteringMode="StartsWith" />
                                        </div>
                                    </div>
                        <div id="MENU_ID" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">เลือกหน้าจอที่แสดง:</label>
                            <div class="col-sm-8">
                                <dx:ASPxComboBox
                                    ID="ctlMENU_ID" runat="server"
                                    DropDownStyle="DropDown" Height="30"
                                    DataSourceID="dsRMSM_MDM_MENU_INFO"
                                    TextField="MENU_NAME" ValueField="MENU_ID"
                                    Width="100%" IncrementalFilteringMode="StartsWith" />
                            </div>
                        </div>
                        <div id="POPUP_STATUS" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">สถานะการใช้งาน:</label>
                            <div class="col-sm-8">
                                <dx:ASPxRadioButtonList
                                    ID="ctlPOPUP_STATUS" runat="server" DataSourceID="dsPOPUP_STATUS"
                                    TextField="txt" ValueField="id" Border-BorderStyle="None"
                                    RepeatColumns="4" RepeatLayout="Table">
                                </dx:ASPxRadioButtonList>
                            </div>
                        </div>
                    </div>
                    <!--end col 23-->
                </div>
                <!--end row 24-->
                <!--button27-->
                <input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location = 'RMSM_MDM_POPUP_INFO_DetailView.aspx?id=-1';" />
                <!--button25-->
                <input type="button" value="ค้นหา" class="btn btn-primary" />
                <!--button26-->
                <asp:Button Text="ล้างข้อมูล" CssClass="btn btn-primary" ID="btnClear" OnClick="btnClear_Click" runat="server" />
                <div>&nbsp;</div>
        <div>
               <label for="" style="color:gray;">พบ xxx รายการ</label>
        </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <div>

            <asp:SqlDataSource ID="dsRMSM_MDM_MENU_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="select MENU_NAME,MENU_ID from RMSM_MDM_MENU_INFO"></asp:SqlDataSource>

            <asp:SqlDataSource ID="dsPOPUP_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ใช้งาน'  union all select '2','ไม่ใช้งาน' ) aa where id <> '-1'"></asp:SqlDataSource>

            <dx:ASPxGridView ID="viewRMSM_MDM_POPUP_INFO_ListView" runat="server" Width="100%"
                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                DataSourceID="dsRMSM_MDM_POPUP_INFO_ListView" KeyFieldName="POPUP_ID" ClientInstanceName="viewRMSM_MDM_POPUP_INFO_ListView" Theme="Metropolis">
                <Columns>

                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" Caption="ลบ" ShowClearFilterButton="True"
                        ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="POPUP_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="1" Caption="แก้ไข" CellStyle-HorizontalAlign="Center">
                        <DataItemTemplate>
                            <a target="_self" href="RMSM_MDM_POPUP_INFO_DetailView.aspx?POPUP_ID=<%#Eval("POPUP_ID") %>">
                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ชื่อ Pop UP" FieldName="POPUP_NAME" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ข้อความ" FieldName="POPUP_NAME" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ห้องประชุม" FieldName="MEETING_ROOM_NAME" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="หน้าจอที่แสดง" FieldName="MENU_NAME" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataSpinEditColumn Caption="สถานะการใช้งาน" FieldName="POPUP_STATUS" VisibleIndex="5">
                    </dx:GridViewDataSpinEditColumn>
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
            <a id="fancyBoxRMSM_MDM_POPUP_INFO_ListView" class='fancyBox' style="display: none"></a>

        </div>
    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_POPUP_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_POPUP_INFO WHERE [POPUP_ID] = @POPUP_ID"
            SelectCommand="SELECT [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_ID]
,[dbo].[RMSM_MDM_POPUP_INFO].[POPUP_NAME]
,[dbo].[RMSM_MDM_MENU_INFO].[MENU_NAME]
            ,'ห้องประชุม ศทก.' as MEETING_ROOM_NAME
,case when [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_STATUS]=0 then 'ใช้งาน' when [dbo].[RMSM_MDM_POPUP_INFO].[POPUP_STATUS]=1 then 'ไม่ใช้งาน' end as POPUP_STATUS
FROM [dbo].[RMSM_MDM_POPUP_INFO]
LEFT JOIN [dbo].[RMSM_MDM_MENU_INFO] on
[dbo].[RMSM_MDM_POPUP_INFO].[MENU_ID] = [dbo].[RMSM_MDM_MENU_INFO].[MENU_ID]
WHERE [dbo].[RMSM_MDM_POPUP_INFO].[RECORD_STATUS] = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="POPUP_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>
    </div>
</asp:Content>

