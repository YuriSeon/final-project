<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Tooplate">
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	
	<title>메뉴바</title>
    
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="resources/css/owl-carousel.css">

    <link rel="stylesheet" href="resources/css/tooplate-artxibition.css">
</head>
<body>
    <!-- jQuery -->
    <script src="resources/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="resources/js/popper.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="resources/js/scrollreveal.min.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/jquery.counterup.min.js"></script>
    <script src="resources/js/imgfix.min.js"></script> 
    <script src="resources/js/mixitup.js"></script> 
    <script src="resources/js/accordions.js"></script>
    <script src="resources/js/owl-carousel.js"></script>
    <!-- Global Init -->
    <script src="resources/js/custom.js"></script>


   <div class="pre-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <span>로그인을 하시면 선호 목록에 따라 메인 페이지가 바뀌어요!</span>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="text-button">
                        <a href="rent-venue.html">로그인 / 회원가입<i class="fa fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="main.bo" class="logo">여행<em>가보자고</em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li><a href="main.bo">메인</a></li>
                            <li><a href="theme.bo">테마</a></li>
                            <li><a href="festival.bo">축제</a></li>
                            <li><a href="attraction.bo">명소</a></li> 
                            <li><a href="feed.bo">피드</a></li> 
                            <li><a href="schedule.bo">일정 자랑</a></li> 
                            <li><a href="together.bo">함께 가치</a></li> 
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>