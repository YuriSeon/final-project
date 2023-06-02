<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>여행 설문지</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
</head>
<style>
    div{
        box-sizing: border-box;
    }
    #outer{
        margin: auto;
/*         border:1px solid black; */
        width: 1400px;
    }
    #mbtiBanner{
        width: 800px;
        height: 600px;
        border: 4px solid black;
        border-radius: 25px;
        margin-bottom: 5px;
    }
    #mbtiBanner>div{
        height: 100%;
        float: left;
    }
    #banner_1{
        width:15%;
        background-color: aliceblue;
        border-radius: 20px 0px 0px 20px;
    }
    #banner_3{
        width:15%;
        background-color: aliceblue;
        border-radius: 0px 20px 20px 0px;
    }
    #banner_2{
        width: 70%;
        background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)), url("/finalProject/resources/images/survey-background.jpg");
        background-size: 100% 100%;
    }
    #mbtiStartDiv{
        border: 4px solid black;
        border-radius: 25px;
        width: 800px; 
        height: 100px;
        background-color: lightblue;
        text-align: center;
        font-size: 50px;
        padding-top: 14px;
    }
    #mbtiStartDiv:hover{
        background-color: skyblue;
        cursor: pointer;
    }
    #bannerTitle{
        font-size: 50px;
        margin-top: 20px;
    }
	.answerBtn{
		width:500px;
		height:150px;
		background-color:white;
		margin:10px 0px 10px 0px;
		font-size:30px;
		border-radius:20px;
		border:4px lightblue solid;
	}    
	.answerBtn:hover{
		background-color:skyblue;
		cursor:pointer;
	}
	#resultText{
		font-weight:400;
	}

