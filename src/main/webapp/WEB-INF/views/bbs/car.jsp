<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="shortcut icon" type="image/x-icon" href="resources/images/w_r.JPG" />


    <title>weiver</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	

    <!-- Custom CSS -->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- 글씨 크기 조정 -->
<style type="text/css">
	@media (max-width: 479px){
	.text-resp{
	font-size: 15px}
	}
	@media(min-width: 480px){
	.text-resp{
	font-size:20px}
	}
	
div{
	clear: both;
}
</style>


<!-- 게시판 검색 기능 -->
<script type="text/javascript">
$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
});
</script>

<script>
function moveWrite() {
	document.location.href="writeForm.bbs";
}
</script>

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

    <div id="wrapper">

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
        
        
  
        
        

<div class="container page-wrapper">
	<div class="row">
		<section class="content">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
					
					
					
<!-- 						검색기능 -->
							<form action="/proj/car.bbs?pageNum=1" method="get">
								<div class="input-group">
									<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
									<input class="form-control" id="target" name="target"
										placeholder="Search for" required> <span
										class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</span>
								</div>
							</form>
							
							<div class="hidden-xs">
								<ul style="height:auto;">
									<li class="col-xs-5" style="list-style : none; float:left; max-width:250px;" >title</li>
									<li class="col-xs-2" style="list-style : none; float:left;" >id</li>
									<li class="col-xs-2" style="list-style : none; float:left;" >조회수</li>
									<li class="col-xs-2" style="list-style : none; float:left;" >날짜</li>
								</ul>								
								<br/>
								<hr>
								<c:forEach var="article" items="${articleList}"> 
									<ul style="height:auto;">
									
										
										<li class="col-xs-5" style="list-style : none; float:left;  max-width:250px; max-height:20px; overflow:hidden" >
										<a href="/proj/read_car.bbs?weiver_no=${article.weiver_no}&pageNum=${pageNum}&fileStatus=${article.weiver_file}">
										${article.weiver_title}
										</a>
										</li>
										
										<li class="col-xs-2" style="list-style : none; float:left;" >${article.weiver_id}</li>
										<li class="col-xs-2" style="list-style : none; float:left;" >${article.weiver_hit}</li>
										<li class="col-xs-2" style="list-style : none; float:left;" >${article.weiver_writedate}</li>
									</ul>
									<br/>
									<hr>
								</c:forEach>
								<div>
									<button class="btn btn-sm btn-primary" type="button" onclick="moveWrite()">글쓰기</button>
								</div>
								<div>
									${pageCode}
								</div>
							</div>
							
							
							
							
							
							
							<div class="table-container hidden-md hidden-lg hidden-sm">
							<table class="table table-filter">
								<tbody>
									<c:forEach var="article" items="${articleList}"> 
									<tr>
										
										<td>
											<div class="media">
<!-- 												<a href="#" class="pull-left"> -->
<!-- 													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo"> -->
<!-- 												</a> -->
												<div class="media-body">
<!-- 													<span class="media-meta pull-right">Febrero 13, 2016</span> -->
													<h4 class="title text-resp">
														
														<a href="/proj/read_car.bbs?weiver_no=${article.weiver_no}&pageNum=${pageNum}&fileStatus=${article.weiver_file}"><c:out value="${article.weiver_title}" /></a>
													</h4>
													<div>${article.weiver_id}&nbsp;|&nbsp;조회 : ${article.weiver_hit}&nbsp;|&nbsp;${article.weiver_writedate}</div>
												
												</div>
											</div>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td>
										<button class="btn btn-sm btn-primary" type="button" onclick="moveWrite()">글쓰기</button>
										</td>
									</tr>
									<tr>
										<td>
											${pageCode}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
			</div>
		</section>
		
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

    <!-- jQuery -->
    <script src="resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>


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