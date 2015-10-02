<%@ Page Title="" Language="C#" MasterPageFile="~/Master/blank.master" AutoEventWireup="true" CodeFile="modalMeetingConfirm.aspx.cs" Inherits="view_modalMeetingConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- start: FANCYBOX -->
    <link href="../Scripts/fancybox1.3.4/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/fancybox1.3.4/jquery.fancybox-1.3.4.js" type="text/javascript"></script>
    <script src="../Scripts/fancybox1.3.4/jquery.easing-1.3.pack.js" type="text/javascript"></script>
    <script src="../Scripts/fancybox1.3.4/jquery.mousewheel-3.0.4.pack.js" type="text/javascript"></script>
    <!-- end: FANCYBOX -->
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_optionsRadios1').change(function () {
                $('#ContentPlaceHolder1_txtReject').css('display', 'none');
                $('#divOthers').css('display', 'none');
            });
            $('#ContentPlaceHolder1_optionsRadios2').change(function () {
                if ($(this).prop("checked")) {
                    $('#ContentPlaceHolder1_txtReject').css('display', 'block');
                }

                $('#divOthers').css('display', 'none');
            });
            $('#ContentPlaceHolder1_optionsRadios3').change(function () {
                if ($(this).prop("checked")) {
                    $('#divOthers').css('display', 'block');
                }

                $('#ContentPlaceHolder1_txtReject').css('display', 'none');
            });

            $('#a1').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: BindValue
            });

            $('#btnSelectUser').click(function () {
                $('#a1').attr('href', 'dialogUserSelection.aspx');
                $('#a1').trigger('click');
                event.preventDefault();
            });
        });

        function BindValue() {
            if (returnValue == '') return;

            var arrItem = returnValue.split('^');

            if (arrItem.length >= 4) {
                $('#ContentPlaceHolder1_txtInsteadId').val(arrItem[0]);
                $('#ContentPlaceHolder1_txtInstead').val(arrItem[1]);
            }
        }
    </script>
    <style type="text/css">
        .site-header {
            /*background-color: #EEEEEE;*/
            background-color: cornsilk;
            padding: 15px;
            box-shadow: 0px 0px 7px 0px #777;
            position: relative;
            z-index: 100;
        }

        .waves-effect {
            position: relative;
            cursor: pointer;
            display: inline-block;
            overflow: hidden;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-tap-highlight-color: transparent;
            -webkit-transition: all .3s ease-out;
            -moz-transition: all .3s ease-out;
            -o-transition: all .3s ease-out;
            transition: all .3s ease-out;
        }

        .waves-circle {
            text-align: center;
            width: 2.5em;
            height: 2.5em;
            line-height: 2.5em;
            border-radius: 50%;
        }

        .modalButton {
            position: absolute;
            margin-top: -40px;
            margin-left: 75%;
            height: 70px !important;
            width: 70px !important;
            background-color: white;
            border: 0px;
            line-height: initial !important;
            vertical-align: top;
            box-shadow: 0px 1.5px 4px 1.5px rgba(157, 157, 157, 0.5) !important;
            -webkit-transform: translateZ(0);
            -webkit-image-mask: -webkit-radial-gradient(circle, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0));
            z-index: 101;
        }

        .modalImg {
            font-size: 40px;
            line-height: 25px !important;
            color: #f36f46;
        }

        .orangeWave {
            font-size: 25px;
        }

            .orangeWave:hover {
                background-color: orange;
                font-size: 35px;
            }

        .cal_day {
            font-family: Tahoma;
            font-size: 16px;
            font-weight: bold;
            color: #000;
        }
        .cal_date {
            font-family: Tahoma;
            font-size: 50px;
            font-weight: bold;
            color: #000;
        }
        .cal_month {
            font-family: Tahoma;
            font-size: 14px;
            font-weight: bold;
            color: #000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="masthead" class="site-header" role="banner">
        <div class="container">
            <div class="col-sm-3 center">
                <div class="cal_day">
                </div>
                <div class="cal_date">
                    ยืนยัน</div>
                <div class="cal_month">
                </div>
            </div>
            <div class="col-sm-9">
                <div>
                    <h3>
                        &nbsp;</h3>
                </div>
                <div>
                    <h5>
                        &nbsp;</h5>
                </div>
                <div>
                    <p>
                        &nbsp;</p>
                </div>
            </div>
        </div>
    </div>
    <div>
        <nav class="container navbar navbar-default" role="navigation" style="border: none;">
            <button class="modalButton waves-effect waves-circle orangeWave" runat="server" onserverclick="btnSave_Click">
                <span class="glyphicon glyphicon-ok"></span>
            </button>
        </nav>

        <div class="form-horizontal" role="form">
            <div class="radio col-sm-offset-3 col-sm-4">
                <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios1" runat="server" value="option1" checked="true" />
                    เข้าร่วมประชุม
                </label>
            </div>
            <div class="radio col-sm-offset-3 col-sm-4">
                <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios2" runat="server" value="option2" />
                    ไม่เข้าร่วมประชุม
                </label>
            </div>
            <div class="col-sm-offset-3 col-sm-4">
                <input type="text" class="form-control col-sm-3" placeholder="เหตุผล" id="txtReject" runat="server" style="display: none;" />
            </div>
            <div class="radio col-sm-offset-3 col-sm-4">
                <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios3" runat="server"  value="option3" />
                    ให้คนอื่นเข้าร่วมประชุมแทน
                </label>
            </div>
            <div class="col-sm-offset-3 col-sm-4" id="divOthers" style="display: none;">
                <div class="input-group">
                    <input type="text" id="txtInstead"  runat="server" class="form-control col-sm-4" />
                    <span class="input-group-btn">
                        <button id="btnSelectUser" class="btn btn-success" type="button"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none;">
        <a id="a1" href="dialogUserSelection.aspx">fancybox</a>
        <input type="hidden" id="txtInsteadId" runat="server" />
    </div>
</asp:Content>