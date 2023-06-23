<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>

	.shows-events-tab {
              background-color: #f0f0f1;  
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
            border: 1px solid;
            width: 25%;
            height: 40%;
            float: left;
            margin-left: 70px; 
            margin-top: 30px;
            margin-bottom: 20px;   
            cursor: pointer;         
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
	    /* letter-spacing: -1px; */
	    color: white;
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
	    transform: translateY(130px) translateX(200px);
	    
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
            	<div class="bg" style="background-color: purple;">
	                <div class="cont">
	                    <h2>다채로운    추천 테마    여행!</h2>
	                    <span>Check out upcoming and past shows & events and grab your ticket right now.</span>
	                </div>
	                
				   <div class="theme-area" align="center">
				   		 <div>
			                <img src="resources/css/img/cat.jpg" alt="">
			            </div>
			            <div>
			                <img src="" alt="">
			            </div>
			            <div onclick="list();">
			                <img src="" alt="">
			            </div>
			            <div>
			                <img src="" alt="">
			            </div>
			            <div>
			                <img src="" alt="">
			            </div>
			            <div>
			                <img src="" alt="">
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