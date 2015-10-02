<%@ Page Title="ยืนยันการประชุม - ระบบบริหารการประชุม" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="confirmationList.aspx.cs" Inherits="view_confirmationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#a1').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 400,
                onClosed: function () {
                    window.location.reload(true);
                }
            });
        });

        function CallFancyBox(id) {
            var url = 'modalMeetingConfirm.aspx?id=' + id;
            $('#a1').attr('href', url);
            $('#a1').trigger('click');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div style=" padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
            <span style="font-size: 23px">ยืนยันการเข้าร่วมประชุม</span><span style="font-size: 20px; color: gray;"> (RMSM_UT0201)</span>
        </div>
        <div id="divTableMeeting" runat="server">
            <table id='tableMeeting' class='meeting-list-table'>
                <tr>
                    <td style='width: 20%;'>20 ส.ค. 2558</td>
                    <td style='width: 60%;'><a href='#' style='text-decoration: none;' onclick='CallFancyBox(60027);'>การเตรียมความพร้อม</a></td>
                    <td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox(60027);'><span class='label label-success'>ยืนยันการเข้าร่วมประชุม</span></a></td>
                </tr>
                <tr valign='top'>
                    <td>9.00 - 12.00</td>
                    <td>ณ ห้องประชุม 1701</td>
                </tr>
                <tr>
                    <td style='width: 20%;'>20 ส.ค. 2558</td>
                    <td style='width: 60%;'><a href='#' style='text-decoration: none;' onclick='CallFancyBox(60056);'>ทดสอบ</a></td>
                    <td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox(60056);'><span class='label label-default'>ยังไม่ยืนยันการเข้าร่วมประชุม</span></a></td>
                </tr>
                <tr valign='top'>
                    <td>9.00 - 12.00</td>
                    <td>ณ ห้องประชุม 1601</td>
                </tr>
                <tr>
                    <td style='width: 20%;'>20 ส.ค. 2558</td>
                    <td style='width: 60%;'><a href='#' style='text-decoration: none;' onclick='CallFancyBox(60056);'>ทดสอบ</a></td>
                    <td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox(60056);'><span class='label label-default'>ยังไม่ยืนยันการเข้าร่วมประชุม</span></a></td>
                </tr>
                <tr valign='top'>
                    <td>12.00 - 16.00</td>
                    <td>ณ ห้องประชุม 1604</td>
                </tr>
            </table>
        </div>
    </div>
    <div style="display: none;">
        <a id="a1" href="dialogMeetingConfirmation.aspx">fancybox</a>
    </div>
</asp:Content>
