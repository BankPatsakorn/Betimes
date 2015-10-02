var mode = "";
var id = "";
jQuery(document).ready(function() {
    mode = queryStr("mode");
    jQuery('#ddlPROVINC').val(0);
    if (mode == "edit") {
        id = queryStr("id");
        jQuery("#txt_id").val(id);
        fn_edit_data(id);
    }
    $("#txtPER_BIRTH_DATE").datepicker({ dateFormat: 'd/m/yy', isThai: true, zIndex: 5000});
});
function validation() {
    if (jQuery("#txtPER_THAI_ID").val() != "") {
        jQuery("#txtPER_THAI_ID").attr("class", "");
    }
    if (jQuery("#txtPER_BIRTH_DATE").val() != "") {
        jQuery("#txtPER_BIRTH_DATE").attr("class", "");
    }
    if (jQuery("#txtPER_NAME").val() != "") {
        jQuery("#txtPER_NAME").attr("class", "");
    }
    if (jQuery("#ddlPROVINCE").val() != "0") {
        jQuery("#ddlPROVINCE").attr("class", "");
    }
    if (jQuery("#selAmpur").val() != "0") {
        jQuery("#selAmpur").attr("class", "");
    }
    if (jQuery("#selTambol").val() != "0") {
        jQuery("#selTambol").attr("class", "");
    }
    
    
    if (jQuery("#txtPER_THAI_ID").val() == "") 
    {
        alert('กรุณากรอกเลขบัตรประชาชน');
        jQuery("#txtPER_THAI_ID").attr("class", "error");
        return false;
    }
    else if (jQuery("#txtPER_BIRTH_DATE").val() == "") 
    {
    alert('กรุณากรอกวันเกิด');
    jQuery("#txtPER_BIRTH_DATE").attr("class", "error");
    return false;
    }
    else if (jQuery("#txtPER_NAME").val() == "") 
    {
    alert('กรุณากรอกชื่อ');
    jQuery("#txtPER_NAME").attr("class", "error");
    return false;
    }
    else if (jQuery("#ddlPROVINCE").val() == "0") {
        alert('กรุณาเลือกจังหวัด');
        jQuery("#ddlPROVINCE").attr("class", "error");
        return false;
    }
    else if (jQuery("#selAmpur").val() == "0") {
        alert('กรุณาเลือกอำเภอ');
        jQuery("#selAmpur").attr("class", "error");
        return false;
    }
    else if (jQuery("#selTambol").val() == "0") {
        alert('กรุณาเลือกตำบล');
        jQuery("#selTambol").attr("class", "error");
        return false;
    }
    return true;
}
function fn_update_Save() {
    if (validation()) {
        var username = jQuery("#username").val();
        var txt_thai_id = jQuery("#txtPER_THAI_ID").val();
        var txt_birth_date = jQuery("#txtPER_BIRTH_DATE").val();
        var arr = txt_birth_date.split('/');
        txt_birth_date = (parseInt(arr[2]) - 543) + "/" + arr[1] + "/" + arr[0];
        //alert(txt_birth_date);
        var txt_name = jQuery("#txtPER_NAME").val();
        var txt_surname = jQuery("#txtPER_SURNAME").val();
        var txt_email = jQuery("#txtPER_EMAIL").val();
        var txt_tel = jQuery("#txtPER_HOME_TEL").val();
        var txt_address = jQuery("#txtPER_ADDRESS").val();

        var txt_Tambol = jQuery("#selTambol").val();
        var txt_Ampur = jQuery("#selAmpur").val();
        var txt_province = jQuery("#ddlPROVINCE").val();
        var txt_zip_code = jQuery("#txtPER_ZIP_CODE").val();
        var per_mobile = jQuery('#txtPER_MOBILE_TEL').val();
        var id = jQuery('#txt_id').val();
        var path_img = jQuery("#txt_img").val();
        var url = "per_thai_id=" + escape(txt_thai_id);
        url += "&id=" + jQuery("#txt_id").val();
        url += "&per_birth_date=" + escape(txt_birth_date);
        url += "&per_name=" + escape(txt_name);
        url += "&per_surname=" + escape(txt_surname);
        url += "&per_email=" + escape(txt_email);
        url += "&per_tel=" + escape(txt_tel);
        url += "&per_add=" + escape(txt_address);
        url += "&per_tambol=" + escape(txt_Tambol);
        url += "&per_ampur=" + escape(txt_Ampur);
        url += "&per_province=" + escape(txt_province);
        url += "&per_zip_code=" + escape(txt_zip_code);
        url += "&per_mobile=" + escape(per_mobile);
        url += "&path_img=" + path_img;
        url += "&username=" + username;
	    //alert(url);
        var strmode;
        if (mode == "edit") {
            strmode = "update";
        }
        else {
            strmode = "insert";
        }
        $.ajax({
            type: "post",
            url: "../Svc/mt_personal_other.ashx",
            data: "mode=" + strmode + "&" + url,
            dataType: "html",
            async: false,
            success:
            function(txt) {
                window.returnValue = txt;
                self.window.close();
                //window.location="../FormAction/mt_personal_other.aspx?mode=get";
            }

        });
    }
}
function fn_clear() {
    $("#txtPER_THAI_ID").val("");
    $("#txtPER_NAME").val("");
    $("#txtPER_SURNAME").val("");
    $("#txtPER_ADDRESS").val("");
    $("#txtPER_BIRTH_DATE").val("");
    $("#txtPER_EMAIL").val("");
    $("#txtPER_HOME_TEL").val("");
    $("#txtPER_MOBILE_TEL").val("");
    $("#ddlPROVINCE").val("0");
    $("#selAmpur").val("0");
    $("#selTambol").val("0");
}
function fn_edit_data(id) {
    fn_clear();
    var path = "";
    $.ajax({
        type: "get",
        url: "../Svc/mt_personal_other.ashx",
        data: "mode=edit&id=" + id,
        dataType: "xml",
        async: false,
        success:
            function(txt) {
                //alert($(txt).text());
                //fn_clear_cust();
                var dates = new Date($(txt).find('PER_BIRTH_DATE').text());

                dates = dates.getDate() + "/" + (dates.getMonth() + 1) + "/" + (parseInt(dates.getFullYear())+543);
                //alert(dates);
                $("#txtPER_THAI_ID").val($(txt).find('PER_THAI_ID').text());
                $("#txtPER_NAME").val($(txt).find('PER_NAME').text());
                $("#txtPER_SURNAME").val($(txt).find('PER_SURNAME').text());
                $("#txtPER_ADDRESS").val($(txt).find('PER_ADDRESS').text());
                $("#txtPER_BIRTH_DATE").val(dates);
                $("#txtPER_EMAIL").val($(txt).find('PER_EMAIL').text());
                $("#txtPER_HOME_TEL").val($(txt).find('PER_HOME_TEL').text());
                $("#txtPER_MOBILE_TEL").val($(txt).find('PER_MOBILE_TEL').text());


                path = $(txt).find('PER_IMAGE_PATH').text();
                jQuery("#txt_img").val(path);

                if (path != "") {
                    $("#img_upload").attr("src", "../Upload/" + path);
                }
                
                if (mode == "edit") {
                    $("#ddlPROVINCE").val($(txt).find('PROVINCE_CODE').text());
                    fn_get_ampur();
                    $("#selAmpur").val($(txt).find('AMPHUR_CODE').text());
                    fn_get_tambol();
                    $("#selTambol").val($(txt).find('DIST_CODE').text());
                }
                //$("#add_data").dialog("open");


            }
    });
}
function fn_Upload() {

    new Ajax_upload('#btn1', {
        action: '../Svc/UploadHandler.ashx?up=up',
        onSubmit: function(file, ext) {
            if (!(ext && /^(jpg|png|jpeg|gif)$/.test(ext))) {
                alert('กรุณาอัพโหลดเป็นไฟล์รูปภาพ');
                return false;
            } else {
                if (!confirm('ยืนยันการอัพโหลดรูปภาพ')) {
                    return false;
                }

            }
        },
        onComplete: function(file, response) {
             alert('อัพโหลดรูปเจ้าหน้าที่เรียบร้อยแล้ว');
            var path = response.replace("<PRE>", "");
            path = path.replace("</PRE>", "");
           // jQuery("#img_upload").attr('src', "http://webapp.eprovince.go.th/wappMeeting_MICT/tmp/" + path);
			//alert(path);
			$("#img_upload").attr("src", "../tmp/" + path);
            jQuery("#txt_img").val(path);
        }
    });
}
function fn_get_ampur() {
    //ดึงข้อมูลอำเภอ
    var PvId = $("#ddlPROVINCE").val();
	//alert("ll:"+PvId);
	//window.location = "http://webapp.eprovince.go.th/wappMeeting_MICT/Svc/mt_personal_other.ashx?mode=getampur&pvid=" + PvId;
	
    $.ajax({
        type: "get",
        url: "../Svc/mt_personal_other.ashx",
        data: "mode=getampur&pvid=" + PvId,
        dataType: "html",
        async: false,
        success:
            function(txt) {
        $("#div_amphur").html(txt);
        
            }
    });
    //fn_get_tambol();

}
function fn_get_tambol() {
    //ดึงข้อมูลตำบล
    var PvId = $("#ddlPROVINCE").val();
    var AmId = $("#selAmpur").val();
    $.ajax({
        type: "get",
        url: "../Svc/mt_personal_other.ashx",
        data: "mode=gettambol&pvid=" + PvId + "&ampur=" + AmId,
        dataType: "html",
        async: false,
        success:
            function(txt) {
        $("#div_tambol").html(txt);
            }
    });
}


function fn_cancle() {
    window.location = "../FormAction/mt_personal_other.aspx?mode=get";
}

function queryStr(ji) {
    hu = window.location.search.substring(1);
    gy = hu.split("&");
    for (i = 0; i < gy.length; i++) {
        ft = gy[i].split("=");
        if (ft[0] == ji) {
            return ft[1];
        }
    }
}