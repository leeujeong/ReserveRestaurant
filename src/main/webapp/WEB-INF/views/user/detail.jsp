<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" integrity="sha512-4wfcoXlib1Aq0mUtsLLM74SZtmB73VHTafZAvxIp/Wk9u1PpIsrfmTvK0+yKetghCL8SHlZbMyEcV8Z21v42UQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link href="<c:url value="/resources/css/userCSS/detail.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/js/userJS/detail.js"/>" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
	$(document).ready(function() {
	
		fnSelectHour();
		fnSelectBookingList();
		
	 
	    fnhover();
	    fnQuickMenu();
	    fnBooking();
	    fnHourCheck();
	  	  $('#exampleModalCenteredScrollable').modal('hide');
		
	  	  $('#exampleModalCenteredScrollable').modal('show');
	  
		
	    // input 상자 눌러서 인원수 늘리기
      	$('#bookPeople').on({
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
    	
 });// Pageload 끝
 
	    
 
	function fnQuickMenu() {
	    var currentPosition = parseInt($(".quickmenu").css("top"));
	    $(window).scroll(function() {
	        var position = $(window).scrollTop();
	        $(".quickmenu").stop().animate({ "top": position + currentPosition + "px" }, 1000);
	    });
	}  //QuickMenu 끝
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
	}  // hover 끝
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//시간 선택
	 var hour = 0;
	 function fnSelectHour() {
		 $('.bookHours').on('click', function(){
				hour = $(this).data('hour');
				let result = $(this).val();
				$('#date_result').text(result+ '시를 선택하셨습니다.');
			});
	 }
	
	//예약 등록하기
	function fnBooking() {
		$('#booking_btn').click(function(){
			alert('예약하시겠습니까?');
			let booking = JSON.stringify({
				bookDate : $('#datepicker').val(),
				bookPeople : $('#bookPeople').val(),
			    bookHours : hour,
				bookType : $('input:radio[name="bookType"]:checked').val(),
				bookRequest : $('#bookRequest').val(),
				userNo : $('#userNo').val(),
				resNo : $('#resNo').val(),
				resOrigin : $('#resOrigin').val(),
				resSaved : $('#resSaved').val(),
				resPath :$('#resPath').val()
			});
			console.log(booking);
			$.ajax({
				url : '/restaurant/book/booking',
				type : 'post',
				data : booking,
				contentType : 'application/json',
				dataType : 'json',
				success : function (map) {
					if(map.result > 0 ){
						alert( map.result.bookDate +','+ map.result.bookHours +'시 에 예약 되었습니다.');
						$('#exampleModalCenteredScrollable').modal('hide');
						//if(confirm('예약 현황을 보러 가시겠습니까?')){
						//	location.href="/restaurant/book/selectBookingList?bookNo="+map.bookNo;
						//}
						 
					} else{
						alert('예약 실패');
					}
				},
				error : function (xhr) {
					
				}
			});
		});
	} // booking 끝
	
	function fnSelectBookingList() {
		$('#myBooking').click(function(){
			$('#f2').attr('action', '/restaurant/book/selectBookingList');
			$('#f2').submit();
		});
		
	}//selectbookinglist끝
	
	let hourPass = false;
	function fnHourCheck() {
	//	$('#id').keyup(function(){
			
    //        let regId = /^[a-zA-Z0-9-_]{4,}$/;
	//		if ( regId.test($(this).val()) == false ) {
	//			$('#id_result').text('아이디는 대문자,숫자,특수문자 -,_ 사용해서 4자 이상 입력해주세요.').addClass('no').removeClass('ok');
	//			idPass = false;
	//			return;
	//		}
	      $('.bookHours').on('click', function(){
	    	  bookHours = $(this).data('hour');
	      
			$.ajax({
				url: '/restaurant/user/hourCheck',
				type: 'post',
				data: 'bookHours='+bookHours,
				dataType: 'json',
				success: function(map){
						alert(map.result);
						console.log(map.result);
				},
				error: function(xhr){
					
				}
			});
	      });
	}  // end fnIdCheck
	
	
	
 </script>
 
 <style>
	 /* modal 박스 css시작*/
	 a{
	 	color: black;
	 	text-decoration: none;
	 	font-weight: normal
	 }
	 label{
	 	cursor: pointer;
	 }
	 #request{
	 	outline: none;
	 	border: 1px solid silver;
	 	border-radius: 5px;
	 }
	.reserve_div{
		margin-bottom: 30px;
	}
	.reserve_text{
		font-family: nanumsquare;
		font-size: 19px;
		font-weight: bold;
	}
	.bookHours{
		margin: 3px 3px;
	}
	.check_img1{
		display: none;
		margin-right: 20px;
	}
	.ok{
		display: inline;
	}
	.reviewbox{
		display:flex;
	}
	.reviewimg{
		width:200px;
		height:250px;
	}
	.reviewmultiple{
		width:300px;
		
	}
	.reviewdaterate span{
		font-size:14px;
		font-weight:400;
	}
	
