<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<style>
      /* .wrap>*{
            width: 1110px;
            background-color: antiquewhite;
            margin: auto;
          }
          #detail-menubar{
            height: 30px;
            width: 1110px;
            background-color: aqua;
          }*/
          
		#title_menu{
			font-size: 28px;
			position: relative;
			top: -15px;
			left: 400px;
		}
		#title_menu>a{
			font-size: 18px;
            text-decoration: none;
            color: rgb(138, 138, 138);
            font-weight: 600;
		}
		#title_menu>a:hover{
			color:black;
		}
		#topTitle{
			font-size: 30px;
          	font-weight: 600;
          	height: 60px;
          	line-height: 40px;
		}
		.titleType1 {
			text-align: center;
            position: relative;
			/* background-color : green; */
		}
		.titleType1 .area_tag {
            text-align: left;
        }
        .brandingIcon {
            float: right;
            text-align: center;
        }
        .btn_good{
            border: none;
            background-color: white;
            position: relative;
            left: -470px;
        }
        .num_view{
        	position: relative;
            left: -470px;
        }
        .btn_sharing{
        	position: relative;
            left: 450px;
            background-color:green;
            border-radius: 20px;
            border:50px;
            border-color:black;
            border-width: medium;
        }
      </style>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tooplate">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>축제</title>

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
    <!-- ***** Preloader End ***** -->
    <%@include file="../common/menubar.jsp" %>
    
  	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
	
	<div id="wrap">
	
		<div id="title_menu">
			<a href=""><img src="resources/images/home.png" alt="" style="width:23px; height:23px; position: relative; top: -7px;"></a> > <a href="" style="position: relative; top: -3px; left: -3px;">축제</a>
		</div>
        
        <div class="titleType1">
			<h2 id="topTitle">죽미령 평화공원</h2>
            <div class="area_address" id="topAddr" style="color: rgb(135, 135, 135); position: relative; top: -18px;">경기 오산시</div>
    
			<div class="post_area">
		        	<button type="button" class="btn_good" onclick="setLike();">
		            	<span class="ico"><img src="resources/images/heart.png" alt="" style="height: 21px; width: 21px;"></span>
		           		<span class="num" id="conLike">8</span>
		        	</button>
		        <span class="num_view"><img src="resources/images/eye.png" alt="" style="height: 24px; width: 24px;">&nbsp;243</span>
		        <span class="rline">
		            <button type="button" class="btn_sharing" onclick="openShare();">
		                	수정요청
		            </button>
		        </span>
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
                                        <h4>Sort The Upcoming Shows & Events By:</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <select value="month">
                                                <option value="month">Month</option>
                                                <option name="June" id="June">June</option>
                                                <option name="July" id="July">July</option>
                                                <option name="August" id="August">August</option>
                                                <option name="September" id="September">September</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <select value="location">
                                                <option value="location">Location</option>
                                                <option name="Brazil" id="Brazil">Brazil</option>
                                                <option name="Europe" id="Europe">Europe</option>
                                                <option name="US" id="US">US</option>
                                                <option name="Asia" id="Asia">Asia</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <select value="month">
                                                <option value="month">Price</option>
                                                <option name="min" id="min">$0 - $50</option>
                                                <option name="standard" id="standard">$50 - $100</option>
                                                <option name="hight" id="hight">$100 - $200</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <fieldset>
                                            <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
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
                        <h2>Tickets Page</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ticket-item">
                        <div class="thumb">
                            <img src="/finalProject/resources/images/ticket-01.jpg" alt="">
                            <div class="price">
                                <span>1 ticket<br>from <em>$25</em></span>
                            </div>
                        </div>
                        <div class="down-content">
                            <span>There Are 150 Tickets Left For This Show</span>
                            <h4>Wonderful Festival</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i> Thursday: 05:00 PM to 10:00 PM</li>
                                <li><i class="fa fa-map-marker"></i>908 Copacabana Beach, Rio de Janeiro</li>
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
                            <img src="/finalProject/resources/images/ticket-02.jpg" alt="">
                            <div class="price">
                                <span>1 ticket<br>from <em>$45</em></span>
                            </div>
                        </div>
                        <div class="down-content">
                            <span>There Are 200 Tickets Left For This Show</span>
                            <h4>Golden Festival</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i> Sunday: 06:00 PM to 09:00 PM</li>
                                <li><i class="fa fa-map-marker"></i>789 Copacabana Beach, Rio de Janeiro</li>
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
                            <img src="/finalProject/resources/images/ticket-03.jpg" alt="">
                            <div class="price">
                                <span>1 ticket<br>from <em>$65</em></span>
                            </div>
                        </div>
                        <div class="down-content">
                            <span>There Are 260 Tickets Left For This Show</span>
                            <h4>Water Splash Festival</h4>
                            <ul>
                                <li><i class="fa fa-clock-o"></i> Tuesday: 07:00 PM to 11:00 PM</li>
                                <li><i class="fa fa-map-marker"></i>456 Copacabana Beach, Rio de Janeiro</li>
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