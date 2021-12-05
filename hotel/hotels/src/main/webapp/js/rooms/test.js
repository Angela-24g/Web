function ajaxTest(){
	var html = "";
	$.ajax({
		url : "/test/ajax"
        , method : "post"
        , async : true
		, data : $("#writeFrm").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
			}
		}
	});
}