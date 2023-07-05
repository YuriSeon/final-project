<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>

	.shows-events-tab {
              background-color: rgba(86, 86, 245, 0.087);  
              height: 1200px;
        }
        .theme-area{
            background-color: rgb(249, 222, 242); 
            margin: auto;
            position: relative;
            border: 4px solid white;
            width: 1200px;
            height: 700px;
            transform: translateY(25%);
            padding: 10px 20px;
     		border-radius: 20px;
        }
        .theme-area>div{
            /* border: 1px solid; */
            width: 25%;
            height: 40%;
            float: left;
            margin-left: 70px; 
            margin-top: 30px;
            margin-bottom: 20px;   
            cursor: pointer;  
            border-radius: 20px;       
        }
        .theme-area img{
            width:100%;
            height:100%;
            background-size: contain;
        }
		.special_box .bg {
	     height: 415px; 
	}
	
		.special_box h2 {
	    font-weight: 800;
	    color: white;
	    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
	}
	.special_box spen {
	    padding: 10px 0 0;
 	    font-size: 16px;
	}
	.special_box {
	    position: relative;
	    color: #333;
	    margin: 0 0 80px;
	}
	
	    .special_box .cont {
	    transform: translateY(160px) translateX(290px);
	    
	}
	.theme-area>div:hover img {
    	filter: brightness(0.8); /* 흐려지는 정도를 조절할 수 있습니다. */
	}
	#ani::after {
    content: "#평생 친구와 함께";
    position: absolute;
    top: 40%;
    right: 3%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	 
	#ani:hover::after,#star:hover::after,#ko:hover::after,#hea:hover::after,#ping:hover::after,#art:hover::after {
    opacity: 1;
}
	#star::after{
	content: "#별보러 가지 않을래?";
    position: absolute;
    top: 40%;
    left: 20%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#ko::after{
	content: "#전통 한옥";
    position: absolute;
    top: 40%;
    right: 40%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#hea::after{
	content: "#힐링";
    position: absolute;
    bottom: 10%;
    left: 19%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#ping::after{
	content: "#캠핑";
    position: absolute;
    bottom: 10%;
    right: 44%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#art::after{
	content: "#전시회";
    position: absolute;
    bottom: 10%;
    right: 12%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	
</style>

  <head>

    <title>테마</title>

    </head>
    
    <body>
    
   
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
	
	<!-- <div class="theme">
        <div class="theme-container">
           
        </div>
    </div> -->
   
   <div class="shows-events-tab">
   		 <div class="special_box">
            	<div class="bg" style="background-image: url('resources/images/자연.jpg');background-size: cover;">
	                <div class="cont">
	                    <h2>다채로운    추천 테마    여행!</h2>	                   
	                </div>
	                
				   <div class="theme-area" align="center">
				   		 <div id="star">
			                <img src="resources/images/밤하늘에별.jpg" alt="" style="border-radius: 20px;">
			            </div>
			            <div id="ko">
			                <img src="resources/images/한옥.jpg" alt="" style="border-radius: 20px;">
			            </div>
			            <div onclick="list();" id="ani">
			                <img src="resources/images/car-dog.jpg" alt="" style="border-radius: 20px;">
			            </div>
			            <div id="hea">
			                <img src="resources/images/힐링.jpg" alt="" style="border-radius: 20px;">
			            </div>
			            <div id="ping">
			                <img src="resources/images/캠핑.jpg" alt="" style="border-radius: 20px;"> 
			            </div>
			            <div id="art">
			                <img src="resources/images/전시회.jpg" alt="" style="border-radius: 20px;">
			            </div>
				   </div>
            	</div>
            </div>
   </div>
   

		<jsp:include page="../common/footer.jsp"></jsp:include>
		
		
		<script>
			function list(){
				location.href = "themaList.bo";
			}
		</script>
  </body>
</html>