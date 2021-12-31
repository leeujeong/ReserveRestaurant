<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="<c:url value="/resources/css/adminCSS/userDetail.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/index.js"/>"></script>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
    	$(document).ready(function() {
    		fnReturn();
    		fnAllBookList();
    		fnChangePage();
    	})
    	
    	// 전체 목록 함수 + page 전역변수
    	var page = 1;
    	// var userNo= $('#userNo');
    	var userNo = '${user.userNo}';
    	function fnAllBookList() {
    		alert(userNo);
    		$.ajax({
				url: '/restaurant/admin/userBookList?page' + page + '&userNo' + userNo,
				type: 'get',
				dataType: 'json',
				success: function(map) {
					alert(map);
					fnPrintBookList(map);
					fnPrintPaging(map.pageUtils);
				}
    		})
    	}
    	
    	// 예약목록 리스트만 출력하는 함수
    	function fnPrintBookList(map) {
    		// 페이지 처리 모든 정보를 변수 p에 저장
    		var p = map.pageUtils;
    		// 목록 만들기
    		if (p.totalRecord == 0) {
    			$('<tr rowspan="5">')
    			append( $('<td colspan="5">').text('최근 예약 식당이 없습니다.') )
    			.appendTo('#book_list');
    		} else {
	    		$('<tr>')
	    		.append( $('<td>').text(map.bookList[0].restaurant.resName) )
	    		.append( $('<td>').text(map.bookList[0].restaurant.resAddress) )
	    		.append( $('<td>').text(map.bookList[0].bookPeople) )
	    		.append( $('<td>').text(map.bookList[0].bookRequest) )
	    		.append( $('<td>').text(map.bookList[0].bookDate) )
	    		$('<tr>')
	    		.append( $('<td>').text(map.bookList[1].restaurant.resName) )
	    		.append( $('<td>').text(map.bookList[1].restaurant.resAddress) )
	    		.append( $('<td>').text(map.bookList[1].bookPeople) )
	    		.append( $('<td>').text(map.bookList[1].bookRequest) )
	    		.append( $('<td>').text(map.bookList[1].bookDate) )
	    		$('<tr>')
	    		.append( $('<td>').text(map.bookList[2].restaurant.resName) )
	    		.append( $('<td>').text(map.bookList[2].restaurant.resAddress) )
	    		.append( $('<td>').text(map.bookList[2].bookPeople) )
	    		.append( $('<td>').text(map.bookList[2].bookRequest) )
	    		.append( $('<td>').text(map.bookList[2].bookDate) )
	    		$('<tr>')
	    		.append( $('<td>').text(map.bookList[3].restaurant.resName) )
	    		.append( $('<td>').text(map.bookList[3].restaurant.resAddress) )
	    		.append( $('<td>').text(map.bookList[3].bookPeople) )
	    		.append( $('<td>').text(map.libookListst[3].bookRequest) )
	    		.append( $('<td>').text(map.bookList[3].bookDate) )
	    		$('<tr>')
	    		.append( $('<td>').text(map.bookList[4].restaurant.resName) )
	    		.append( $('<td>').text(map.bookList[4].restaurant.resAddress) )
	    		.append( $('<td>').text(map.bookList[4].bookPeople) )
	    		.append( $('<td>').text(map.bookList[4].bookRequest) )
	    		.append( $('<td>').text(map.bookList[4].bookDate) )
	    		.appendTo('#book_list')
    		}
    	}
    	
    	
    	
    	// 페이징 출력 함수
    	function fnPrintPaging(p) {
    		// 페이징 영역 초기화
    		$('#paging').empty();
    		// 1페이지로 이동
    		if (page == 1) {
    			$('<div class="disable_link">&lt;&lt;</div>').appendTo('#paging');
    			//$('<div>').addClass('disable_link').html('&lt;&lt;').appendTo('#paging');
    		} else {
    			$('<div class="enable_link" data-page="1">&lt;&lt;</div>').appendTo('#paging');
    			//$('<div>').addClass('enable_link').html('&lt;&lt;').attr('data-page', 1).appendTo('#paging');
    		}
    		// 이전 블록으로 이동
    		if (page <= p.pagePerBlock) {
    			$('<div class="disable_link">&lt;</div>').appendTo('#paging');
    		} else {
    			$('<div class="enable_link" data-page="'+(p.beginPage-1)+'">&lt;</div>').appendTo('#paging');
    		}
    		// 페이지 번호
    		for (let i = p.beginPage; i <= p.endPage; i++) {
    			if (i == page) {
    				$('<div class="disable_link now_page">'+i+'</div>').appendTo('#paging');
    			} else {
    				$('<div class="enable_link" data-page="'+i+'">'+i+'</div>').appendTo('#paging');
    			}
    		}
    		// 다음 블록으로 이동
    		if (p.endPage == p.totalPage) {
    			$('<div class="disable_link">&gt;</div>').appendTo('#paging');
    		} else {
    			$('<div class="enable_link" data-page="'+(p.endPage+1)+'">&gt;</div>').appendTo('#paging');
    		}
    		// 마지막 페이지로 이동
    		if (page == p.totalPage) {
    			$('<div class="disable_link">&gt;&gt;</div>').appendTo('#paging');
    		} else {
    			$('<div class="enable_link" data-page="'+p.totalPage+'">&gt;&gt;</div>').appendTo('#paging');
    		}
    	}  // end fnPrintPaging
    	
    	// 페이징 링크 처리 함수(전역변수 page값을 바꾸고, fnFindAllMember() 호출)
    	function fnChangePage(){
    		$('body').on('click', '.enable_link', function(){
    			page = $(this).data('page');
    			fnAllBookList();
    		});
    	}  // end fnChangePage

    	function fnReturn() {
    		$('#return_btn').click(function() {
    			location.href="/restaurant/admin/userAdminPage";
    		})
    	}
    	
    </script>
