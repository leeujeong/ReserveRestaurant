<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/userCSS/detail.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/js/userJS/detail.js"/>" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" integrity="sha512-4wfcoXlib1Aq0mUtsLLM74SZtmB73VHTafZAvxIp/Wk9u1PpIsrfmTvK0+yKetghCL8SHlZbMyEcV8Z21v42UQ==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
   <!-- 제이쿼리 --> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <script>
 $(document).ready(function() {
	    fnhover();
	    fnQuickMenu();
	});

	function fnQuickMenu() {
	    var currentPosition = parseInt($(".quickmenu").css("top"));
	    $(window).scroll(function() {
	        var position = $(window).scrollTop();
	        $(".quickmenu").stop().animate({ "top": position + currentPosition + "px" }, 1000);
	    });
	}

	function fnhover() {
	    (function($) {
	        $('.cate ul').hide();
	        $('.cate .menu .subopen').click(function() {
	            if ($(this).hasClass('active')) {
	                $(this).parent().next().slideUp('slow');
	                $(this).removeClass('active');
	            } else {
	                $('.accordion').find('.active').parent().next().slideUp('slow');
	                $('.accordion').find('.active').removeClass('active');
	                $(this).parent().next().slideDown('slow');
	                $(this).addClass('active');
	            }
	        });
	    })(jQuery);
	}
	
 </script>
 
 <style>
 a{
 	color: black;
 }
 </style>
