function display(sID) {
oObj = document.getElementById(sID);
	if (oObj) {
		oObj.style.display='inline';
	}
}

function hide(sID) {
oObj = document.getElementById(sID);
	if (oObj) {
		oObj.style.display='none';
	}
}

function gettab(id){
	for (i=1;i<=2;i++)
	{
		if (id == i)
		{
			display("box_content"+i);
			
		}else{
			hide("box_content"+i);
			
		}
	}

}
