$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html=" + xhr.statusText);
	}
});

$(function(){
	$("#id").on("blur",function(){
		$.ajax({
			url : "/bbs/joinCheckId.bbs",
			data : {
				inputId : $("#id").val()
			},
			success : function(data){
				var html;
				if($("#id").val()==""){
					html="<b>아이디를 입력하세요.</b>"
					$("#idCheckStatus").html(html).css("color","blue");
				}else{
					if(data.idUseStatus=="1"){
						html="<b>사용가능한 아이디 입니다.</b>"
						$("#idCheckStatus").html(html).css("color","green");
					}else{
						html="<b>사용불가능한 아이디 입니다.</b>"
						$("#idCheckStatus").html(html).css("color","red");
					}
				}
			}
		});
	});
});