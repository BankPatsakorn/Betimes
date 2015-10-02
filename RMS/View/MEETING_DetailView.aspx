<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="MEETING_DetailView.aspx.cs" Inherits="MEETING_DetailView" %>




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

        .Div1 ul
        {
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .Div1 ul li
            {
                padding-left: 1em;
                text-indent: -.7em;
            }

                .Div1 ul li:before
                {
                    content: "• ";
                    color: blue; /* or whatever color you prefer */
                }

            .Div1 ul li
            {
                display: inline;
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
        <span style="font-size: 23px">การประชุมของท่าน</span><span style="font-size: 20px; color: gray;"> (RMS_UT0101)</span>
    </div>
    <div class="col-sm-12">


        <div class="row">
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-6">
                        <div id="ROOM_ID" class="form-group col-sm-12">
                            <label for="" class="col-sm-4">ห้องประชุม</label>
                            <div class="col-sm-8">
                                <dx:ASPxComboBox
                                    ID="ctlROOM_ID" runat="server" Height="30"
                                    DropDownStyle="DropDown" DataSourceID="dsRMSM_MDM_ROOM_INFO"
                                    TextField="ROOM_NAME" ValueField="ROOM_ID" SelectedIndex="0"
                                    Width="100%" IncrementalFilteringMode="StartsWith" />
                            </div>

                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div id="MONTH_ID" class="form-group col-sm-12">
                            <label for="" class="col-sm-4">เดือน</label>
                            <div class="col-sm-8">
                                <dx:ASPxComboBox
                                    ID="ctlMONTH_ID" runat="server" Height="30"
                                    DropDownStyle="DropDown" DataSourceID="dsMONTH"
                                    TextField="txt" ValueField="id" SelectedIndex="0"
                                    Width="100%" IncrementalFilteringMode="StartsWith" />


                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-sm-2">
                <input type="button" value="จองห้องประชุม" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_DetailView.aspx?id=-1';" />
            </div>
        </div>

        <iframe src="dhtmlxscheduler.aspx?view=month&id=" style="width: 100%; height: 500px; border: 1px;"></iframe>
        <br />
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-sm-12">
                    <div id="Div2" class="Div1">
                        <ul>
                            <li>ห้องประชุม ศทก.</li>
                            <li>ห้องประชุมเอนกประสงค์</li>
                            <li>ห้องประชุมรพีพรรณ</li>
                            <li>ห้องประชุม ศทก.</li>
                            <li>ห้องประชุมเอนกประสงค์</li>
                            <li>ห้องประชุมรพีพรรณ</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="col-sm-12">
<div class="tabbable"><!--open tabhead 18-->
<ul id="ultab18" class="nav nav-tabs tab-bricky">
<li class="" ><!--open tabpage 19-->
<a href="#tabpage1" data-toggle="tab">
ตรวจสอบ/จองห้องประชุม
</a>
</li>
</ul><!--end tabhead 28-->
</div><!--end tabhead 28-->
<div class="tab-content"><!--open tab content 18-->
<div class="tab-pane " id="tabpage1"><!--open tabpage 19-->
<div class="row">
<div class="col-sm-12">
<div  class="row"> <!--row 20-->
<div  class="col-sm-6">
     <!--col 21-->
</div><!--end col 24-->
</div><!--end row 25-->
<!--button26-->

    
</div>
</div>
</div><!--end tabpage 27-->
</div><!--end tab 28-->
</div>--%>
    </div>
    <div>

        <asp:SqlDataSource ID="dsMEETING_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_ROOM_INFO WHERE [ROOM_ID] = @ROOM_ID"
            SelectCommand="select 
RMSM_MDM_ROOM_INFO.ROOM_ID
,RMSM_MDM_ROOM_INFO.ROOM_NAME
,COMM_MDM_MONTH_INFO.MONTH_ID
,[OPM_COMMON_DATA].[dbo].COMM_MDM_MONTH_INFO.MONTH_NAME
from RMSM_MDM_ROOM_INFO 
left join [OPM_COMMON_DATA].[dbo].COMM_MDM_MONTH_INFO on  
[dbo].RMSM_MDM_ROOM_INFO.[MONTH_ID] = [OPM_COMMON_DATA].[dbo].COMM_MDM_MONTH_INFO.MONTH_ID
where  1=1  AND RMSM_MDM_ROOM_INFO.ROOM_ID=@ROOM_ID"
            InsertCommand="insert into RMSM_MDM_ROOM_INFO
(
ROOM_ID
)
values
(
@ROOM_ID
)"
            UpdateCommand="update RMSM_MDM_ROOM_INFO 
set 
ROOM_ID=@ROOM_ID
 
where  1=1 
 AND ROOM_ID=@ROOM_ID">
            <DeleteParameters>
                <asp:Parameter Name="ROOM_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="ROOM_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsCOMM_MDM_MONTH_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MONTH_NAME,MONTH_ID from [OPM_COMMON_DATA].][dbo].COMM_MDM_MONTH_INFO"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select '-1' ROOM_ID,'กรุณาเลือก' ROOM_NAME UNION select ROOM_ID,ROOM_NAME from RMSM_MDM_ROOM_INFO where RECORD_STATUS='A'"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsMONTH" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select '-1' id, 'กรุณาเลือก' txt  union all select '0','มกราคม'  union all select '1','กุมภาพันธ์' 
         union all select '3','มีนาคม' union all select 'R','เมษายน' union all select 'R','พฤษภาคม' union all select 'R','มิถุนายน'  union all select 'R','กรกฏาคม'
        union all select 'R','สิงหาคม' union all select 'R','กันยนยน' union all select 'R','ตุลาคม' union all select 'R','พฤศจิกายน'
        union all select 'R','ธันวาคม'"></asp:SqlDataSource>

    </div>
</asp:Content>

