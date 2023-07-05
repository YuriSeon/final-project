<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu button{
		font-size : 14px;
		background-color: white;
      	border: none;
	}
	.menu button:hover{
		color:#656c74;
	}
	.menu button:focus{
		outline: none;
	}
	
	.terms-header{
		background-color:#d1d1d1;
		height:70px;
		font-size: 15px;
		font-weight: 600;
		color: white;
      	line-height: 70px;
      	text-align: center;
	}
	#terms-body_1{
      text-align: center;
      padding: 20px 10px 10px 10px;
      font-size: 13px;
    }
    #footerBanner>img,#footerBanner>div{
    	float:left;
    }
</style>
</head>
<body>
    <footer>
    <hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sub-footer" style="border-top: 0; margin-top: 0; padding-top: 0;">
                        <div class="row" style="position:relative; left:130px;">
                            <div class="col-lg-3" id="footerBanner">
                                <img src="/finalProject/resources/images/koreaMap.jpeg" id="bannerImg" style="width:96px; height:80px; margin-bottom:20px; position:relative;"><div class="logo" style="margin-top:10px;"><span>여행<em>가보자고</em></span></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="menu">
                                    <ul>
                                        <li><a href="main.bo" class="active">Home</a></li>
                                        <li><button type="button" >이용약관</button></li>
                                        <li><button>개인정보취급방침</button></li>
                                        <li><button>광고문의</button></li>
                                        <li><button onclick="location.href='service.se'">고객센터</button></li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>