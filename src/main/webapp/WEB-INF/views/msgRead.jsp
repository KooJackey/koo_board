<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
	name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/button.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("form").on("submit",function(){	
		alert("ㅇㅇㅇ");
	}
</script>
<style type="text/css">
.container-fluid {
	max-width: 800px;
	min-width: 500px;
}
/* @media ( max-width : 479px) { */
#divHead {
	text-align: center;
}

/* } */
</style>

<title>너님의 쪽지함</title>
</head>
<body>
	<br />
	<div class="container-fluid">
		<c:if test="${selectMsg==0}">
			<p align="center">${id}님의 받은 쪽지함</p>
		</c:if>
		<c:if test="${selectMsg==1}">
			<p align="center">${id}님의 보낸 쪽지함</p>
		</c:if>
		<br />
		<div class="row">
			<c:if test="${selectMsg==0}">
				<div class="col-xs-2 col-sm-2" id="divHead">보낸넘</div>
			</c:if>
			<c:if test="${selectMsg==1}">
				<div class="col-xs-2 col-sm-2" id="divHead">받은넘</div>
			</c:if>
			<div class="col-xs-5 col-sm-5" id="divHead" style="overflow: hidden">내용</div>
			<div class="col-xs-2 col-sm-2" id="divHead">날짜</div>
			<!-- 			<div class="col-xs-2 col-sm-2">읽음</div> -->
			<div class="col-xs-2 col-sm-2" id="divHead">삭제</div>
			<hr>
			<c:forEach var="msg" items="${msgList}">
				<%-- 					<c:if test="${msg.readStatus==1}"> --%>
				<%-- 					</c:if> --%>
<!-- 				<ul style="height: auto;"> -->
					<div class="col-xs-2 col-sm-2"
						style="list-style: square; text-align: center; overflow: hidden">
						<c:if test="${selectMsg==0}">
							${msg.subID}
						</c:if> 
						<c:if test="${selectMsg==1}">
							${msg.pubID}
						</c:if>
					</div>
					<div class="col-xs-5 col-sm-5" style="list-style: none; float: left;overflow: hidden;">
						${msg.msg}
					</div>
					<div class="col-xs-2 col-sm-2" style="list-style: none; float: left; overflow: hidden; text-align: center;">
						${msg.msgDate}
					</div>
					<div class="col-xs-2 col-sm-2" style="list-style: none; float: left; overflow: hidden; text-align: center;">
					<a href="/bbs/delete.msg?msgNo=${msg.msgNo}">삭제</a>
					</div>

					<%-- 					<c:if test="${msg.readStatus==0}"> --%>
					<!-- 						<li class="col-xs-2" style="list-style: none; float: left;">읽지 않음</li> -->
					<%-- 					</c:if> --%>

				</ul>
				<c:if test="${msg.readStatus==1}">
					</font>
				</c:if>
				<br />
				<hr>
			</c:forEach>
		</div>
		<div align="center">
			<input type="button" class="button" onclick="document.location.href='/bbs/readSub.msg'"
			value="받은 쪽지함"> 
			<input type="button" class="button" onclick="document.location.href='/bbs/readPub.msg'" 
			value="보낸 쪽지함"> 
			<input type="button" class="button" value="닫기" onclick="self.close()">
		</div>
	</div>
</body>
</html>