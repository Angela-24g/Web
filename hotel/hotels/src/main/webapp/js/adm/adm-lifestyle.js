//adm/lifestyle/list 필터링 시작
function chageLangSelect(_obj){
	var selectBox = _obj;
	
	// select element에서 선택된 option의 value가 저장된다. 
	var selectValue = selectBox.options[selectBox.selectedIndex].value; 
	// select 의 name 이 저장된다.
	var selectName = _obj.name;
	if(selectValue=='전체'){
		location.href="/adm/lifestyle/list";
	}else{
		location.href="/adm/lifestyle/list?a=search&page=1&col="+selectName+"&kwd="+selectValue;
	}
}
//adm/lifestyle/list 필터링 끝