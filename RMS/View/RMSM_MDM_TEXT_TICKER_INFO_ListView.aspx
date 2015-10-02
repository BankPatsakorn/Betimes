<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_TEXT_TICKER_INFO_ListView.aspx.cs" Inherits="RMSM_MDM_TEXT_TICKER_INFO_ListView" %>

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
        <span style="font-size: 23px">จัดการตัววิ่ง</span><span style="font-size: 20px; color: gray;"> (RMS_UT0509)</span>
    </div>
    <asp:UpdatePanel ID="UpdatePanelIsssAR" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <!--row 18-->
                    <div class="col-sm-10">
                        <!--col 19-->
                        <div id="TEXT_DESC" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">รายละเอียดตัววิ่ง:</label>
                            <div class="col-sm-8">
                                <dx:ASPxTextBox ID="ctlTEXT_DESC" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div id="TEXT_STATUS" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">สถานะการใช้งาน:</label>
                            <div class="col-sm-8">
                                <dx:ASPxRadioButtonList
                                    ID="ctlTEXT_STATUS" runat="server" DataSourceID="dsTEXT_STATUS"
                                    TextField="txt" ValueField="id" Border-BorderStyle="None"
                                    RepeatColumns="4" RepeatLayout="Table">
                                </dx:ASPxRadioButtonList>
                            </div>
                        </div>
                        <div id="TEXT_SPEED" class="form-group col-sm-12">
                            <label for="" class="col-sm-4 control-label">ความเร็วของตัววิ่ง:</label>
                            <div class="col-sm-8">
                                <dx:ASPxRadioButtonList
                                    ID="ctlTEXT_SPEED" runat="server" DataSourceID="dsTEXT_SPEED"
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
                <input type="button" class='btn btn-primary' value=' เพิ่ม ' onclick="location = 'RMSM_MDM_TEXT_TICKER_INFO_DetailView.aspx?id=-1';" />
                <!--button25-->
                <input type="button" value="ค้นหา" class="btn btn-primary" />
                <!--button26-->
                <%--<input type="button" value="ล้างข้อมูล" class="btn btn-primary" />--%>
                <asp:Button Text="ล้างข้อมูล" ID="btnClear" runat="server" CssClass="btn btn-primary" OnClick="btnClear_Click" />
                <div>&nbsp;</div>
        <div>
               <label for="" style="color:gray;">พบ xxx รายการ</label>
        </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <div>


            <dx:ASPxGridView ID="viewRMSM_MDM_TEXT_TICKER_INFO_ListView" runat="server" Width="100%"
                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                DataSourceID="dsRMSM_MDM_TEXT_TICKER_INFO_ListView" KeyFieldName="TEXT_TICKER_ID" ClientInstanceName="viewRMSM_MDM_TEXT_TICKER_INFO_ListView" Theme="Metropolis">
                <Columns>

                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                        ShowDeleteButton="True" ShowSelectCheckbox="False" CellStyle-HorizontalAlign="Center" Width="5%" Caption="ลบ" ButtonType="Image" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="TEXT_TICKER_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="1" CellStyle-HorizontalAlign="Center" Width="5%" Caption="แก้ไข">
                        <DataItemTemplate>
                            <a target="_self" href="RMSM_MDM_TEXT_TICKER_INFO_DetailView.aspx?TEXT_TICKER_ID=<%#Eval("TEXT_TICKER_ID") %>">
                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="รายละเอียดตัววิ่ง" FieldName="TEXT_DESC" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="สถานะการใช้งาน" FieldName="TEXT_STATUS" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="ความเร็วของตัววิ่ง" FieldName="TEXT_SPEED" VisibleIndex="5">
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
            <a id="fancyBoxRMSM_MDM_TEXT_TICKER_INFO_ListView" class='fancyBox' style="display: none"></a>

        </div>
    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_TEXT_TICKER_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_TEXT_TICKER_INFO WHERE [TEXT_TICKER_ID] = @TEXT_TICKER_ID"
            SelectCommand="SELECT [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_TICKER_ID]
,[dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_DESC]
,case when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_STATUS]=0 then 'ใช้งาน' when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_STATUS]=1 then 'ไม่ใช้งาน' end as TEXT_STATUS
,case when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_SPEED]=0 then 'ปกติ' when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_SPEED]=1 then 'ปานกลาง' when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_SPEED]=2 then 'เร็ว' end as TEXT_SPEED
FROM [dbo].[RMSM_MDM_TEXT_TICKER_INFO]
WHERE  [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[RECORD_STATUS] = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="TEXT_TICKER_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsTEXT_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ใช้งาน'  union all select '2','ไม่ใช้งาน' ) aa where id <> '-1'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsTEXT_SPEED" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ช้า'  union all select '2','ปานกลาง'  union all select '3','เร็ว' ) aa where id <> '-1'"></asp:SqlDataSource>
    </div>
</asp:Content>

