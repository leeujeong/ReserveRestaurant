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
    	})
    	
    	
    	
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
            <tbody>
            <c:if test="${not empty bookList}">
                <tr>
                    <td>${bookList[0].restaurant.resName }</td>
                    <td>${bookList[0].restaurant.resAddress}&nbsp;${bookList[0].restaurant.resAddressDetail}</td>
                    <td>${bookList[0].bookPeople}</td>
                    <td>${bookList[0].bookRequest}</td>
                    <td>${bookList[0].bookDate}<span class="book_time">${bookList[0].bookHours}</span></td>
                </tr>
                <tr>
                    <td>${bookList[1].restaurant.resName }</td>
                    <td>${bookList[1].restaurant.resAddress}&nbsp;${bookList[1].restaurant.resAddressDetail}</td>
                    <td>${bookList[1].bookPeople}</td>
                    <td>${bookList[1].bookRequest}</td>
                    <td>${bookList[1].bookDate}<span class="book_time">${bookList[1].bookHours}</span></td>
                </tr>
                <tr>
                    <td>${bookList[2].restaurant.resName }</td>
                    <td>${bookList[2].restaurant.resAddress}&nbsp;${bookList[2].restaurant.resAddressDetail}</td>
                    <td>${bookList[2].bookPeople}</td>
                    <td>${bookList[2].bookRequest}</td>
                    <td>${bookList[2].bookDate}<span class="book_time">${bookList[2].bookHours}</span></td>
                </tr>
                <tr>
                    <td>${bookList[3].restaurant.resName }</td>
                    <td>${bookList[3].restaurant.resAddress}&nbsp;${bookList[3].restaurant.resAddressDetail}</td>
                    <td>${bookList[3].bookPeople}</td>
                    <td>${bookList[3].bookRequest}</td>
                    <td>${bookList[3].bookDate}<span class="book_time">${bookList[3].bookHours}</span></td>
                </tr>
                <tr>
                    <td>${bookList[4].restaurant.resName }</td>
                    <td>${bookList[4].restaurant.resAddress}&nbsp;${bookList[4].restaurant.resAddressDetail}</td>
                    <td>${bookList[4].bookPeople}</td>
                    <td>${bookList[4].bookRequest}</td>
                    <td>${bookList[4].bookDate}<span class="book_time">${bookList[4].bookHours}</span></td>
                </tr>
            </c:if>
            <c:if test="${empty bookList}">
            	<tr rowspan="5">
            		<td colspan="5" class="notBook">최근 예약 식당이 없습니다.</td>
            	</tr>
            </c:if>
            </tbody>
            <tfoot>
	            <c:if test="${not empty bookList}">
	                <tr class="paging_foot">
	                    <td colspan="5">${paging}</td>
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