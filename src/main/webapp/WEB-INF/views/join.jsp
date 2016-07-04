<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입부터 해라</title>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
$.ajaxSetup({
	type:"POST",
	async:true,
	dataType:"json",
	error:function(xhr){
		alert("error html="+xhr.statusText);
	}
});

// $(function(event){
// 	 $("#id").on("blur", function(){	// blur - 요소에서 포커스를 제거한다.
// 		 $.ajax({
// 			 url:"/bbs/joinIdCheck.bbs",
// 			 data:{
// 				 inputId:$("#id").val()
// 			 },
// 			 success : function(data){
// 				 var html;
// 				 if(data.idUseStatus=="1"){	// 서버에서 보낸 (JoinIdCheckImpl에서 보낸) 데이터가 들어온다
// 					html="<b>사용가능한 아이디 입니다</b>"
// 					$("#idCheckStatus").html(html).css("color", "blue");
// 				 }else{
// 					 html="<b>구린 아이디 입니다<b>";
// 					 $("#idCheckStatus").html(html).css("color", "red");
// 				 }
// 			 }
// 		 })
// 	 })
// });

</script>
</head>
<body>
<form action="/bbs/joinMember.bbs" method="post">
          <label for="id"> I  D : <input type="text" name="id" id="id"></label>
<!--           id중복체크 버튼 눌리면 ajax로 id 텍스트값 전송되서 그걸로 쿼리 하도록 -->
<!--           <input type="button" id="idCheck" value="ID 중복체크"> <br>	 -->
          <div id="idCheckStatus"></div>	<!-- ajax로 바로 사용가능한 아이디라고 뜨도록 -->
          PASS : <input type="text" name="pass"><br>
          	이름: <input type="text" name="name"><br>
          <input type="submit" value="가입하기">
          <a href="/bbs/list.bbs?pageNum=1"><input type="button" value="취소">      </a> 
<!--           <input type="button" value="취소" onclick="document.location.href='/bbs/list.bbs?pageNum=1'"> -->
   </form>
</body>
</html>