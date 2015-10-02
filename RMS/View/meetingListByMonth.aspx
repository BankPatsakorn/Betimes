<%@ Page Title="กำหนดการประชุม - ระบบบริหารการประชุม" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="meetingListByMonth.aspx.cs" Inherits="view_meetingListByMonth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .content {
            padding-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <h4>กำหนดการประชุมของท่าน</h4>
        <div class="col-md-12">
            <div>
                <ul class="nav nav-tabs">
                    <li><a href="meetingListByDay.aspx?pid=<%=user.PERSONAL_ID %>">Day</a></li>
                    <li><a href="meetingListByWeek.aspx?pid=<%=user.PERSONAL_ID %>">Week</a></li>
                    <li class="active"><a href="meetingListByMonth.aspx?pid=<%=user.PERSONAL_ID %>">Month</a></li>
                    <li><a id="a-meeting-task" href="default.aspx">Agenda</a></li>
                </ul>
            </div>
            <iframe src="dhtmlxscheduler.aspx?view=month&pid=<%=user.PERSONAL_ID %>" style="width: 100%; height: 500px; border: none;"></iframe>
        </div>
    </div>
</asp:Content>