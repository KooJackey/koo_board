<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" type="image/x-icon" href="resources/images/w_r.JPG" />
	
    <title>Koo's blog - </title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- MetisMenu CSS -->
<!--     <link href="resources/css/metisMenu.min.css" rel="stylesheet"> -->

    <!-- Timeline CSS -->
<!--     <link href="resources/css/timeline.css" rel="stylesheet"> -->

    <!-- Custom CSS -->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<!-- back to TOP -->
<style type="text/css">
	.back-to-top {
		cursor: pointer;
		position: fixed;
		bottom: 20px;
		right: 20px;
		display: none;
	}
</style>




</head>

<body>
<%@ include file="../navbar.jsp" %>
	<br/><br/><br/>
    <div id="wrapper">
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
    
			<div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ${article.title}
                            <p class="pull-right">글쓴이: ${article.id}&nbsp;&nbsp;|&nbsp;&nbsp;조회수 : ${article.hit}&nbsp;&nbsp;|&nbsp;&nbsp;
                            추천 : ${article.good}</p>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="position: 50%;">
                       		 <br/>
                       		<div style="min-height: 400px;">	<!-- 내용 들어갈 div -->
                       		<c:if test="${article.fileStatus !=0}">
							 <c:if test="${fileList!=null }">
							 <ul>
							  <c:forEach var="fileList" items="${fileList}">
								<li>
								<a  href="/bbs/download.bbs?storedFname=${fileList.storedFname}">${fn:substringAfter(fileList.storedFname, "_")}</a>
							  	</li>
								<li>
								<img src="c:/upload${fileList.storedFname}">
							  	</li>
							  </c:forEach>
							 </ul>
							 </c:if>
							</c:if>
                       		${article.content}
                       		</div>
							<button id="1minddal">
								<div class="panel-body" align="center">
									<img src="/img/2민영척.jpg" id="good" width="60" height="80" id="1minddal">
									<br />
									<p id="goodText">1민영</p>
								</div>
							</button>
						<br/><br/>
                       		<div class="panel panel-default" id="userInfo">
                       		<span>
                       		&nbsp;&nbsp;${article.id} <br/>
                       		<img alt="이미지가 없습니다." src="/profile/${userInfo.picture}" 
                                  id="profile_image" width="140" height="140">
                       		</span>
                       		<span>
                       		${userInfo.memo}
                       		</span>
                       		</div>
                       		<div class="text-right">
                       		
       					      <c:if test="${id !=null}">
						    	  <td align="right">	    	
						    	  <div class="btn-group">
						    	  <c:if test="${id == article.id}">
							    	  <input type="button" value="수정하기" class="btn btn-sm btn-primary" onclick="document.location.href='/bbs/update.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}&file=${article.fileStatus}'">
							    	  <input type="button" value="삭제하기" class="btn btn-sm btn-primary" onclick="document.location.href='/bbs/delete.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}'">
						    	  </c:if>
						    	  <c:if test="${id != article.id}">
							    	  <input type="button" value="수정하기" disabled="disabled" class="btn btn-sm btn-primary">
							    	  <input type="button" value="삭제하기" disabled="disabled" class="btn btn-sm btn-primary">
						    	  </c:if>
						    	  		<input type="button" value="목록으로" class="btn btn-sm btn-primary" onclick="document.location.href='/bbs/list.bbs?pageNum=${pageNum}'">
						    	  </div>
						    	  </td>
						      </c:if> 	
						      <c:if test="${id == null}">
						    	  <td align="right">
						    	  <div class="btn-group">
						    	  <input type="button" value="수정하기" disabled="disabled" class="btn btn-sm btn-primary">
						    	  <input type="button" value="삭제하기" disabled="disabled" class="btn btn-sm btn-primary">
						    	  <input type="button" value="목록으로" class="btn btn-sm btn-primary" onclick="document.location.href='/bbs/list.bbs?pageNum=${pageNum}'">
						    	  </div>
						    	  </td>   
			      </c:if>  
                       		</div>
                       		<br/>
                  
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                
                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                  </div>
</div>

<!-- back to TOP -->
		<a id="back-to-top" href="#"
			class="btn btn-primary btn-lg back-to-top" role="button"
			title="Click to return on the top page" data-toggle="tooltip"
			data-placement="left"><span
			class="glyphicon glyphicon-chevron-up"></span></a>

	</div>
    <!-- /#wrapper -->

<!--     <script src="resources/js/jquery.min.js"></script> -->
<!--     <script src="resources/js/bootstrap.min.js"></script> -->


<!-- back to TOP -->
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 50) {
					$('#back-to-top').fadeIn();
				} else {
					$('#back-to-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-to-top').click(function() {
				$('#back-to-top').tooltip('hide');
				$('body,html').animate({
					scrollTop : 0
				}, 800);
				return false;
			});

			$('#back-to-top').tooltip('show');

		});
	</script>
</body>
</html>