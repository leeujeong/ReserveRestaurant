<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  	<link href="<c:url value="/resources/css/userCSS/reserve.css"/>" rel="stylesheet">
  	<script src="<c:url value="/resources/js//userJS/reserve.js"/>"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script>
        $(document).ready(function(){
			
        	
        	$('#people').on({
        		"click" : function(){
        			var number = ($(this).attr('value'));

        			if(number==100){ // 숫자가 9이상이라면 초기화
        				$(this).attr('value', '0');
        			}else{
        				var plus_num = parseInt(number) + 1;
        				$(this).attr('value', plus_num);
        			}
        		}
        	});
        	  
        	//달력
        	$("#datepicker").datepicker();
        	  
        	$.datepicker.setDefaults({
        	    dateFormat: 'yy-mm-dd',
        	    prevText: '이전 달',
        	    nextText: '다음 달',
        	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        	    showMonthAfterYear: true,
        	    yearSuffix: '년',
        	    showOn : 'button'
        	});
        	
        	// 넘기기 함수
            fnSwiper();
            
			//모달
            $('a[href="#ex7"]').modal({
                fadeDuration: 250
            });
            
            $('.trigger').on('click', function() {
                $('.modal-wrapper').toggleClass('open');
                $('.page-wrapper').toggleClass('blur-it');
                return false;
            });
             
        });
    </script>
 
    
  <style type="text/css">
  .ui-datepicker { width: 17em; padding: .2em .2em 0; display: none; font-size: 30px;}
  
  .input_box{
  	width: 200px;
  	height: 50px;
  	border: 1px solid silver;
  	border-radius: 5px;
  	outline: none;
  	font-size: 22px;
  	text-align: center;
  	margin-bottom: 30px;
  }

  </style>
</head>