/*modal 박스 css 끝*/
  .input_box{
	  	width: 120px;
	  	height: 50px;
	  	border: 1px solid silver;
	  	border-radius: 5px;
	  	outline: none;
	  	font-size: 13px;
	  	text-align: center;
	  	margin-bottom: 30px;
	  	cursor: pointer;
  }
  .dateinput{
  	border:none;
  	outline:none;
  }
  
      
   .wrapper{ width: 400px; height: 400px; border: 1px solid red; position: relative; overflow: hidden; } .wrapper img{ width: 400px; position: absolute; top: 0; transition: left 0.4s ease-out; } .wrapper img:nth-child(1){ left: 0; } .wrapper img:nth-child(2){ left: 400px; } .wrapper img:nth-child(3){ left: 800px; } .wrapper img:nth-child(4){ left: 1200px; } .wrapper img:nth-child(5){ left: 1600px; }
  
  
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
            
            
            			<li><a href="/restaurant/admin/searchPage"><i class="fas fa-search fa-lg"></i></a></li> 
            
            	<c:if test="${loginUser == null}">
	                <li><a href="/restaurant/user/loginPage">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
	                <li><a href="/restaurant/user/join">JOIN&nbsp;&nbsp;&nbsp;</a></li>
            	</c:if>
            	
            	<!-- 사용자 state =1 -->
            	<c:if test="${loginUser.state == 1}">
	            	<c:if test="${loginUser.name != '관리자'}">
	            			<li>${loginUser.id} 님 환영합니다</li>
	            		  <li><a href="/restaurant/user/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
	            		  <li><a href="/restaurant/user/myPage">MYPAGE&nbsp;&nbsp;&nbsp;</a></li>
	            	</c:if>
            	</c:if>
            	
             	<c:if test="${loginUser.name == '관리자'}">
            		  <li>${loginUser.id} 님 환영합니다</li>
            		  <li><a href="/restaurant/user/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/admin/adminPage">ADMIN&nbsp;PAGE&nbsp;&nbsp;&nbsp;</a></li>
            	</c:if>
            	
            	<!-- 사업자 -->
              <c:if test="${loginUser.state == 3}">
            		  <li>${loginUser.id} 님 환영합니다&nbsp;&nbsp;&nbsp;/</li>
            		  <li><a href="/restaurant/owner/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/owner/bookPage">OWNER PAGE</a></li>
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
            <ul style="text-align: center;">
                <li><a href="/restaurant/user/search"> 식당검색  </a></li>
                <li><a href="식당검색페이지">할인되는식당</a></li>
                <li><a href="/restaurant/user/reserve"> 신규 오픈 </a></li>
            </ul>
        </div>
        <div class="cate quickmenu">
            <span class="menu"> 
                <a href="#" class="menulink">Board</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="/restaurant/notice/selectNoticeList"> 공지사항 </a></li>
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
        <img src="/restaurant/${restaurant.resPath}/${restaurant.resSaved}" class="main_image" style="width: 500px;" style="height: 500px;"/>
         
        <div class="rest_detail">
            <p>${restaurant.resName}</p>
            <span>★4.5</span> &nbsp;<span>(45)</span>
            <p>영업시간 : ${restaurant.resOpenTime} ~ ${restaurant.resCloseTime}</p>
            <p>전화번호 : ${restaurant.resTel}</p>
            <div class="comment_box">
				주인장이 남기는 말<br>            
	            <p>${restaurant.resContent}</p>
            </div>
            
            <!--******************************************* 예약하기********************************************** -->
           
			<div class="modal fade show" id="exampleModalCenteredScrollable" tabindex="-1" aria-labelledby="exampleModalCenteredScrollable" style="display: block;" aria-modal="true" role="dialog">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenteredScrollable">${rest.resName} 예약하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<form id="f" method="post">
			      		<div class="reserve_div">
							 <span class="reserve_text">날짜 선택 </span>			      		
				      		 <input type="text" id="datepicker" name="bookDate" class="input_box"> 
			      		</div>
			      		<hr>
			      		<div class="reserve_div">
                        	<span class="reserve_text">&nbsp;&nbsp;&nbsp;인원 &nbsp;&nbsp;&nbsp;&nbsp;</span>
                       	   	<input type="text" name="bookPeople" id="bookPeople" class="input_box" value="1">&nbsp;&nbsp;명 
                             <br>
                       	</div>
                       	<hr>
                       	
                       	<div class="reserve_div">
                        	<span class="reserve_text">예약시간 </span><span id="date_result" style="color: green">&nbsp;:  </span><br>
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="12" value="오후12:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="13" value="오후13:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="14" value="오후14:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="15" value="오후15:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="16" value="오후16:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="17" value="오후17:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="18" value="오후18:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="19" value="오후19:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="20" value="오후20:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="21" value="오후21:00">
                        	<input class="bookHours btn btn-danger" name="bookHours"  type="button" data-hour="22" value="오후22:00">
                        </div>
                        <hr>
                        <div class="reserve_div">
                        <span class="reserve_text">예약타입 </span>	 
                        	<br><br>
                        	&nbsp;<label for="hall">홀</label><span class="check_img1"></span>
                        	<input name="bookType" type="radio" value="홀" id="hall"  >
                        	&nbsp;<label for="room">룸</label><span class="check_img1"></span>
                        	<input name="bookType" type="radio" value="룸" id="room" >
                        	&nbsp;<label for="booth">부스</label><span class="check_img1"></span>
                        	<input name="bookType" type="radio" value="부스테이블" id="booth" >
                        	&nbsp;<label for="bar">바</label><span class="check_img1"></span>
                        	<input name="bookType" type="radio" value="바" id="bar" >
                         
                        </div>
                        <hr>
                        
                        <div class="reserve_div">
                        	<span class="reserve_text">요청사항 </span><br>	 
                        	<textarea rows="5" cols="50" name="bookRequest" id="bookRequest"></textarea>
                        </div>
			      		
			      	</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <input type="button" class="btn btn-danger" id="booking_btn" value="${rest.resName}으로 정했습니다." >
			      </div>
			    </div>
			  </div>
			</div>
		      <div class="bd-example">
				  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModalCenteredScrollable">
				    예약하기
				  </button>
				  <p></p>
				 <form id="f2" method="post">
					  <input type="button" id="myBooking"class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModalCenteredScrollable" value="나의 예약 현황보기">
					   <input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo}"> 
				 </form>
				</div>
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
    
    <!-- ---------------------- 리뷰에서 받아오는 -------------------------->
    


    
    
    <section class="review_section">
        <div class="review_title">방문자 리뷰
            <a href="/restaurant/user/moreReview">더 보기 >> </a>
        </div>
        <div class="review_aver">
            <span><%-- ${avgReview} --%></span>
            <span class="total_review"><%-- ${totalCount} --%></span>
            
        </div>
        <div >
        	<c:if test="${empty reviewlist}">작성된 리뷰가 없습니다.</c:if>
           
            <c:if test="${not empty reviewlist}">
            <div class="reviewbox">
            	<c:forEach var="review" items="${reviewlist}">
            	<div class="reviewmultiple">
            		<h3>${review.get("RES_NAME")}</h3>
            		<img alt="${review.get('REVIEW_ORIGIN')}" src="/restaurant/${review.get('REVIEW_PATH')}/${review.get('REVIEW_SAVED')}" class="reviewimg">
	                    <div class="review_content">
	                        <p>${review.get("REVIEW_WRITER")}</p>
	                        <div class="reviewdaterate">
		                        <span><input type="text" class="dateinput" value="${review.get('REVIEW_DATE')}"></span>
		                        <span>${review.get("REVIEW_RATE")}</span>
	                        </div>
	                        
	                        <p>${review.get("REVIEW_CONTENT")}</p>
	                    </div>
            	</div>
            	</c:forEach>
            </div>
            </c:if>
        </div>
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
		    <div class="picture_title">오시는 길</div>
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
		geocoder.addressSearch( '${rest.resAddress}'+'${rest.resAddressDetail}' , function(result, status) {
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${rest.resName}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
    </script>
    <input type="hidden" id="resNo" name="resNo" value="${restaurant.resNo}">
    <input type="hidden" id="rest" value="${rest.resAddress}">
	<input type="hidden" id="resAddress" value="${restaurant.resAddress}">
	<input type="hidden" id="resAddressDetail" value="${restaurant.resAddressDetail}">
	<input type="hidden" id="resOrigin" value="${restaurant.resOrigin}">
	<input type="hidden" id="resSaved" value="${restaurant.resSaved}">
	<input type="hidden" id="resPath" value="${restaurant.resPath}">

		
	
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>