<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>  
<head>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/척.jpg" />
<title>게시판에 오신것을.. 환영한다~</title> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/ribbon.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<%@include file="navbar.jsp" %>

<%=application.getInitParameter("saveDir") %>
 <br/><br/><br/>
<div align="center">
<h1>
	<c:if test="${table=='bbs2'}">
	자유게시판
	</c:if>
	<c:if test="${table=='study'}">
	Study
	</c:if>
	<br/><small>
	<c:if test="${table=='bbs2'}">
	니가 뭘하든 용서한다 (테러제외)
	</c:if>
	<c:if test="${table=='study'}">
	자료 공유점여
	</c:if>
	</small></h1>
</div>
<table class="responsive" style="margin: auto;  min-width: 400px;">
  <tr>
  <td><font>(글 : ${totalCount}개)</font> </td>
		<td align="center"><font><marquee scrolldelay="50" onmouseover="stop();" onmouseout="start();" scrollamount="5" direction="right">~~~ ${id}님 환영합니다 ~~~  </marquee></font></td>
    <td align="right" >
       <a href="/bbs/writeForm.bbs">글쓰기</a>
    </td>
    <td class="time">
    	<script>
			var times=today.getHours();
			document.write('현재시간'+times);
		</script>
    </td>
  </tr>
</table>

<table class="responsive"  style="border-style:outset;border-color:saddlebrown;
border-width=10;" border="1" width="700" cellpadding="0" cellspacing="0" align="center" bgcolor="EEEEA4"> 
    <tr height="30" > 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td>          
    </tr>

   <c:forEach var="article" items="${articleList}">
   <tr height="30">
    <td align="center"  width="50" >
	  <c:out value="${article.articleNum}"/>	   
	</td>
    <td  width="250" >  
      <c:if test="${article.depth > 0}">
	  	<img src="/img/blank.jpg" width="${10 * article.depth}"  height="16">
	    <img src="resources/images/re2.gif">
	  </c:if>
	  <c:if test="${article.depth == 0}">
	    <img src="/img/blank.jpg" width="0"  height="16">
	  </c:if>         
      <a href="/bbs/content.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}">
          ${article.title}</a> 
          <c:if test="${article.hit >= 20}">	<!-- 조회수 20 이상일 때 -->
            <img src="/img/hit.gif" border="0" height="14">
		  </c:if>
	</td>
    <td align="center"  width="100"><a href="#" onclick="window.open('/bbs/msgForm.msg?subID=${article.id}','쪽지보내기', 'left=100 top=50 width=700 height=500');">${article.id}</a></td>
    <td align="center"  width="150">${article.writeDate}</td>
    <td align="center"  width="50">${article.hit}</td>
  </tr>
  </c:forEach>
  <tr>	  
      <td colspan="5" align="center" height="40">	 
	  ${pagecode}
	  </td>
  </tr>
</table>
</body>
</html>