</head>
<body>

	
	  <header>
        <div class="wrap">
            <h1 style="padding-top: 0">
                <a href="/restaurant/" >
                    <img  src="/restaurant/resources/image/index/projectlogo.png">
                </a>
                
            </h1>
            <ul id="gnb">
            
            		<li><a href="/restaurant/user/search"><i class="fas fa-search fa-lg"></i></a></li>
            
            	<c:if test="${loginUser == null}">
	                <li><a href="/restaurant/user/loginPage">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
	                <li><a href="/restaurant/user/join">JOIN&nbsp;&nbsp;&nbsp;</a></li>
            	</c:if>
            	
            	<!-- 사용자 state =1 -->
            	<c:if test="${loginUser.state == 1}">
            			<li>${loginUser.id} 님 환영합니다</li>
            		  <li><a href="/restaurant/user/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/user/myPage">MYPAGE&nbsp;&nbsp;&nbsp;</a></li>
            	</c:if>
            	
            	<!-- 관리자 state 2 -->
            	<c:if test="${loginUser.state == 2}">
            		  <li>${loginUser.id} 님 환영합니다&nbsp;&nbsp;&nbsp;/</li>
            		  <li><a href="/restaurant/admin/adminPage">ADMIN PAGE</a></li>
            	</c:if>
            	
            	<!-- 사업자는 어떻게? -->
              <c:if test="${loginUser.state == 3}">
            		  <li>${loginUser.id} 님 환영합니다&nbsp;&nbsp;&nbsp;/</li>
            		  <li><a href="/restaurant/owner/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/owner/managePage">OWNER PAGE</a></li>
            	</c:if>
                
                
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
                <li><a href="/restaurant/user/search"> 식당 검색  </a></li>
                <li><a href="식당검색페이지"> 할인 되는 식당</a></li>
                <li><a href="/restaurant/user/reserve"> 신규 오픈 </a></li>
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
                <li><a href="/restaurant/user/detail">다이닝 매거진</a></li>
            </ul>
        </div>
    </div>
    
	
    <section class="rest_section">
        <image src="/restaurant/resources/image/index/rest1.jpg" class="main_image" style="width: 300px;" style="height: 200px;">
          
        </image>
        <div class="rest_detail">
            <p>식당이름</p>
            <p>★4.5</p><button id="reviewbtn">리뷰 보기 >></button>
            <input type="button" onclick="location.href='/restaurant/user/reviewPage'" value="리뷰작성하기">
            <span>(45)</span>
            <p>09 : 00 ~ 18 : 00</p>
            <p>010-0000-0000</p>
            
            <input type="button" value="예약하기" class="reserve_btn" onclick="location.href='/restaurant/user/reserve'">
        </div>
    </section>
    <section class="menu_section">
        <div class="menu_title">메뉴</div>
        <ul class="menu_list">
            <li>
                <i class="fas fa-chevron-left"></i>
            </li>
            <li>
                <img src="/이미지/양식/steak.jpeg" style="width: 250px; height: 250px;">
                <p>menuName</p>
                <p>menuPrice</p>
            </li>
            <li>
                <img src="/이미지/양식/pizza.jpeg" style="width: 250px; height: 250px;">
                <p>menuName</p>
                <p>menuPrice</p>
            </li>
            <li>
                <img src="/이미지/양식/salad1.jpeg" style="width: 250px; height: 250px;">
                <p>menuName</p>
                <p>menuPrice</p>
            </li>
            <li>
                <i class="fas fa-chevron-right"></i>
            </li>
        </ul>
    </section>
    <section class="review_section">
        <div class="review_title">방문자 리뷰
                <a href="#"><span>더보기 ></span></a>
        </div>
        <!-- 리뷰 총점 -->
        <div class="review_aver">
            <span>★4.0
                <span class="total_review">(10)</span>
            </span>
        </div>
        <!-- c태그 if문과 foreach문을 활용하여 li하나만 남겨둘것임 -->
        <ul class="review_list">
            <li>
                <a href="">
                    <img src="/이미지/양식/steak2.jpeg" width="300px" height="100%" class="review">
                    <div class="review_content">
                        <span>reviewWriter</span>
                        <span>reviewRate</span>
                        <p>reviewDate</p>
                        <p>reviewContent</p>
                    </div>
                </a>
            </li>
            <li style="height: 300px;">
                <a href="">
                    <img src="/이미지/양식/salad1.jpeg" width="300px" height="100%" class="review">
                    <div class="review_content">
                        <span>작성자</span>
                        <span>★4.0</span>
                        <p>2021.12.08</p>
                        <p>오늘은 마라탕을 태어나서 처음 먹었다 맛있었다 또 먹을거다</p>
                    </div>
                </a>
            </li>
            <li style="height: 300px;">
                <a href="">
                    <img src="/이미지/양식/pizza.jpeg" width="300px" height="100%" class="review">
                    <div class="review_content">
                        <span>작성자</span>
                        <span>★4.0</span>
                        <p>2021.12.08</p>
                        <p>오늘은 마라탕을 태어나서 처음 먹었다 맛있었다 또 먹을거다</p>
                    </div>
                </a>
            </li>

        </ul>




    </section>
    <section class="picture_section">
        <!-- 해당 이미지를 누르면 해당 리뷰로 이동한다 -->
        <div class="picture_title">사진</div>
        <table class="image_table">
            <tbody class="review_image_table">
                <tr>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/chicken.jpeg" width="200px" height="200px" class="review_image_header">
                        </a>
                    </td>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/hamburger1.jpeg" width="200px" height="200px">
                        </a>
                    </td>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/pasta2.jpeg" width="200px" height="200px">
                        </a>
                    </td>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/salad2.jpeg" width="200px" height="200px" class="review_image_footer">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/steak3.jpeg" width="200px" height="200px" class="review_image_header">
                        </a>
                    </td>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/stew.jpeg" width="200px" height="200px">
                        </a>
                    </td>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/steak2.jpeg" width="200px" height="200px">
                        </a>
                    </td>
                    <td>
                        <a href="">
                            <img src="/이미지/양식/pizza3.jpeg" width="200px" height="200px" class="review_image_footer">
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
	
	
	    <section class="icon_section">
		    <div class="picture_title">위치</div>
				 <p style="margin-top:-12px">
			    <em class="link">
			        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
			        </a><br>
			    </em>
				</p>
				<div id="map" style="width:100%;height:350px;"></div>
				<div id="clickLatlng" style="display: none;"></div>
		 </section>
		 
	
    <section class="icon_section">
        <div class="icon_title"></div>
        <table class="icon_table">
            <tbody>      <!-- 해당 식당 옵션 받아오기 -->
                <tr>
                    <td>
                        <i class="fas fa-wine-glass-alt"></i>
                        <p>콜키지 가능</p>
                    </td>
                    <td>
                        <i class="fas fa-moon"></i>
                        <p>심야 영업</p>
                    </td>
                    <td>
                        <i class="fas fa-baby"></i>
                        <p>아기의자</p>
                    </td>
                    <td>
                        <i class="fas fa-users"></i>
                        <p>단체석</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <i class="fas fa-parking"></i>
                        <p>주차 가능</p>
                    </td>
                    <td>
                        <i class="fas fa-wifi"></i>
                        <p>무료 와이파이</p>
                    </td>
                </tr>
            </tbody>
        </table>
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
                        <a href="#" target="_blank">
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
    
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0a3823d468d0cf274b39863a66eb42c&libraries=services"></script>
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0a3823d468d0cf274b39863a66eb42c"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다  //해당식당 주소를 변수로 넣을예정..?
		geocoder.addressSearch('서울 마포구 서강로 136', function(result, status) {
			console.log(geocoder);
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
				message += result[0].x + ')';
				
				var resultDiv = document.getElementById('clickLatlng'); 
				resultDiv.innerHTML = message;
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">해당식당이름</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
    </script>
    
	
	
</body>
</html>