<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html5>
<html>  
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/1민영.JPG" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/bbs/list.bbs?pageNum=1">Koo's BLOG</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<c:if test="${id!=null}">
                		<li>
                			<a>${id}님 환영합니다 행복한 하루 되세요</a>
                		</li>
                	</c:if>
                    <li>
                        <a href="/bbs/list.bbs?pageNum=1">Home</a>
                    </li>
                    <li>
                        <a href="/bbs/list.bbs?pageNum=1&board=list">Board</a>
                    </li>
                    <li>
                        <a href="/bbs/study.bbs?pageNum=1&board=study">Study</a>
                    </li>
                    
                     <c:if test="${id==null}">
                     <li>
                     	<%@include file="login.jsp" %>
                     </li>
					</c:if>
                    
                     <c:if test="${id!=null}">
                    <li>
                        <a href="#" onclick="window.open('/bbs/readSub.msg','쪽지보내기', 'width=550 height=700 left=100 top=50');">Message</a>
                    </li>
                    <li>
                        <a href="/bbs/logout.bbs">Logout</a>
                    </li>
                    <li>
                        <a href="/bbs/userProfile.bbs">너님 정보</a>
                    </li>
					 </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>