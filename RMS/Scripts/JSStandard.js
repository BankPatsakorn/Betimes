function Trim(TRIM_VALUE){
    if(TRIM_VALUE.length < 1){
      return'';
    }
    TRIM_VALUE = RTrim(TRIM_VALUE);
    TRIM_VALUE = LTrim(TRIM_VALUE);
    if(TRIM_VALUE==''){
      return '';
    }else{
      return TRIM_VALUE;
    }
}// end function

function RTrim(VALUE){
    var w_space = String.fromCharCode(32);
    var v_length = VALUE.length;
    var strTemp = '';
    if(v_length < 0){
      return'';
    }
    var iTemp = v_length -1;
    while(iTemp > -1){
      if(VALUE.charAt(iTemp) == w_space){
      }else{
        strTemp = VALUE.substring(0,iTemp +1);
        break;
      }
      iTemp = iTemp-1;
    } //End While
    return strTemp;
} //End Function

function LTrim(VALUE){
    var w_space = String.fromCharCode(32);
    if(v_length < 1){
        return'';
    }
    var v_length = VALUE.length;
    var strTemp = '';
    var iTemp = 0;
    while(iTemp < v_length){
      if(VALUE.charAt(iTemp) == w_space){
      }else{
        strTemp = VALUE.substring(iTemp,v_length);
        break;
      }
      iTemp = iTemp + 1;
    } //End While
    return strTemp;
 } //End Function
 
 function HandleOnClose() {
   if (event.clientY < 0) {
      window.returnValue=1;
   }
}
function querySt(ji) {
	hu = window.location.search.substring(1);
	gy = hu.split("&");
	for (i=0;i<gy.length;i++) {
		ft = gy[i].split("=");
		if (ft[0] == ji) {
			return ft[1];
		}//end if
	}//end for
}//end function
function GotoAttach(filename){
	window.open('upload/'+ filename,'','width=500,height=500,status=yes,location=no,resizable=yes');
}//end function
function fnMeetingTime(strDate){
   mainClass.AjxgetXMLMeetingTime(strDate,AjxgetXMLMeetingTime_cBack)
}//end function
function AjxgetXMLMeetingTime_cBack(res){
  if(document.getElementById('tbMeetingTime')!=null){document.getElementById('tbMeetingTime').removeNode(true);}//end if
  if(res.value.Tables[0].Rows.length>0){
     var tbTmp1=document.createElement("table");
        tbTmp1.id="tbMeetingTime";
        tbTmp1.border='0';
        tbTmp1.width='100%';
        var tmpRow = null;
        var tmpCell = null;
        //alert(res.value);
        for(var iiM=0;iiM<=res.value.Tables[0].Rows.length-1;iiM++){
           tmpRow=tbTmp1.insertRow();
           tmpCell=tmpRow.insertCell();
           tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].TIME_PERIOD ;
           tmpCell.width='100%';
           tmpCell.className='string_normal';
        }//end for
        document.getElementById("tdMeetingTime").appendChild(tbTmp1);
   }//end if     
}//end function
function fnMeetingStatus(strDate,province_code, User_Id, Org_Code,type){
   mainClass.AjxgetXMLMeetingStatus(strDate,province_code, User_Id, Org_Code,type,AjxgetXMLMeetingStatus_cBack)
}//end function
function AjxgetXMLMeetingStatus_cBack(res){
  if(document.getElementById('tbMeetingStatus')!=null){document.getElementById('tbMeetingStatus').removeNode(true);}//end if
  if(res.value != null){
      if(res.value.Tables[0].Rows.length>0){
         var tbTmp1=document.createElement("table");
            tbTmp1.id="tbMeetingStatus";
            tbTmp1.border='0';
            tbTmp1.width='100%';
            var tmpRow = null;
            var tmpCell = null;
               tmpRow=tbTmp1.insertRow();
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'โครงการ' ;
               tmpCell.width='50%';
               tmpCell.className='string_bold';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'สถานะ';
               tmpCell.width='60%';
               tmpCell.className='string_bold';
            for(var iiM=0;iiM<=res.value.Tables[0].Rows.length-1;iiM++){
               tmpRow=tbTmp1.insertRow();
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].MEETING_NAME ;
               tmpCell.width='50%';
               //tmpCell.className='string_normal';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].STATUS_NAME + ' ' + res.value.Tables[0].Rows[iiM].STATUS_DETAIL;
               tmpCell.width='50%';
               if((iiM%2) == 0){
                 tmpRow.className='rowgrid_even';
               }else{
                 tmpRow.className='rowgrid_odd';
               }
            }//end for
            //alert(tbTmp1);
            document.getElementById("tdMeetingStatus").appendChild(tbTmp1);
       }//end if 
   }    
}//end function
function fnMeetingCommitee(strWorkGroup_Id){
   mainClass.AjxgetXMLMeetingCommitee(strWorkGroup_Id,AjxgetXMLMeetingCommitee_cBack)
}//end function
function AjxgetXMLMeetingCommitee_cBack(res){
  if(document.getElementById('tbMeetingCommitee')!=null){document.getElementById('tbMeetingCommitee').removeNode(true);}//end if
  if(res.value != null){
      if(res.value.Tables[0].Rows.length>0){
         var tbTmp1=document.createElement("table");
            tbTmp1.id="tbMeetingCommitee";
            tbTmp1.border='0';
            tbTmp1.width='100%';
            var tmpRow = null;
            var tmpCell = null;
               tmpRow=tbTmp1.insertRow();
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'ลำดับ' ;
               tmpCell.width='5%';
               tmpCell.className='string_bold';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'ชื่อ - นามสกุล';
               tmpCell.width='30%';
               tmpCell.className='string_bold';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'ตำแหน่ง';
               tmpCell.width='20%';
               tmpCell.className='string_bold';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'E-mail';
               tmpCell.width='15%';
               tmpCell.className='string_bold';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'โทรศัพท์';
               tmpCell.width='10%';
               tmpCell.className='string_bold';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = 'ตำแหน่งคณะทำงาน';
               tmpCell.width='20%';
               tmpCell.className='string_bold';
            for(var iiM=0;iiM<=res.value.Tables[0].Rows.length-1;iiM++){
               tmpRow=tbTmp1.insertRow();
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].WORK_NO ;
               tmpCell.width='5%';
               tmpCell.className='string_normal';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].PER_NAME + ' ' + res.value.Tables[0].Rows[iiM].PER_SURNAME;
               tmpCell.width='30%';
               tmpCell.className='string_normal';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].POS_NAME;
               tmpCell.width='20%';
               tmpCell.className='string_normal';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].PER_EMAIL;
               tmpCell.width='15%';
               tmpCell.className='string_normal';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].PER_MOBILE_TEL;
               tmpCell.width='10%';
               tmpCell.className='string_normal';
               tmpCell=tmpRow.insertCell();
               tmpCell.innerHTML = res.value.Tables[0].Rows[iiM].POS_WORD_NAME;
               tmpCell.width='20%';
               tmpCell.className='string_normal';
               if((iiM%2) == 0){
                 tmpRow.className='rowgrid_even';
               }else{
                 tmpRow.className='rowgrid_odd';
               }
            }//end for
            //alert(tbTmp1);
            document.getElementById("tdMeetingCommitee").appendChild(tbTmp1);
       }//end if 
   }    
}//end function