<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>The Contest Helper</title>

     <!-- CSS -->
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!--  -->
        <link href="resources/css/Modal.css" rel="stylesheet">
        <link href="resources/css/owl.carousel.css" rel="stylesheet">
        <link href="resources/css/owl.theme.css" rel="stylesheet">
        <link href="resources/css/flexslider.css" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">

        <link href="css/style.css" type="text/css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
<%@include file="top.jsp"%>

       

        <!-- bootstrap carousel -->

			<div id="carousel-header" class="carousel slide" data-ride="carousel" data-interval="5000">
  			<!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#carousel-header" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-header" data-slide-to="1"></li>
                  <li data-target="#carousel-header" data-slide-to="2"></li>
                </ol>

  				<!-- Wrapper for slides -->
  				<div class="carousel-inner" role="listbox">
    				<div class="item active">
                    	<img src="resources/img/slider/slide4.jpg" alt="...">
      					<div class="carousel-caption"> <span class="second-head">Advanced</span> healthcare made personal.
                        </div>
    				</div>
                    <div class="item">
                        <img src="resources/img/slider/slide5.png" alt="...">
                        <div class="carousel-caption"> <span class="second-head">Exceptional</span> technology. Extraordinary care!
                        </div>
                    </div>
                    <div class="item">
                    	<img src="resources/img/slider/slide6.jpg" alt="...">
                        <div class="carousel-caption"> <span class="second-head">Medicine</span> that touches the world!
                        </div>
                    </div>
  				</div>

            <!-- Controls -->

                <a class="left carousel-control" href="#carousel-header" role="button" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-header" role="button" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>


			</div>
			<!-- end bootstrap carousel -->

        <div class="divide70"></div>
        <div class="container">
            <div class="row center-title">
                <div class="col-md-8 col-md-offset-2 clearfix text-center wow animated fadeInUp">
                    <h2>The Contest Helper</h2>
                    <p>
                        팀프로젝트에 특화된 팀결성 및 온라인 회의 , 간편한 공모전 개최 및 다양한 방법의 실시간 온라인 평가 시스템
                        <h2>이 모든 걸 The Contest Helper에서 만나보세요</h2>
                    </p>
                    <!--                   -->
                </div>
            </div>
            <br><br>
        </div>
        <div class="divide60"></div>

        <div class="team-section">
            <div class="container">  
                <div class="row">
       				<c:forEach items="${list}" var="contest">   
	                   <div class="col-sm-6 col-sm-3 margin30">
	                       <div class="team-col wow animated fadeInLeft" data-wow-delay="0.4s">
								<a href="contestRead?c_id=${contest.c_id }&t_id=0">
									<img src="displayFile?fileName=${contest.c_poster }" alt='공개된 포스터가 없습니다.' class="img-responsive"  style="height:270px; width:200px">
	                       		</a>       
	                           <p style="height:25px; margin-top:20px;">
	                           		<strong><a href="contestRead?c_id=${contest.c_id }&t_id=0" class="title">${contest.c_name }</a></strong>
	                           </p>
	                           <p style="margin-bottom:50px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_startdate}"/>
									&nbsp;~&nbsp;
									<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_enddate}"/>
								</p>
	                       </div><!--team col-->   
	                   </div><!--col-md-3 col-sm-6-->
                    </c:forEach>
                </div>
            </div>
        </div><!--team section end-->


     
        <!--know more section end-->


       
        <!--testimonials end-->

       

        <!-- <section class="blog-home">
            <div class="container">
                <div class="center-title">
                    <i class="glyphicon glyphicon-qrcode"></i>
                    <h2>Special<strong> Services</strong></h2>
                </div>
                <div class="row">
                    <div class="col-md-4 margin30">
                        <div class="blog-post">
                            <img src="resources/img/medical/home-services-1.jpg" alt="" class="img-responsive">
                            <h3>
                                <a href="#"> lorem ipsum dolor sit amet</a>
                            </h3>
                            <span>July 12, 2015 Dr. Lorem</span>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id bibendum massa, vulputate consectetur dui. Ut ut eros congue, condimentum massa
                            </p>
                            <p><a href="#">Read more...</a></p>
                        </div>
                    </div>
                    <div class="col-md-4 margin30">
                        <div class="blog-post">
                            <img src="resources/img/medical/home-services-2.jpg" alt="" class="img-responsive">
                            <h3>
                                <a href="#"> Lorem ipsum dolor sit amet</a>
                            </h3>
                            <span>June 11, 2015 Dr. Ipsum</span>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id bibendum massa, vulputate consectetur dui. Ut ut eros congue, condimentum massa
                            </p>
                            <p><a href="#">Read more...</a></p>
                        </div>
                    </div>
                    <div class="col-md-4 margin30">
                        <div class="blog-post">
                            <img src="resources/img/medical/home-services-3.jpg" alt="" class="img-responsive">
                            <h3>
                                <a href="#"> Lorem ipsum dolor sit amet</a>
                            </h3>
                            <span>January 1, 2015 Dr. Lorem</span>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id bibendum massa, vulputate consectetur dui. Ut ut eros congue, condimentum massa
                            </p>
                            <p><a href="#">Read more...</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="ads-section-newsletter">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text-center">
                       <br><br><br>
                        <form class="form-inline">
                            <div class="form-group">
                                <input type="text" name="email" class="form-control" id="email" placeholder="Your email">
                            </div>
                            <button type="submit" name="submit" class="btn btn-theme-bg btn-lg">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
-->
<br><br><br>
        <footer class="footer">
        	 <div class="divide40"></div>
        	 
        </footer>

        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/js/jquery-migrate.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.stellar.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
        <script src="resources/js/wow.min.js" type="text/javascript"></script>
        <script src="resources/js/custom.js" type="text/javascript"></script>

    </body>
</html>
