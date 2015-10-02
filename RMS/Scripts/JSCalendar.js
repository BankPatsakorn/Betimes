function calendar(ec){
		this.EH="1.0.003";
		this.XH=0;
		this.GW=0;
		this.ot=0;
		this.Ph=new Z(ec);
		this.IR=new Date();
		this.dN=this.IR.getFullYear();
		this.FL=Array(43);
		this.aryMonths=Array("ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค.");
		this.aryDays=Array("อา","จ","อ","พ","พฤ","ศ","ส");
		this.Ms=glbCalendars.length;
		glbCalendars[glbCalendars.length]=this;
		this.Di="caldiv_"+this.Ms;
		this.cK=false;
		this.KG=Array(3);
		this.tK="";
		this.YK=null;
		this.DA=null;
		this.Ce=null;
		this.UZ=this.Ph.Qd("FIELD")?eval(this.Ph.Qd("FIELD")):null;
		this.Rh=this.Ph.Qd("FORMAT")?this.Ph.Qd("FORMAT"):"0";
		this.sI="";
		this.uY=true;
		this.Zd=true;
		this.UA=true;
		this.ge=4000;
		this.Er=0;
		this.gf=null;
		this.fD=null;
		this.xW="basic";
		this.Ja=Ja;this.ie=ie;this.Gg=Gg;this.lc=lc;this.aT=aT;this.GE=GE;this.qr=qr;this.hX=hX;this.FA=FA;this.kl=kl;this.kS=kS;this.ru=ru;this.mw=mw;this.KF=KF;this.writeCalendar=writeCalendar;this.QM=QM;this.Cf=Cf;this.sl=sl;this.Fr=Fr;this.VV=VV;this.aC=aC;this.YQ=YQ;this.vv=vv;this.qb=qb;this.kE=kE;this.MC=MC;this.nR=nR;this.Hr=Hr;this.Nh=Nh;T=this;
		function __PUBLIC__(){}
		function writeCalendar(){
			var m;
			m=document.all?"onClick":"onMouseDown";
			var p=(document.all&&!document.getElementById)?"width:20;":"";
			var O=T.Zd?"onClick":m;
			var g=T.fD?"top:"+T.fD+";":"";
			g+=T.gf?"left:"+T.gf+";":"";g+=g.length>0?"position: absolute;":"";
			T.KF();document.write("<a href='#' "+O+"='if (window.event)window.event.cancelBubble = true;glbCalendars["+T.Ms+"].Ja(event);return false;' onFocus='this.blur();'><img src='../Images/basic/calendar.gif' border='0' align='top' style='"+g+"'></a>");
			document.write("<div id='"+T.Di+"' ");
			document.write("onMouseOut='glbCalendars["+T.Ms+"].vv();' ");
			document.write("style='"+p+"position:absolute;display:none;' class='"+T.xW+"-cl-body'> "); 
			document.write(T.aC()); 
			document.write("</div>"); 
			document.write("<div id='"+T.Di+"_year' ");
			document.write("onMouseOut='glbCalendars["+T.Ms+"].vv();' ");
			document.write("onMouseOver='glbCalendars["+T.Ms+"].kS(this);' ");
			document.write("style='position:absolute;display:none;background-color:white;'> "); 
			document.write(T.VV()); 
			document.write("</div>"); 
			document.write("<div id='"+T.Di+"_month' ");
			document.write("onMouseOut='glbCalendars["+T.Ms+"].qb();' ");
			document.write("onMouseOver='glbCalendars["+T.Ms+"].kS(this);' ");
			document.write("style='position:absolute;display:none;background-color:white;'> "); 
			document.write(T.Fr()); document.write("</div>");
		}
		function __DISPLAY__(){}
		function Ja(ev){
			var V,J=T.YQ(ev); clearInterval(T.YK);
			if(document.getElementById) V=document.getElementById(T.Di);
			else if(document.all) V=document.all[T.Di];
			else V=document.layers[T.Di];
			for(var I=0;I<glbCalendars.length;I++){
				if(!glbCalendars[I].cK){glbCalendars[I].ie();}
				glbCalendars[I].cK=false;
			}
			if(V){
				V.style.display="block";
				T.nR(V,J);V.style.zIndex=++Pf;
			}
		}
		function GE(ev){
			var V,F,S,J=T.YQ(ev);
			clearInterval(T.YK);
			if(document.getElementById){
				V=document.getElementById(T.Di);
				F=document.getElementById(T.Di+"_month");
			}else if(document.all){
				V=document.all[T.Di];
				F=document.all[T.Di+"_month"];
			}else{
				V=document.layers[T.Di];
				F=document.layers[T.Di+"_month"];
			}
			T.Gg();
			if(V){
				F.style.display="block";
				T.Hr(V,F );F.style.zIndex=++Pf;
			}
		}
		function aT(ev){
			var V,e,S,J=T.YQ(ev);
			clearInterval(T.YK);
			if(document.getElementById){
				V=document.getElementById(T.Di);
				e=document.getElementById(T.Di+"_year");
			}else if(document.all){
				V=document.all[T.Di];e=document.all[T.Di+"_year"];
			}else{
				V=document.layers[T.Di];
				e=document.layers[T.Di+"_year"];
			}
			T.lc();
			if(V){
				e.style.display="block";
				T.Nh(V,e );
				e.style.zIndex=++Pf;
			}
		}
		function ie(){
			var V;
			if(document.getElementById){
				V=document.getElementById(T.Di).style;
			}else if(document.all){
				V=document.all[T.Di].style;
			}else{
				V=document.layers[T.Di];
			}
			if(V){
				V.display="none";
			}
			T.Gg();
			T.lc();
			clearInterval(T.YK);
		}
		function lc(){
			var F;
			if(document.getElementById){
				F=document.getElementById(T.Di+"_month").style;
			}else if(document.all){
				F=document.all[T.Di+"_month"].style;
			}else{
				F=document.layers[T.Di+"_month"];
			}
			if(F){
				F.display="none";
			}
		}
		function Gg(){
			var e;
			if(document.getElementById){
				e=document.getElementById(T.Di+"_year").style;
			}else if(document.all){
				e=document.all[T.Di+"_year"].style;
			}else{
				e=document.layers[T.Di+"_year"];
			}
			if(e){
				e.display="none";
			}
		}
		function __EVENTS__(){}
		function kS(argCell){
			clearInterval(T.YK);
			if(argCell.className==T.xW+"-cl-on-month") argCell.className=T.xW+"-cl-on-month-lit";
			else if(argCell.className==T.xW+"-cl-off-month") argCell.className=T.xW+"-cl-off-month-lit";
			else if(argCell.className==T.xW+"-cl-year") argCell.className=T.xW+"-cl-year-lit";
		}
		function ru(argCell){
			if(argCell.className==T.xW+"-cl-on-month-lit") argCell.className=T.xW+"-cl-on-month";
			else if(argCell.className==T.xW+"-cl-off-month-lit") argCell.className=T.xW+"-cl-off-month";
			else if(argCell.className==T.xW+"-cl-year-lit") argCell.className=T.xW+"-cl-year";
		}
		function qr(){
			T.IR.setMonth(++T.GW);KF();
			mw(T.Di,aC());
		}
		function FA(){
			T.dN+=10;
			mw(T.Di+"_year",VV());
		}
		function hX(){
			T.IR.setMonth(--T.GW);
			KF();
			mw(T.Di,aC());
		}
		function kl(){
			T.dN-=10;
			mw(T.Di+"_year",VV());
		}
		function QM(td){
			var D=new Date(td.title);
			var K;
			T.KG[0]=D.getFullYear()+543;//--Edit Chi
			T.KG[1]=T.MC(D.getMonth()+1);
			T.KG[2]=T.MC(D.getDate());
			switch(T.Rh){
				case "1":K=T.KG[0]+T.sI+"-"+ T.KG[1]+T.sI+"-"+T.KG[2];break;
				case "2":K=T.KG[2]+T.sI+"-"+ T.KG[1]+T.sI+"-"+T.KG[0];break;
				default:K=T.KG[1]+T.sI+"-"+ T.KG[2]+T.sI+"-"+T.KG[0];break;
			}
			if(T.UZ) T.UZ.value=K;
			T.tK=K;
		}
		function sl(intYear,ob){
			T.IR.setFullYear(intYear);
			KF();
			mw(T.Di,aC());
			T.cK=true;
			T.Gg();
		}
		function Cf(intMonth,ob){
			T.IR.setMonth(intMonth);
			KF();
			mw(T.Di,aC());
			T.cK=true;
			T.lc();
		}
		function __INTERNAL__(){}
		function KF(){
			var n,X=0;
			var t,A;
			var h=T.IR;
			var I,a=1;
			T.XH=h.getDate();
			T.GW=h.getMonth();
			T.ot=h.getFullYear()+543;
			n=new Date(T.ot-543,T.GW,1);
			X-=n.getDay()>0?n.getDay():n.getDay()+7;
			for(I=0;I<43;I++){
				T.FL[I]=new Date(n.getFullYear(),n.getMonth(),++X);
			}
		}
		function Fr(){
					var innerHTML="";
					innerHTML+="<table cellspacing=0 cellpadding=0 border=0>";
					innerHTML+="<tr>";
					for(var I=0;I<12;I++){ 
					if(I % 6==0) innerHTML+="</tr><tr>";innerHTML+="<td class='"+T.xW+"-cl-year' onMouseOver='glbCalendars["+T.Ms+"].kS(this);' onMouseOut='glbCalendars["+T.Ms+"].ru(this);' style='cursor: hand; cursor: pointer;' onClick='glbCalendars["+T.Ms+"].Cf("+I+");'>";innerHTML+=T.aryMonths[I];innerHTML+="</td>";}innerHTML+="</tr>";innerHTML+="</table>";return innerHTML;}
				function VV(){var innerHTML="";innerHTML+="<table cellspacing=0 cellpadding=0 border=0>";innerHTML+="<tr>";innerHTML+="<td class='"+T.xW+"-cl-year' onMouseOver='glbCalendars["+T.Ms+"].kS(this);' onMouseOut='glbCalendars["+T.Ms+"].ru(this);' style='cursor: hand; cursor: pointer;' onMouseDown='glbCalendars["+T.Ms+"].FA();' align='center' valign='center'>";innerHTML+="<img src='../Images/basic/up.gif' border='0'>";innerHTML+="</td>";innerHTML+="</tr>";for(var I=parseInt(T.dN);I>parseInt(T.dN)-10;I--){innerHTML+="<tr>";innerHTML+="<td class='"+T.xW+"-cl-year' onMouseOver='glbCalendars["+T.Ms+"].kS(this);' onMouseOut='glbCalendars["+T.Ms+"].ru(this);' style='cursor: hand; cursor: pointer;' onClick='glbCalendars["+T.Ms+"].sl("+I+");'>";innerHTML+=I;innerHTML+="</td>";innerHTML+="</tr>";}innerHTML+="<tr>";innerHTML+="<td class='"+T.xW+"-cl-year' onMouseOver='glbCalendars["+T.Ms+"].kS(this);' onMouseOut='glbCalendars["+T.Ms+"].ru(this);' style='cursor: hand; cursor: pointer;' onMouseDown='glbCalendars["+T.Ms+"].kl();' align='center' valign='center'>";innerHTML+="<img src='../Images/basic/down.gif' border='0'>";innerHTML+="</td>";innerHTML+="</tr>";innerHTML+="</table>";return innerHTML;}
				function aC(){var innerHTML="";var P,s; innerHTML+="<table cellspacing=0 cellpadding=0 border=0>"; innerHTML+="<tr>"; innerHTML+="<td align='left' class='"+T.xW+"-cl-header' onMouseOver='glbCalendars["+T.Ms+"].kS(this);'>";innerHTML+="<a href='#' onMouseDown='glbCalendars["+T.Ms+"].hX();return false;' onFocus='this.blur();'><img src='../Images/basic/prev.gif' border='0'></a>";innerHTML+="</td>";innerHTML+="<td align='center' class='"+T.xW+"-cl-header' onMouseOver='glbCalendars["+T.Ms+"].kS(this);'>"; innerHTML+="<a href='#' class='"+T.xW+"-cl-header' onMouseOver='return glbCalendars["+T.Ms+"].GE(event);'>";innerHTML+=T.aryMonths[T.GW];innerHTML+="</a>&nbsp;"; innerHTML+="<a href='#' class='"+T.xW+"-cl-header' onMouseOver='return glbCalendars["+T.Ms+"].aT(event);'>";innerHTML+=T.ot;innerHTML+="</a>";innerHTML+="</td>"; innerHTML+="<td align='right' class='"+T.xW+"-cl-header' onMouseOver='glbCalendars["+T.Ms+"].kS(this);'>";innerHTML+="<a href='#' onMouseDown='glbCalendars["+T.Ms+"].qr();return false;' onFocus='this.blur();'><img src='../Images/basic/next.gif' border='0'></a>";innerHTML+="</td>"; innerHTML+="</tr>"; innerHTML+="<tr>"; innerHTML+="<td colspan=4 style='background-color:white;'>"; innerHTML+="<table cellspacing=0 cellpadding=0 border=0>"; if(T.UA){innerHTML+="<tr class='"+T.xW+"-cl-days'>";for(var l=0;l<7;l++){innerHTML+="<td class='"+T.xW+"-cl-day' onMouseOver='glbCalendars["+T.Ms+"].kS(this);' onMouseOut='glbCalendars["+T.Ms+"].ru(this);'>";innerHTML+=T.aryDays[T.Er+l];innerHTML+="</td>";}innerHTML+="</tr>";} for(var I=1;I<42;){ innerHTML+="<tr>"; for(var a=0;a<7;++a,I++){s=T.FL[I-1+T.Er].toGMTString(); P=T.FL[I-1+T.Er].getMonth()==T.GW?"cl-on-month":"cl-off-month";  innerHTML+="<td class='"+T.xW+"-"+P+"' onMouseOver='glbCalendars["+T.Ms+"].kS(this);' onMouseOut='glbCalendars["+T.Ms+"].ru(this);' style='cursor: hand; cursor: pointer;' title='"+s+"' onClick='glbCalendars["+T.Ms+"].QM(this);'>"; innerHTML+=T.FL[I-1+T.Er].getDate(); innerHTML+="</td>";} innerHTML+="</tr>";}  innerHTML+="</table>"; innerHTML+="</td>"; innerHTML+="</tr>"; innerHTML+="</table>";return(innerHTML);}
				function mw(layerID,txt){if(document.getElementById){document.getElementById(layerID ).innerHTML=txt;}else if(document.all){document.all[layerID].innerHTML=txt;}else if(document.layers){with(document.layers[layerID].document){open();write(txt );close();}}return null;}
				function YQ(e){var r=0;var B=0;if(!e) e=window.event;if(e.pageX||e.pageY){r=e.pageX;B=e.pageY;}else if(e.clientX||e.clientY){r=e.clientX+document.body.scrollLeft;B=e.clientY+document.body.scrollTop;}var Q={l:r,y:B};return Q;}
				function vv(){if(T.YK){clearInterval(T.YK);T.YK=null;}T.YK=setInterval("glbCalendars["+T.Ms+"].ie()",T.ge );}
				function qb(){if(T.Ce){clearInterval(T.Ce);T.Ce=null;}T.Ce=setInterval("glbCalendars["+T.Ms+"].lc()",4000 );T.vv();}
				function kE(){if(T.DA){clearInterval(T.DA);T.DA=null;}T.DA=setInterval("glbCalendars["+T.Ms+"].Gg()",4000 );T.vv();}
				function MC(int_num){var Q;if(int_num<=9){Q=T.uY?"0"+int_num:int_num;}else Q=int_num;return Q;}
				function nR(V,mouse_xy){var v=b(V );var H=G();if(v["gP"]+mouse_xy["l"]>H["l"]) V.style.left=mouse_xy["l"]-v["gP"];else V.style.left=mouse_xy["l"];if(v["VL"]+mouse_xy["y"]>H["y"]) V.style.top=mouse_xy["y"]-v["VL"];else V.style.top=mouse_xy["y"];}
				function Hr(V,mo){var U=b(V );var v=b(mo );var H=G();var d=U["gP"] / 2;var L=v["gP"] / 2;var E=U["l"]-(L-d);var c=U["VL"]+U["y"];mo.style.left=E;if(c+v["VL"]>H["y"]) mo.style.top=c-v["VL"];else mo.style.top=c;}
				function Nh(V,yr){var U=b(V );var w=b(yr );var H=G();if(w["gP"]+U["l"]+U["gP"]>H["l"]) yr.style.left=H["l"]-w["gP"];else yr.style.left=U["l"]+U["gP"]; if(w["VL"]+U["y"]>H["y"]) yr.style.top=U["y"];else yr.style.top=U["y"];}var T;}
				function o(){}        
				function Z(ec){this.XW=new Array();this.bo=new Array();this.KU=KU;this.Qd=Qd;KU(ec,this );
				function KU(argStr,argConfig){var I,C;var N,q;if(argStr) C=argStr.split(";");else return;var N,R,Y;for(I=0;I<C.length;I++){Y=C[I].indexOf(":");if(Y>0){N=C[I].substring(0,Y).toUpperCase();q=C[I].substring(Y+1,C[I].length);if(q.toLowerCase()=="true") q=true;else if(q.toLowerCase()=="false") q=false;argConfig.bo[I]=N;argConfig.XW[I]=q;}}}
				function Qd(argKey){var I;for(I=0;I<this.bo.length;I++){if(this.bo[I]==argKey){return this.XW[I];}}return null;}}
				function f(){for(var I=0;I<glbCalendars.length;I++){if(!glbCalendars[I].cK){glbCalendars[I].ie();}glbCalendars[I].cK=false;}}
				function b(W){var k={l:0,y:0,gP:0,VL:0};if(W!=null){k.VL=W.offsetHeight;k.gP=W.offsetWidth;while(W){k.l+=W.offsetLeft;k.y+=W.offsetTop;W=W.offsetParent;}return(k)}}
				function G(){var k={l:0,y:0};k.l+=document.body.clientWidth;k.y+=document.body.clientHeight;return(k)} var M="";if(document.getElementById&&document.all) M="ie5";else if(document.getElementById&&!document.all) M="ns6";else if(document.all) M="ie4";else if(document.layers) M="ns4";else M="other";var Pf=9999;switch(M){case "ie5":document.attachEvent('onclick',f );break;case "ns6":document.addEventListener('click',f,false );break;case "ns4":break;default:}      
				var glbCalendars=Array();