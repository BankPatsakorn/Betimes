var trs;
var _table = '';
var _table_name = '';
var _navigate = '';
var _page = 0;
var _count = 0;
var _item = 10;

function InitialTable(tableName, divNavigate) {
    trs = $('#' + tableName + ' tbody tr');

    if (trs.length == 0) {
        trs = $('#' + tableName + ' tr');
    }

    _table_name = tableName;
    _navigate = divNavigate;

    if (trs.length > _item) {
        _count = trs.length;
        _table = $('#' + _table_name).html();
        var html = ''
        for (var i = 0; i < _item; i++) {
            var _tr = $(trs[i]);
            html += _tr.context.outerHTML;
        }

        var temp = $('#' + _table_name);
        var fc = temp[0].firstChild;
        var lc = temp[0].lastChild;
        var table = fc.outerHTML + '<tbody>' + html + '</tbody>';
        $('#' + _table_name).html(table);

        _page = 1;
        SetPageTableNavigatation(_page);
    }
}

function InitialTable2(tableName, divNavigate, item) {
    _item = item;

    InitialTable(tableName, divNavigate);
}

function SetPageTableNavigatation(cur_index) {
    var totalPage = RoundNumber(_count / _item);

    var _html = '';
    if (totalPage > _item) {
        _html = '<a href="javascript:void(0)" onclick="PageChange(1)" class="pageIndex">«</a>';
        for (var i = 1; i <= totalPage; i++) {
            if (i == cur_index) {
                _html += '<span class="current">' + i + '</span>';
            } else {
                _html += '<a href="javascript:void(0)" onclick="PageChange(' + i + ')" class="pageIndex">' + i + '</a>';
            }
        }
        _html += '<a href="javascript:void(0)" onclick="PageChange(' + totalPage + ')" class="pageIndex">»</a>';

        //v2
        _html = '<ul class="pagination pull-right">';
        _html += '<li><a href="javascript:void(0)" title="หน้าแรก" onclick="PageChange(1)"><span class="fa fa-fast-backward"></span></a></li>';
        for (var i = 1; i <= totalPage; i++) {
            if (i == cur_index) {
                _html += '<li class="active"><a href="javascript:void(0)" title="หน้า ' + i + '" onclick="PageChange(' + i + ');">' + i + '</a></li>';
            } else {
                _html += '<li><a href="javascript:void(0)" title="หน้า ' + i + '">' + i + '</a></li>';
            }
        }
        _html += '<li><a href="javascript:void(0)" title="หน้าสุดท้าย" onclick="PageChange(' + totalPage + ');"><span class="fa fa-fast-forward"></span></a></li>';
        _html += '</ul>';
    } else {
        _html = '<a href="javascript:void(0)" onclick="PageChange(1)" class="pageIndex">«</a>';
        for (var i = 1; i <= totalPage; i++) {
            if (i == cur_index) {
                _html += '<span class="current">' + i + '</span>';
            } else {
                _html += '<a href="javascript:void(0)" onclick="PageChange(' + i + ')" class="pageIndex">' + i + '</a>';
            }
        }
        _html += '<a href="javascript:void(0)" onclick="PageChange(' + totalPage + ')" class="pageIndex">»</a>';

        //v2
        _html = '<ul class="pagination pull-right">';
        _html += '<li><a href="javascript:void(0)" title="หน้าแรก" onclick="PageChange(1)"><span class="fa fa-fast-backward"></span></a></li>';
        for (var i = 1; i <= totalPage; i++) {
            if (i == cur_index) {
                _html += '<li class="active"><a href="javascript:void(0)" title="หน้า ' + i + '">' + i + '</a></li>';
            } else {
                _html += '<li><a href="javascript:void(0)" title="หน้า ' + i + '" onclick="PageChange(' + i + ');">' + i + '</a></li>';
            }
        }
        _html += '<li><a href="javascript:void(0)" title="หน้าสุดท้าย" onclick="PageChange(' + totalPage + ');"><span class="fa fa-fast-forward"></span></a></li>';
        _html += '</ul>';
    }

    $('#' + _navigate).html(_html);
}

function PageChange(index) {
    var cur_table = $('#' + _table_name).html();
    $('#' + _table_name).html(_table);

    var html = '';
    var cur_max_items = 0;
    var totalPage = RoundNumber(_count / _item);
    if (index == 1) {
        if (_count > _item) {
            cur_max_items = _item;
        } else {
            cur_max_items = _count;
        }

        for (var i = 0; i < cur_max_items; i++) {
            var _tr = $(trs[i]);
            html += _tr.context.outerHTML;
        }
    } else {
        var item_to_display = _count - ((index - 1) * _item);
        if (item_to_display >= _item) {
            cur_max_items = index * _item;
        } else if (item_to_display == 0) {
            cur_max_items = index * _item;
        } else {
            cur_max_items = ((index - 1) * _item) + item_to_display;
        }

        for (var i = (index - 1) * _item; i < cur_max_items; i++) {
            var _tr = $(trs[i]);
            html += _tr.context.outerHTML;
        }
    }

    var temp = $('#' + _table_name);
    var fc = temp[0].firstChild;
    var lc = temp[0].lastChild;
    var table = fc.outerHTML + '<tbody>' + html + '</tbody>';
    $('#' + _table_name).html(table);

    SetPageTableNavigatation(index);
}

function RoundNumber(num) {
    var x = num / 1;
    var y = num % 1;
    var z = parseInt(x, 10);
    if (y > 0) {
        z++;
    }

    return z;
}