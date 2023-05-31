<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tooplate">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	<style>
	.thumb>img{
		width:350px;
		height:255px;
	}
	.price{
	 	margin : 0px 0px 120px 140px;
	}
	</style>
    <title>함께 가치</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/owl-carousel.css">

    <link rel="stylesheet" href="/finalProject/resources/css/tooplate-artxibition.css">
<!--

Tooplate 2125 ArtXibition

https://www.tooplate.com/view/2125-artxibition

-->
    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->
	<%@include file="../common/menubar.jsp" %>
    <!-- ***** Header Area End ***** -->
	<script>
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
    <!-- ***** About Us Page ***** -->
    <div class="page-heading-shows-events">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>같이 여행 갈 사람을 찾아보자 !</h2>
                    <span>당신의 여행 스타일에 맞춰 같이 여행을 떠날 친구를 찾아보아요!</span>
                </div>
            </div>
        </div>
    </div>

    <div class="tickets-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="search-box">
                        <form id="subscribe" action="" method="get">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="search-heading">
                                        <h4>원하는 조건을 입력 해보세요 : </h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <select value="month">
                                                <option value="month">월</option>
                                                <option name="June" id="June">June</option>
                                                <option name="July" id="July">July</option>
                                                <option name="August" id="August">August</option>
                                                <option name="September" id="September">September</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <select value="location">
                                                <option value="location">지역</option>
                                                <option name="Brazil" id="Brazil">Brazil</option>
                                                <option name="Europe" id="Europe">Europe</option>
                                                <option name="US" id="US">US</option>
                                                <option name="Asia" id="Asia">Asia</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <select value="month">
                                                <option value="month">경비</option>
                                                <option name="min" id="min">$0 - $50</option>
                                                <option name="standard" id="standard">$50 - $100</option>
                                                <option name="hight" id="hight">$100 - $200</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <fieldset>
                                            <button type="submit" id="form-submit" class="main-dark-button">검색 !</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="heading">
                        <h2>당신을 기다리는 사람들</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
<!--                             <img src="/finalProject/resources/images/ticket-01.jpg" alt=""> -->
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMjVfMTk4%2FMDAxNjc3Mjk1MzM0Mjg2.4g-sSUBKDNcayJnnmB3qWmL2p9PBPhgdMm_kt9yOfrgg.cG7DhCRsaUznj729jA2Qs1EMWi-aQsYUEt-j-ao5I5Ug.JPEG.hamso99%2F1677295333608.jpg&type=a340" alt="">
                            <div class="price">
                                <span>2박 3일<br>경주<em>테마 여행</em></span>
                            </div>
                        </div>
                        <div class="down-content">
<!--                             <span></span> -->
                            <h4>&lt;2박 3일 경주 테마여행&gt; <br> 동행 2분 모십니다!</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i>2023/05/25 ~ 2023/05/27</li>
                                <li><i class="fa fa-map-marker"></i>경상북도 경주시</li>
                            </ul>
                            <div class="main-dark-button">
                                <a href="ticket-details.html">참여하기 1/2</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
<!--                             <img src="/finalProject/resources/images/ticket-02.jpg" alt=""> -->
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MjRfMjY2%2FMDAxNjgyMjYzNTQ5MDA1.CeCrIUCEuS7m98fvn9IxcVSpzBEv_qYjZTHLRjLwZK0g.SqfDwsp5gzFbSenip01VPBp7wYV3_ptAGMThaml0P2Qg.JPEG.buildream_%2FIMG_9331.jpg&type=a340" alt="">
                            <div class="price">
                                <span>4박 5일<br>부산<em>자유 여행</em></span>
                            </div>
                        </div>
                        <div class="down-content">
<!--                             <span>There Are 200 Tickets Left For This Show</span> -->
                            <h4>&lt;4박 5일 부산 자유 여행&gt; <br> 동행 4분~ 같이 가실분~</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i>2023/06/01 ~ 2023/06/05</li>
                                <li><i class="fa fa-map-marker"></i>부산 광역시</li>
                            </ul>
                            <div class="main-dark-button">
                                <a href="ticket-details.html">참여하기 1/4</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
                            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMjFfMTEz%2FMDAxNjc2OTg1NzUxNDg3.UOYixAX0Hnybah6wyQzyJqQNSMbwqvb7H7RsPG5Bv4Ig.DsbJw6fRvmV-1xvXpM4vMmdxIFdhHKeNd1735C24AuYg.JPEG.wlsydcjstk%2FIMG_0884.jpg&type=a340" alt="">
                            <div class="price">
                                <span>1박 2일<br>여수<em>밤바다</em></span>
                            </div>
                        </div>
                        <div class="down-content">