<body>

    <header>
        <div class="wrap">
            <h1>
                <a href="/restaurant/">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
            </h1>
            <ul id="gnb">
               <c:if test="${loginUser == null}">
	                <li><a href="/restaurant/user/loginPage">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
	                <li><a href="호스트로그인페이지이동">HOSTLOGIN&nbsp;&nbsp;&nbsp;/</a></li>
	                <li><a href="/restaurant/user/join">JOIN&nbsp;&nbsp;&nbsp;/</a></li>
	                <li><a href="/restaurant/user/myPage">MYPAGE&nbsp;&nbsp;&nbsp;/</a></li>
            	</c:if>
            	
            	<!-- 사용자 state =1 -->
            	<c:if test="${loginUser.state == 1}">
            			<li>${loginUser.id} 님 환영합니다</li>
            		  <li><a href="/restaurant/user/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/user/myPage?userNo=${loginUser.userNo}">MYPAGE&nbsp;&nbsp;&nbsp;/</a></li>
            	</c:if>
            	
            	<!-- 관리자 state 2 -->
            	<c:if test="${loginUser.state == 2}">
            		  <li>${loginUser.id} 님 환영합니다</li>
            		  <li><a href="/restaurant/admin/myPage">ADMIN PAGE</a></li>
            	</c:if>
            	
            	<!-- 사업자는 어떻게? -->
                
            </ul>
        </div>
    </header>

    <div class="accordion">
        <div class="cate quickmenu">
            <span class="menu">
                <a href="#" class="menulink">Reservation</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="식당검색페이지"> 식당 검색  </a></li>
                <li><a href="식당검색페이지"> 할인 되는 식당</a></li>
                <li><a href="식당검색페이지"> 신규 오픈 </a></li>
            </ul>
        </div>
        <div class="cate quickmenu">
            <span class="menu"> 
                <a href="#" class="menulink">Board</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="공지사항"> 공지사항 </a></li>
                <li><a href="리뷰"> 리뷰 </a></li>
                <li><a href="리뷰"> Q&A </a></li>
            </ul>
        </div>
        <div class="cate quickmenu">
            <span class="menu">
                <a href="#" class="menulink">Magazines</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li>다이닝 매거진</li>
            </ul>
        </div>
    </div>


    <section class="main">
        <div class="wrap">
            <div id="frame">
            	예약페이지
            	<hr>
                <form id="f" method="post">
                    <ul class="slide">
                        <li>
                        	<br><br>
                        	<span style="font-size: 20px; font-weight: bold;">요청사항 ></span>	 
                        	<br><br>
                        	<textarea style="width: 200px" rows="5" cols="30" id="request" name="request"></textarea>
                        	<br><br>
                        	<input type="button" value="예약하기">
                        	<button>예약하기</button>
                           	
                        </li>
                        <li>
                        	 <div class="reserve_div">
                        	 <span style="font-size: 20px; font-weight: bold;">날짜를 선택하세요 ></span>
                        	 </div>
                        	 <br>
                        	 <input type="text" id="datepicker" name="bookDate" class="input_box">
                        	 <br><hr><br>
                        	 
                        	<div class="reserve_div">
                        	<span style="font-size: 20px; font-weight: bold;">인원 ></span>
                        	</div>
                        	 <hr> 
                        	 <br>
                       	   	<input type="text" name="people" id="people" class="input_box" value="1"> <span style="font-size: 20px; font-weight: bold;">명 </span>
                             <br>
                        </li>
                        
                        <li>
						<div>
								<div class="reserve_div">
                        		<span style="font-size: 20px; font-weight: bold;">예약시간 ></span>
                        		<br><br>
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours1" name="bookHours"  type="button" data-hour="12" value="오후12:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours2"  name="bookHours2" type="button" value="오후13:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours3"  name="bookHours3" type="button" value="오후14:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours4"  name="bookHours4" type="button"   value="오후15:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours5"  name="bookHours5" type="button"   value="오후16:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours6"  name="bookHours6" type="button"  value="오후17:00" >
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours7"  name="bookHours7" type="button"  value="오후18:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours8"  name="bookHours8" type="button"   value="오후19:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours9"  name="bookHours9" type="button" value="오후20:00">
                        		
                        		<input id="bookHours" name="bookHours"  type="hidden">
                        		<input id="bookHours10"  name="bookHours10" type="button"  value="오후21:00">
                        		
                        		<input type="button"  value="초기화" onclick="fnInit()">
    							 
                        		</div>
                        		<br>
                        	<span style="font-size: 20px; font-weight: bold;">예약타입 ></span>	 
                        	<br><br>
							<input name="bookType" type="radio" value="홀">홀&nbsp;
							<input name="bookType" type="radio" value="룸">룸&nbsp;
							<input name="bookType" type="radio" value="부스테이블">부스테이블&nbsp;

						</div>
							         
                        </li>
                    </ul>
                </form>
            </div>
            <a href="#none" class="prev"  >
                <img src="/restaurant/resources/image/index/prev.png" alt="이전">
            </a>
            <a href="#none" class="next" >
                <img src="/restaurant/resources/image/index/next.png" alt="다음">
            </a>
            <ul class="page">
                <li class="num">3</li>
                <li>/ 4</li>
            </ul>
        </div>
    </section>




    <section id="bottom">
        <div class="wrap">
            <div class="footer">
                <div class="footer_inner">
                    <ul class="footer_link">
                        <li><a href="#" target="_blank" class="footer_item">이용약관&nbsp;|</a></li>
                        <li><a href="#" target="_blank" class="footer_item">개인정보처리방침&nbsp;|</a></li>
                        <li><a href="#" target="_blank" class="footer_item">책임의 한계와 법적고지&nbsp;|</a></li>
                        <li><a href="#" target="_blank" class="footer_item">회원정보 고객센터</a></li>
                    </ul>
                    <div class="footer_copy">
                        <a href="/restaurant/">
                            <img src="/restaurant/resources/image/index/projectlogo.png" alt="logo">
                        </a>
                        <span class="text">Copyright</span>
                        <span class="corp" style="font-weight: 800;">&copy; FindTable Corp.</span>
                        <span class="text">All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

	
  
    <p>
        <a class="btn" href="#ex7"></a>
    </p>
    <div id="ex7" class="modal">
        <h3>알려드립니다</h3>
        <hr><br>
        <div>
            정부의 사회적 거리두기 강화 추진 정책에 따라 예약 인원 및 시간이 제한됩니다.<br><br> *영업시간 내 최대 4인 예약가능&nbsp;(전원 방역패스 인증 필수)&nbsp;<br><br> *미접종자는 1인 단독 이용만 가능 <br><br>*영역시간이 저녁 9시로 단축됨에 따른 예약 가능 시간 조정<br><br>&nbsp;(매장마다 예약 가능 시간은 다르게 적용됩니다.)
        </div>
    </div>

    <div class="page-wrapper">
        <a class="btn trigger" href="#"></a>
    </div>
 		<script>
 		
 		function fnInit() {
			$('#bookHours').val('');
		}

 		$('#bookHours1').click(function() {
 		   $(this).prev().val('12');
 		});

 		$('#bookHours2').click(function() {
 		   $(this).prev().val('13');
 		});

 		$('#bookHours3').click(function() {
 		   $(this).prev().val('14');
 		});

 		$('#bookHours4').click(function() {
 		   $(this).prev().val('15');
 		});

 		$('#bookHours5').click(function() {
 		   $(this).prev().val('16');
 		});

 		$('#bookHours6').click(function() {
 		   $(this).prev().val('17');
 		});

 		$('#bookHours7').click(function() {
 		   $(this).prev().val('18');
 		});

 		$('#bookHours8').click(function() {
 		   $(this).prev().val('19');
 		});

 		$('#bookHours9').click(function() {
 		   $(this).prev().val('20');
 		});
 		$('#bookHours10').click(function() {
 		   $(this).prev().val('21');
 		});
 		
 
 		

 		</script>

</body>

</html>