</style>
<body>
<%@include file="../../common/menubar.jsp" %>
<br><br>
    <div id="outer" align="center">
        <div id="wrap">
            <div id="mbtiBanner">
                <div id="banner_1"></div>
                <div id="banner_2">
                    <div id="bannerTitle"> 님의<br> 여행 스타일은 ?</div>
                    <img src="/finalProject/resources/images/survey-ticket.png" id="startBanner" alt="도착지" style="width: 555px; height:150px; margin-top: 35px;">
                    <img src="" id="resultImg" style='width: 555px; height:250px; margin-top:10px; display:none;'>
                   <div id="resultText" style="display:none;"></div>
                    <button type='button' class='answerBtn' id='btn1' style="display:none;"></button>
                    <button type='button' class='answerBtn' id='btn2' style="display:none;">	 </button>
                </div>
                <div id="banner_3"></div>
            </div>
            <div id="mbtiStartDiv"> 설문지 시작하기 !</div>
            <br><br><br><br>
        </div>
    </div>
    <script>
			var	questionCount = 1;
			
    	 $("#mbtiStartDiv").click(function(){
	    		$("#banner_2 button").css("display","block");
	    		
				$("#banner_2").children("#startBanner").remove();
				$("#mbtiStartDiv").remove();
				
				$("#bannerTitle").html("Q1. 여행의 감성을 느끼기 위해 게스트하우스를 예약했다. 나는?");
				$("#btn1").html("✔ 다른 혼자 온 사람에게 말을 먼저 걸어본다.").attr("value","E");
				$("#btn2").html("✔ 그냥 먼저 인사할 때까지 가만히 있는다.").attr("value","I");
				
    	 });
    	 
    	 var result = "";
    	 
    	 $("#banner_2").on("click","button",function(){
    		 if(questionCount<12){
    			 
    		 result+= $(this).val();
    		 console.log(result);
    		 $("#bannerTitle").html("").css("font-size",50);
    		 $("#btn2").css("height","150px");
    		 
    		 questionCount ++;
    		 console.log(questionCount);
    		 addQuestion(questionCount);
    		 }else{
    			 $("#bannerTitle").html("${loginUser.nickname}님의 결과는 ?");
    			 $("#btn1").remove();
    			 $("#btn2").remove();
    			 console.log("끝");
    			 showResult(result);
    		 }
    	 });
    	 
    	 function addQuestion(questionCount){
    		 console.log(questionCount);
    		 switch(questionCount){
    		 	case 2 : 
    		 		$("#bannerTitle").html("Q2. 게스트하우스 내에서 다들 친해졌다. 모두가 모여서 대화를 하고 있을 때, 나는?");
    		 		$("#btn1").html("✔ 저 사람 말하는 거 끝나면 나는 이 말 해야지~").val("E");
    		 		$("#btn2").html("✔ 들어가기는 아쉽고 말하기는 싫으니 듣고만 있는다.").val("I");
    		 		break;
    		 	case 3 : 
    		 		$("#bannerTitle").html("Q3. 여행을 갈 때 선호하는 것은?");
    		 		$("#btn1").html("✔ 혼자 가는 여행은 외로워! 가족이나 친구들과 함께 가야지.").val("E");
    		 		$("#btn2").html("✔ 난 혼자 가는 여행도 나름 재밌어!").val("I");
    		 		break;
    		 	case 4 : 
    		 		$("#bannerTitle").html("Q4. 여행 가기 전날 나와 비슷한 것은?");
    		 		$("#btn1").html("✔ 숙소 예약 확인 후 설렘과 걱정에 이것저것 생각하다 시간을 보고 서둘러 잠든다.").val("N");
    		 		$("#btn2").html("✔ 숙소 예약 확인 후 내일 여행에 지장이 없게 바로 잠든다.").val("S");
    		 		break;
    		 	case 5 : 
    		 		$("#bannerTitle").html("Q5. 여행 중 가야 할 곳이 있는데 길을 잘못 들었다.");
    		 		$("#btn1").html("✔ 다시 내비가 알려주는 정확한 경로에 들어서야 마음이 편하다.").val("S");
    		 		$("#btn2").html("✔ 이 또한 추억이지 허헣 어? 저기서 사진 찍고 갈까?").val("N");
    		 		break;
    		 	case 6 : 
    		 		$("#bannerTitle").html("Q6. 숙소에 도착했을 때 나는?");
    		 		$("#btn1").html("✔ 와 여기 숙소 너무 이쁘다. 깔끔하고 좋네").val("S");
    		 		$("#btn2").html("✔ 와 여기 숙소 대박이네! 사장님 부자신가? 뭐 하시길래 돈을 이렇게 많이 버셨을까?").val("N");
    		 		break;
    		 	case 7 : 
    		 		$("#bannerTitle").html("Q7. 여행에 다녀온 나는 ?");
    		 		$("#btn1").html("✔ 여행 사진을 보며 엄청난 후유증으로 다음 여행을 기다린다.").val("F");
    		 		$("#btn2").html("✔ 사진 공유+ 정산 후 일상으로 복귀").val("T");
    		 		break;
    		 	case 8 : 
    		 		$("#bannerTitle").html("Q8. 둘 중 더 서운한 것은?");
    		 		$("#btn1").html("✔ 내가 고른 여행지를 만족해하지 않는 것 같을 때.").val("T");
    		 		$("#btn2").html("✔ 기분이 좋아서 같이 간 친구에게 리액션을 했는데 시큰둥할 때.").val("F");
    		 		break;
    		 	case 9 : 
    		 		$("#bannerTitle").html("Q9. 여행지에서 어디갈 지 고르는데 친구가 답변을 잘 안 한다. 그때 원하는 사과 답변은?").css("font-size",40);
    		 		$("#btn1").html("✔ 미안하다. 나 오늘 회사에서 중요한 일을 맡아서... 집중이 안 됐다.. 집에 가서 바로 찾아볼게...진짜 미안해 정말..").val("T");
    		 		$("#btn2").html("ㅜㅜ 나때문에 마음 많이 상했지? 나 오늘 회사에서 일이 있어서 집중을 못 했네... 그래도 넌 열심히 찾아봤는데ㅜ 미안해 퇴근하면 언넝 찾아볼게여ㅜ").val("F").css("height","200px");
    		 		break;
    		 	case 10 : 
    		 		$("#bannerTitle").html("Q10. 여행 계획을 짤 때 나는?");
    		 		$("#btn1").html("✔ 대략 가고 싶은 곳만 정하고 못 가면 그 때 그 상황에 찾아본다.").val("P");
    		 		$("#btn2").html("✔ 시간 단위로 찾아 둬야 나중에 못 가는 곳이 생겨도 마음이 편하다.").val("J");
    		 		break;
    		 	case 11 : 
    		 		$("#bannerTitle").html("Q11. 여행에 다녀왔을 때 나와 비슷한 것은?");
    		 		$("#btn1").html("✔ 몸이 힘들어도 오자마자 바로 짐 정리를 하고 쉰다.").val("J");
    		 		$("#btn2").html("✔ 일단 내 몸이 힘든 게 우선이다. 좀만 누워있자! ").val("P");
    		 		break;
    		 	case 12 : 
    		 		$("#bannerTitle").html("Q12. 여행 후 나의 사진 앨범은?");
    		 		$("#btn1").html("✔ 무엇이 베스트 컷인지 마음에 드는 것은 하트를 누르고 아니면 삭제한다.").val("J");
    		 		$("#btn2").html("✔ 일단 나중에 시간여유가 생기면 해야지 하면서 미뤄두다가 까먹는다.").val("P");
    		 		break;
    		 }
    	 };
    	 
    	 function showResult(result){
    		 
    		 $.ajax({
    			 url : "surveyResult.me",
    			 data : {result : result},
    			 success : function(mbti){
    				 var str = "";
    				 
    				 switch(mbti){
	    				 case "ENFJ" : 
	        				 str += " ✔ 계획을 중시하지만, 친구들과의 여행에서 친구들이 어떻게 여행하느냐에 따라 달라져요.<br>"
	    						 +"✔ 혼자 가는 여행보다 내가 좋아하는 사람들과 다 같이 여행하는 걸 제일 좋아해요.<br>"
	    						 +" ✔ 여행지에 도착했을 때 내가 좋아하는 숙소/분위기/그리고 같이 온 사람과 함께 했다는 사실에 혼자 감동하곤 해요.<br>"
	    						 +"✔ 평소 배려심이 깊어 여행지를 고를 때도 친구들이 가고 싶은 여행지로 가려고 합니다.<br>"
	    						 +" ✔ 내 나름대로 열심히 찾은 장소를 얘기했을 때 반응 없으면 나 홀로 토라져 있어요.<br>"
	    						 +" ✔ 낯선 여행지에 가서도 말이 통하지 않는 현지 분들과 친하게 지내며 모두의 텐션을 업 시켜줍니다.<br>"
	    						 +"✔ 좋아하는 게 너무 많고 감수성이 풍부하며 다니는 곳마다 감동하고 분위기에 취합니다.";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ENFJ.png"); break;
	    				 case "ENFP" :
	    					 str += " ✔ 무계획 여행이 진정한 여행의 재미! 예상치 못한 여행이 추억에 더 오래 남아요!<br>"
	    						 +"✔ 여행에 대부분 계획을 세우지 않고 출발하며 대략적인 목적지만 파악해서 출발해요. <br>"
	    						 +"✔ 가끔 계획러들과 있으면 준비할 땐 귀찮아서 미뤄두지만, 또 반드시 챙길 건 챙기거나 맛집을 찾아봐요. <br>"
	    						 +"✔ 여유로운 일정을 느끼며 자유를 만끽하고 즐길 수 있는 여유로운 일정의 여행이 좋아요. <br>"
	    						 +"✔ 감정 기복이 커 액티비티와 같은 신나는 여행을 즐기다가 급 다운되어 휴식 시간이 필요할 때가 있어요. <br>"
	    						 +"✔ 가는 곳마다 SNS용 사진 스팟을 잘 찾으며, 여행지에서 처음 보는 사람들과도 금방 친해져요. <br>"
	    						 +"✔ 남들이 가는 곳이 아닌 새로운 장소나 새로운 코스에 도전하는 스타일이에요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ENFP.png"); break;
	    				 case "ENTJ"  :
	    					 str += " ✔ 다 같이 가는 여행을 위해 상세 날짜나 장소를 투표로 정하고 그 결정 사항에 대한 이의는 없어요. <br>"
	    						 +"✔ 여행에서 가장 중요한 건 경비, 모든 경비는 빠르게 입금하려고 합니다. <br>"
	    						 +"✔ 여행 시 쓸데없는 감정 낭비는 하지 않고 여행에서도 효율적인 모두가 만족할만한 여행 계획을 세우려고 노력합니다. <br>"
	    						 +"✔ 여행 계획 시간 별로 계획표를 만들고 여행 정산할 때도 깔끔하고 모두가 보기 좋게 정리해서 보내요. <br>"
	    						 +"✔ 늘 여행을 갈 때 나도 모르게 총무 역할을 하거나 리더가 되어있어요. <br>"
	    						 +"✔ 에너지 넘치는 모험가 스타일로 험하고 힘든 여행을 해도 어려운 여행을 완수했다는 성취감을 느껴요. <br>";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ENTJ.png"); break;
	    				 case "ISTP"  :
	    					 str += " ✔ 평소에는 내성적이지만 여행할 땐 대담한 모습을 보여줘요. <br>"
	    						 +"✔ 원래 성격도 느긋해서 여행에서 필요한 것만 최대한 나중에 예약하고 바로 떠나버려요. <br>"
	    						 +"✔ 여행할 떄 어떤 상황이 와도 '어떻게든 되겠지~' 하며 무난하게 해결하고 넘어가요. <br>"
	    						 +"✔ 하지만 여행이라도 피곤한 건 싫어서 줄이 긴 맛집이나 핫한 장소는 피하려고 해요. <br>"
	    						 +"✔ 취미 생활과 힐링, 나만을 위한 여행을 준비하며 꽂힌 것에는 돈이 아깝지 않아 가끔 여행지에서 플렉스 해버려요. <br>"
	    						 +"✔ 남들이 다 하는 여행에 만족감을 느끼기보다 나만의 여행 속 즐거움이 따로 있어요. <br>"
	    						 +"✔ 여행을 좋아하긴 하지만 집에서 조용히 혼자만의 시간을 보내는 것을 더 좋아해요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ISTP.png"); break;
	    				 case "ENTP"  :
	    					 str += " ✔ 늘 똑같은 반복적인 인생의 지루함을 느껴 즉흥적으로 여행 약속을 잡는 경우가 많아요. <br>"
	    						 +"✔ 계획 없이 무작정 떠나는 여행이라 기다림이 많고 순간 화나는 경우도 많지만, 이 또한 추억이라 웃어 넘기는 경우가 많아요.<br>"
	    						 +"✔ 즉흥 여행러이긴 하지만 돈이 많이 나가는 비행기나 내가 잘 숙소는 반드시 잡고 떠나요. <br>"
	    						 +"✔ 위기 상황이나 예상치 못한 상황에서 잘 판단하며 웃으며 넘어가요. <br>"
	    						 +"✔ 감성적인 여행을 좋아하고 숙소는 깔끔한게 좋아요. <br>"
	    						 +"✔ 내가 그곳에 꼭 가야 하는 이유가 있어요. <br>"
	    						 +"✔ 친구들과 여행 계획을 짤 때 정말 아니라고 생각하는 곳은 어떻게든 가지 않으려고 해요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ENTP.png"); break;
	    				 case "ESFJ"  :
	    					 str += " ✔ 혹시나 내가 그 장소에 갔는데 그 식당이 맛없을까봐 or 숙소에 자리가 없을까봐 즉흥 여행은 상상할수도 없어요. <br>"
	    						 +"✔ 계획이 없는 것보다 넘쳐나는 계획적인 여행은 선택지가 많아 후회하지 않아요. <br>"
	    						 +"✔ 감성적인 것을 중요하게 생각하기 때문에 식당/카페/숙소 분위기를 잘 보고 선택해요. <br>"
	    						 +"✔ 내가 좋아하고 계획한 여행에서 인생샷을 건지고 싶어해 인생샷 스팟을 잘 찾아요. <br>"
	    						 +"✔ 같이 가는 친구들을 세심하게 챙겨주고 배려해주며 여행을 즐겨요. <br>"
	    						 +"✔ 여행 내내 웃음이 사라지지 않고 친구들에게 적극적인 리액션과 호응을 하여 분위기 메이커를 담당해요. <br>"
	    						 +"✔ 친구들이 다 가고 싶은 여행지로 여헁을 계획하기 때문에 단톡방에 투표를 자주 올려요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ESFJ.png"); break;
	    				 case "ESFP"  :
	    					 str += " ✔ 여행을 떠날 떄 친구와 카톡 하다 갈까? 가볼까? 하며 즉흥으로 여행 약속을 잡는 경우가 많아요. <br>"
	    						 +"✔ 만약 다 같이 여행 계획을 잡을 때 내가 못 가는 날짜를 말하면 제일 속상해해요. <br>"
	    						 +"✔ 여행을 가서도 넘치는 에너지로 숙소에 내내 있기보다 돌아다닐 수 있는 곳은 다 가보려고 해요. <br>"
	    						 +"✔ 가보고 싶은 곳만 알아보고 계획이라는게 딱히 없어 휴무일에 방문하는 떄도 있지만 개의치 않아요. <br>"
	    						 +"✔ 친한 친구들과 펜션을 잡고 놀러 가거나 요즘 핫한 핫플레이스를 방문하는 것도 좋아해요. <br>"
	    						 +"✔ 평소 가고 싶었던 여행지의 할인 이벤트를 보고 굉장히 신나해요. <br>"
	    						 +"✔ 같이 놀러 간 친구가 힘들어 보이면 응원을 해주며 마지막으로 한번만 가자고 어떻게든 설득해요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ESFP.png"); break;
	    				 case "ESTJ"  :
	    					 str += " ✔ 여행을 가고자 확실하게 마음을 먹으면 엄청난 추진력으로 깔끔하게 여행 계획을 세워요. <br>"
	    						 +"✔ 사전에 모든 예약할 곳을 알아본 뒤 기다리지 않고 바로바로 할 수 있도록 예약해둬요. <br>"
	    						 +"✔ 여행 시 몇분 열차인지 몇 분 버스인지 이동수단을 미리 파악하고 이동하는 동안 갈 수 있는 곳을 파악해요. <br>"
	    						 +"✔ 여행 계획을 시간 단위로 나눠서 각 이동 수단별/장소별/세부 예산까지 엑셀에 정리해두며 뿌듯해해요. <br>"
	    						 +"✔ 예기치 못한 상황이 발생할 것을 대비하여 플랜 B도 미리 계획해둬요. <br>"
	    						 +"✔ 이렇게까지 계획을 세우는 이유는 시간 낭비와 돈 낭비를 막기 위해서에요.";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ESTJ.png"); break;
	    				 case "ESTP"  :
	    					 str += " ✔ 친구들과 가고 싶은 여행지가 다를 경우 중재를 하며 해결책을 마련해줘요. <br>"
	    						 +"✔ 계획적이기보다 즉흥적으로 여행을 떠나는 스타일! 여행을 떠났을 때 즉흥적이고 다양한 경험을 많이 하고 싶어 아낌없이 돈을 다 써요. <br>"
	    						 +"✔ 분위기에 취해 잡생각 따위는 던져버리고 오늘! 바로 이 지금 여행지에 집중해요. <br>"
	    						 +"✔ 여행 계획이 틀어져도 했다 치고 다음 계획으로 과감히 넘어가요. <br>"
	    						 +"✔ 어느 여행지에 가서도 특유의 친화력으로 여행지 사람과 맞팔하거나 친하게 지내요. <br>"
	    						 +"✔ 그 여행지의 맛집에 방문하거나 신박한 아이템이 있으면 이걸로 장사하면 될 것 같은데 왜 안하지? 라고 생각하며 즐겨요.";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ESTP.png"); break;
	    				 case "INFJ"  :
	    					 str += " ✔ 숙소에 감성이 가득하며 돌아다니기보다 그 안에서 모든 걸 해결할 수 있는 여행이 좋아요. <br>"
	    						 +"✔ 여행의 마무리로 숙소에서 내가 좋아하는 영화 한 편을 틀어놓는 감성을 좋아해요. <br>"
	    						 +"✔ 계획을 짤 때, 속으로 불만이 있어도 말하지 않고 겉으로 호응해줘요. <br>"
	    						 +"✔ 이쁘고 차분한 말로 상대방을 설득해 결국 내가 의도한 여행을 하게 만들어요. <br>"
	    						 +"✔ 여행지에 있는 특유의 감성이 가득한 소품 가게나 카페에 가는 것을 좋아해요. <br>"
	    						 +"✔ 혼자 여행을 가면 충동적으로 하거나 계획과 다르게 변경 되기도 하지만, 친구들과 같이 가는 여행에서는 친구들의 일정에 맞추고 다 같이 만족할만한 계획을 짜요.";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/INFJ.png"); break;
	    				 case "INFP"  :
	    					 str += " ✔ 집 밖에 나가는 걸 좋아하지 않고 여행을 가기 전까지도 고민하지만 떠밀려서 가도 세상 제일 즐거워해요. <br>"
	    						 +"✔ 편하다고 생각하는 친한 친구들과 함께하는 여행에선 절대 웃음이 끊기질 않아요. <br>"
	    						 +"✔ 감성적이고 섬세한 성격이라 로맨틱하고 감성 가득한 여행지를 좋아해요. <br>"
	    						 +"✔ 여유로운 분위기 가득한 호캉스에서 완벽하게 만들어 줄 이쁘고 맛있는 음식을 찾아다니며 책과 음악이 함께하는 여행을 즐기곤 해요. <br>"
	    						 +"✔ 다 같이 하는 여행도 좋지만 혼자 있길 좋아하고 혼자만의 시간이 필요해 혼자 떠나는 여행도 좋아해요. <br>"
	    						 +"✔ 여행 계획을 짤 때 완벽한 계획이기를 원하지만, 너무 빈틈없는 꼼꼼한 여행보다 융통성이 있는 계획을 선호해요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/INFP.png"); break;
	    				 case "INTJ"  :
	    					 str += " ✔ 남들이 다 가는 유명한 여행지보다 사람이 적고 조용한 여행을 선호해요. <br>"
	    						 +"✔ 여행 장소를 정할 땐 뭔가를 좋아해 그것에 대해 더 잘 알고 싶다고 생각이 들면 여행 계획을 세우기도 해요. <br>"
	    						 +"✔ 여행지에서 어떤 일이 발생할지 모르니 세세한 계획보다 꼭 가보고 싶은 곳이나 하고 싶은 리스트 몇 개만 적어둬요. <br>"
	    						 +"✔ 친구들과 함께하는 여행에서 다른 사람의 감정을 빨리 캐치하기 때문에 나도 상대방도 모두 만족할만한 효율적인 여행 계획을 하려고 노력해요. <br>"
	    						 +"✔ 계획이 디테일 할수록 본인이 가장 뿌듯해하며 같이 가는 사람들에게 정리한 파일을 공유하는 것도 좋아합니다. <br>"
	    						 +"✔ 다 같이 여행을 갈 때도 모두가 꼭 방문하고 싶은 메인 관광지를 선정해 장소를 취합하고, 그 관광지의 주변 맛집과 쇼핑할 곳, 구경할 만한 곳을 찾아봐요.";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/INTJ.png"); break;
	    				 case "INTP"  :
	    					 str += " ✔ 사람들에게 많이 알려지지 않은 여행 장소를 좋아합니다. <br>"
	    						 +"✔ 조용하고 한적한 자연 같은 곳에서 혼자만의 시간과 여유를 가지고 힐링하는 스타일을 좋아해요. <br>"
	    						 +"✔ 여행 계획에서 가장 중요한 것은 효율적인 이동 수단! 가는 방법에 대해 먼저 고민해요. <br>"
	    						 +"✔ 여행에서도 어떻게 해야 가장 효율적으로 놀 것인지 고민하고 가장 나은 해결책을 제시해줘요. <br>"
	    						 +"✔ 누군가 계획을 잡거나 스케줄을 알려주면 세부적인 것들을 정리해요. (맛집/카페/놀거리)<br>"
	    						 +"✔ 사람이 많이 없는 카페 같은 곳에서 그곳의 한적함을 느끼며, 나만의 감성 사진을 찍을 수 있는 곳으로 떠나고 싶어요.";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/INTP.png"); break;
	    				 case "ISFJ"  :
	    					 str += " ✔ 평소에도 미리 가고 싶은 여행지, 숙소, 맛집 등이 메모장에 적혀있어요. <br>"
	    						 +"✔ 여행 가기 전 동선을 미리 파악해 최적의 여행루트를 만들고 세세하게 계획을 짭니다. <br>"
	    						 +"✔ 감각적이며 가성비 좋은 여행지를 가고 싶어해요. <br>"
	    						 +"✔ 함께 가는 친구들의 의견을 모아 다수가 만족할 수 있게 정리하며 여행을 계획해요. <br>"
	    						 +"✔ 심리적으로 편하다고 생각하는 친구들과 여행 가기를 좋아하며, 그 친구들과 함께 할 땐 뜬금없이 친구를 웃게 해요. <br>"
	    						 +"✔ 여행 짐을 챙길 때도 부족함 없이 '누군가는 쓰겠지~' 라며 넉넉하게 짐을 챙겨요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ISFJ.png"); break;
	    				 case "ISFP"  :
	    					 str += " ✔ 스트레스를 받고 있을 때 여행을 떠나고 싶어 즉흥으로 친구들과 여행 약속을 잡아요. <br>"
	    						 +"✔ 작은 디테일이 중요해서 숙소나 카페는 감정이 가득한 곳을 찾고 계획 다 세웠으면 스스로 만족해요. <br>"
	    						 +"✔ 친구들과 여행 계획을 세울 때 이것도 저것도 괜찮은 것 같다며 호응해줘요. <br>"
	    						 +"✔ 여행 자체 분위기에 취하는 타입으로 내가 좋아하는 장소에 가면 여행에 취해요. <br>"
	    						 +"✔ 친구들과 여행하는 것도 좋지만 가끔 혼자만의 여유로운 여행 시간도 좋아해요. <br>"
	    						 +"✔ 여행을 하며 돌아다니는 것도 좋지만 나를 위한 힐링의 시간이기 떄문에 너무 타이트한 여행은 힘들어요. <br>"
	    						 +"✔ 여행을 통해 여태껏 받았던 스트레스를 풀어요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ISFP.png"); break;
	    				 case "ISTJ"  :
	    					 str += " ✔ 여행을 간다고 하면 누가 시키지 않아도 스스로 알아서 일정을 계획하고 정리해요. <br>"
	    						 +"✔ 꼼꼼한 성격이고 계획에 맞춰 마무리하는 것을 좋아하기 때문에 여행지에 대해 모든 걸 알아가려고 해요. <br>"
	    						 +"✔ 계획적으로 여행하기를 좋아해서 여행 전 시간 단위로 엑셀에 정리해요. <br>"
	    						 +"✔ 사람이 많이 없고 조용한 힐링 여행지를 좋아하며, 혼자 떠나는 여행을 좋아해요. <br>"
	    						 +" ✔ 숙소나 그 여행지의 할인 방법을 정리하며 최고의 가성비 여행을 준비해요. <br>"
	    						 +"✔ 친구들과 여행에 갈 때도 계획을 세우며 블로그, 카페 등 후기와 정보들을 찾아봐요. ";
	    					 $("#resultImg").css("display","block").prop("src","/finalProject/resources/images/mbtiResult/ISTJ.png"); break;
    				 }; 
    				 $("#resultText").css("display","block").html(str);
    				 $("#banner_2").append("<a href='main.bo' style='margin-top:20px;' class='btn btn-info'>메인으로</a>")
    			 },
    			 error : function(){
    				 
    			 }
    		 });
    	 }
    	 
    </script>
</body>
</html>