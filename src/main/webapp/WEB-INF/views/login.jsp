<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 하세요..^^</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
// event 객체 위치 확인하기
 $(function(){
// 	 폼이벤트 처리할때는 event.preventDefault();가 안먹는 이유...알아내기
	 $("#loginForm").on("submit", function(){
// 		 event.preventDefault();
		 var id=$("#id").val();
		 var pass=$("#pass").val(); 
		 
		 if(id==""){
		 	alert("아이디를 입력하세요");
		 	$("#id").focus();
		 	return false;
		 }
		 if(pass==""){
		 	alert("패스워드를 입력하세요");
		 	$("#pass").focus();
		 	return false;
		 }	
		 $("#loginForm").submit();
	 })
	 
	 $("input[id=join]").on("click",function(){
		 document.location.href='join.bbs';
	 })
 });
</script>
</head>
<body>
<center>
	<form action="/bbs/login.bbs" method="post" id="loginForm">
		<input type="hidden" name="loginPath" value="${writeForm}">
          <label for="id"> I&nbsp;&nbsp;&nbsp;&nbsp;D : <input type="text" name="id" id="id"></label>
          <label for="pass">PASS : <input type="text" name="pass" id="pass"></label>
          <input type="submit" value="로그인">
          <input type="reset" value="취소">
          <input type="button" value="회원가입" id="join">          
   </form>
   </center>
</body>
</html>