</head>
<body>
    <header>
        <div class="wrap">
            <h1>
                <a href="index.html">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
            </h1>
            <ul id="gnb">
                <li>${loginUser.id} 님 환영합니다</li>
                <li><a href="로그아웃">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
                <li><a href="/restaurant/user/myPage">MYPAGE&nbsp;&nbsp;&nbsp;</a></li>
            </ul>
        </div>
    </header>
    <section class="userInfo">
        <p>회원정보</p>
        <table class="userInfo_table">
            <tbody>
                <tr>
                    <td>회원번호</td>
                    <td>${user.userNo}</td>
                    <td>아이디</td>
                    <td>${user.id}</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>${user.name}</td>
                    <td>전화번호</td>
                    <td>${user.tel}</td>
                </tr>
                <tr>
                    <td>등급</td>
                    <td>${user.grade}</td>
                    <td>가입일</td>
                    <td>${user.userDate}</td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>${user.hbd}</td>
                    <td>포인트</td>
                    <td>${user.point}</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${user.email}</td>
                    <td>로그인 횟수</td>
                    <td>${countLog}</td>
                </tr>
            </tbody>
        </table>
        <p class="book_list">최근 예약 목록</p>
        <table class="book_table">
            <thead>
                <tr>
                    <td>식당명</td>
                    <td>주소</td>
                    <td>인원 수</td>
                    <td>요청사항</td>
                    <td>예약 일자</td>
                </tr>
            </thead>
            <tbody id="book_list"></tbody>
            <tfoot>
	            <c:if test="${not empty bookList}">
	                <tr class="paging_foot">
	                    <td colspan="5" id="paging"></td>
	                </tr>            
	            </c:if>
            </tfoot>
        </table>
    </section>
    <div class="return_btn">
        <input type="button" value="목록으로 돌아가기" class="btn" id="return_btn">
    </div>
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
                    <img src="/restaurant/resources/image/index/projectlogo.png" class="footer_logo_image">
                        </a>
                        <span class="text">Copyright</span>
                        <span class="corp" style="font-weight: 800;">&copy; FindTable Corp.</span>
                        <span class="text">All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>