<!--                             <span>There Are 260 Tickets Left For This Show</span> -->
                            <h4>&lt;여수 밤바다&gt;<br>동행 1분~</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i>2023/05/22 ~ 2023/05/23</li>
                                <li><i class="fa fa-map-marker"></i>전라남도 여수시</li>
                            </ul>
                            <div class="main-dark-button">
                                <a href="ticket-details.html" disabled style="background-color:lightgray;">마감 되었습니다.</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
                            <img src="/finalProject/resources/images/ticket-04.jpg" alt="">
                            <div class="price">
                                <span>1 ticket<br>from <em>$20</em></span>
                            </div>
                        </div>
                        <div class="down-content">
                            <span>There Are 340 Tickets Left For This Show</span>
                            <h4>Tiger Festival</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i> Thursday: 06:40 PM to 11:40 PM</li>
                                <li><i class="fa fa-map-marker"></i>123 Copacabana Beach, Rio de Janeiro</li>
                            </ul>
                            <div class="main-dark-button">
                                <a href="ticket-details.html">Purchase Tickets</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
                            <img src="/finalProject/resources/images/ticket-05.jpg" alt="">
                            <div class="price">
                                <span>1 ticket<br>from <em>$30</em></span>
                            </div>
                        </div>
                        <div class="down-content">
                            <span>There Are 420 Tickets Left For This Show</span>
                            <h4>Woodland Festival</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i> Wednesday: 06:00 PM to 09:00 PM</li>
                                <li><i class="fa fa-map-marker"></i>1122 Copacabana Beach, Rio de Janeiro</li>
                            </ul>
                            <div class="main-dark-button">
                                <a href="ticket-details.html">Purchase Tickets</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
                            <img src="/finalProject/resources/images/ticket-06.jpg" alt="">
                            <div class="price">
                                <span>1 ticket<br>from <em>$40</em></span>
                            </div>
                        </div>
                        <div class="down-content">
                            <span>There Are 520 Tickets Left For This Show</span>
                            <h4>Winter Festival</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i> Saturday: 06:00 PM to 09:00 PM</li>
                                <li><i class="fa fa-map-marker"></i>220 Copacabana Beach, Rio de Janeiro</li>
                            </ul>
                            <div class="main-dark-button">
                                <a href="ticket-details.html">Purchase Tickets</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="pagination">
                        <ul>
                            <li><a href="#">Prev</a></li>
                            <li><a href="#">1</a></li>
                            <li class="active"><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- *** Subscribe *** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <h4>Subscribe Our Newsletter:</h4>
                </div>
                <div class="col-lg-8">
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                          <div class="col-lg-9">
                            <fieldset>
                              <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-3">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- *** Footer *** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="address">
                        <h4>Sunny Hill Festival Address</h4>
                        <span>5 College St NW, <br>Norcross, GA 30071<br>United States</span>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Info</a></li>
                            <li><a href="#">Venues</a></li>
                            <li><a href="#">Guides</a></li>
                            <li><a href="#">Videos</a></li>
                            <li><a href="#">Outreach</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="hours">
                        <h4>Open Hours</h4>
                        <ul>
                            <li>Mon to Fri: 10:00 AM to 8:00 PM</li>
                            <li>Sat - Sun: 11:00 AM to 4:00 PM</li>
                            <li>Holidays: Closed</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <div class="row">
                            <div class="col-lg-6">
                                <p>São Conrado, Rio de Janeiro</p>
                            </div>
                            <div class="col-lg-6">
                                <p class="copyright">Copyright 2021 ArtXibition Company 
                    
                    			<br>Design: <a rel="nofollow" href="https://www.tooplate.com" target="_parent">Tooplate</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="sub-footer">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="logo"><span>Art<em>Xibition</em></span></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="menu">
                                    <ul>
                                        <li><a href="index.html" class="active">Home</a></li>
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="rent-venue.html">Rent Venue</a></li>
                                        <li><a href="shows-events.html">Shows & Events</a></li> 
                                        <li><a href="tickets.html">Tickets</a></li> 
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="social-links">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="/finalProject/resources/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="/finalProject/resources/js/popper.js"></script>
    <script src="/finalProject/resources/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/finalProject/resources/js/scrollreveal.min.js"></script>
    <script src="/finalProject/resources/js/waypoints.min.js"></script>
    <script src="/finalProject/resources/js/jquery.counterup.min.js"></script>
    <script src="/finalProject/resources/js/imgfix.min.js"></script> 
    <script src="/finalProject/resources/js/mixitup.js"></script> 
    <script src="/finalProject/resources/js/accordions.js"></script>
    <script src="/finalProject/resources/js/owl-carousel.js"></script>
    
    <!-- Global Init -->
    <script src="/finalProject/resources/js/custom.js"></script>

  </body>
</html>