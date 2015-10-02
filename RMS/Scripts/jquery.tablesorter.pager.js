	    var xtype='';
(function($) {
    $.extend({
        tablesorterPager: new function() {
            function updatePageDisplay(c) {
                if (xtype == '0') {
                    var s = $(c.cssPageSize, c.container).val(c.page + 1);
                }
                else {
                    var ss = $(c.cssPageSize, c.container).val(c.page + 1);
                }
                //var s = $(c.cssPageDisplay,c.container).val((c.page+1) + c.seperator + c.totalPages);
            }
            function fn_link(ss, tt) {
                var i = 1;
                var str_link = "";
                var int_show_page = ss;
                var int_total_page = tt;
                str_link = "<a href='#' class ='first' >" +
                        "<img src='../images/icons/resultset_first.png' style='cursor:hand' border='0' /></a>&nbsp;" +
			            "<img src='../images/icons/resultset_previous.png' class ='prev' style='cursor:hand' title='ก่อนหน้า'  />&nbsp;" +
			            "<select class='pagesize' style='font-size:x-small;font-color:#143270;font-face:tahoma;'>";
                for (i = 1; i <= int_total_page; i++) {
                    str_link += "<option  value='" + i + "'>" + (((i - 1) * ss) + (1)) + "-" + (ss * i) + "</option>";
                }
                str_link += "</select>&nbsp;" +
			                    "<img src='../images/icons/resultset_next.png' class ='next' style='cursor:hand' title='ถัดไป' />&nbsp; " +
			                    "<a href='#' class ='last'>" +
			                    "<img src='../images/icons/resultset_last.png'  style='cursor:hand' border='0' /></a>";
                return str_link;
            }
            function setPageSize(table, size) {
                var c = table.config;
                c.size = size;
                c.totalPages = Math.ceil(c.totalRows / c.size);
                c.pagerPositionSet = false;
                xtype = "0";
                moveToPage(table);
                fixPosition(table);
            }

            function fixPosition(table) {
                var c = table.config;
                if (!c.pagerPositionSet && c.positionFixed) {
                    var c = table.config, o = $(table);
                    if (o.offset) {
                        c.container.css({
                            top: o.offset().top + o.height() + 'px',
                            position: 'absolute'
                        });
                    }
                    c.pagerPositionSet = true;
                }
                //;
            }

            function moveToFirstPage(table) {
                var c = table.config;
                c.page = 0;
                xtype = "0";
                moveToPage(table);
            }

            function moveToLastPage(table) {
                var c = table.config;
                c.page = (c.totalPages - 1);
                xtype = "0";
                moveToPage(table);
            }

            function moveToNextPage(table) {
                var c = table.config;
                c.page++;
                if (c.page >= (c.totalPages - 1)) {
                    c.page = (c.totalPages - 1);
                }
                xtype = "0";
                moveToPage(table);
            }

            function moveToPrevPage(table) {
                var c = table.config;
                c.page--;
                if (c.page <= 0) {
                    c.page = 0;
                }
                xtype = "0";
                moveToPage(table);
            }
            function moveToNumPage(table, num_page) {

                var c = table.config;
                c.page = num_page - 1;
                xtype = "1";
                moveToPage(table);
            }

            function moveToPage(table) {
                var c = table.config;
                if (c.page < 0 || c.page > (c.totalPages - 1)) {
                    c.page = 0;
                }

                renderTable(table, c.rowsCopy);
            }

            function renderTable(table, rows) {

                var c = table.config;
                var l = rows.length;
                var s = (c.page * c.size);
                var e = (s + c.size);
                if (e > rows.length) {
                    e = rows.length;
                }

                var tableBody = $(table.tBodies[0]);

                // clear the table body

                $.tablesorter.clearTableBody(table);

                for (var i = s; i < e; i++) {

                    //tableBody.append(rows[i]);

                    var o = rows[i];
                    var l = o.length;
                    for (var j = 0; j < l; j++) {

                        tableBody[0].appendChild(o[j]);

                    }
                }

                fixPosition(table, tableBody);

                $(table).trigger("applyWidgets");

                if (c.page >= c.totalPages) {
                    moveToLastPage(table);
                }

                updatePageDisplay(c);
            }

            this.appender = function(table, rows) {

                var c = table.config;

                c.rowsCopy = rows;
                c.totalRows = rows.length;
                c.totalPages = Math.ceil(c.totalRows / c.size);
                var s = $(c.cssPageDisplay, c.container).html(fn_link(c.size, c.totalPages));
                xtype = "0";
                renderTable(table, rows);

            };

            this.defaults = {
                size: 20,
                offset: 0,
                page: 0,
                totalRows: 0,
                totalPages: 0,
                container: null,
                cssNext: '.next',
                cssPrev: '.prev',
                cssFirst: '.first',
                cssLast: '.last',
                cssPageDisplay: '.pagedisplay',
                cssPageSize: '.pagesize',
                seperator: "/",
                positionFixed: true,
                appender: this.appender
            };

            this.construct = function(settings) {

                return this.each(function() {

                    config = $.extend(this.config, $.tablesorterPager.defaults, settings);


                    var table = this, pager = config.container;
                    var _pagesize = 20;
                    $(this).trigger("appendCache");

                    config.size = _pagesize;
                    //config.size = parseInt($(".pagesize",pager).val());
                    $(config.cssFirst, pager).click(function() {
                        moveToFirstPage(table);
                        return false;
                    });
                    $(config.cssNext, pager).click(function() {
                        moveToNextPage(table);
                        return false;
                    });
                    $(config.cssPrev, pager).click(function() {
                        moveToPrevPage(table);
                        return false;
                    });
                    $(config.cssLast, pager).click(function() {
                        moveToLastPage(table);
                        return false;
                    });
                    $(config.cssPageSize, pager).change(function() {
                        //alert($(this).val());
                        moveToNumPage(table, parseInt($(this).val()));
                        //						 setPageSize(table,parseInt($(this).val()));
                        return false;
                    });

                });
            };

        }
    });
    // extend plugin scope
    $.fn.extend({
        tablesorterPager: $.tablesorterPager.construct
    });

})(jQuery);				