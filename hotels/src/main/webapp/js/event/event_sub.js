function jsView() {
	$("#P_SEQ").val(P_SEQ);
	$("#form1").attr("action", "/event/eventView");
	$("#form1").submit();
}
function jsList() {

   var referer = "/event";

   $("#form1").attr("action", referer);
   $("#form1").attr("method", "post");
   $("#form1").submit();
}