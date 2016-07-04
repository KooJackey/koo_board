<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(function(){
$("input[id=logout]").on("click",function(){
		 document.location.href='logout.bbs';
	 })
});
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="/bbs/logout.bbs" method="post" id="logout">
<%-- 	<font>${id }님 환영합니다</font>&nbsp;		  --%>
		<input type="button" id="logout" value="로그아웃">
	</form>
	&nbsp;
	<input type="button" value="쪽지창" id="pop" onclick="window.open('/bbs/readSub.msg','쪽지보내기', 'left=100 top=50');" >
<!-- 	<input type="button" value="쪽지창" id="pop" onclick="document.location.href='/bbs/read.msg'" > -->
</body>
</html>