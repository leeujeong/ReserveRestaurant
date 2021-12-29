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
<link href="<c:url value="/resources/css/adminCSS/adminUser.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/index.js"/>"></script>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
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
	 <section class="search_section">
        <div class="search_box">
            <p class="user_search">회원 상세 페이지</p>
            
            회원 번호 : ${owner.ownerNo}<br>
            아이디 : ${owner.id}<br>
            이름 : ${owner.name}<br>
            전화번호 : ${owner.tel}<br>
            이메일 : ${owner.email}<br>
        </div>
        <div>
        	<table>
        		<thead>
        			<tr>
        				<td>식당명</td>
        				<td>주소</td>
        				<td>영업시간</td>
        				<td>전화번호</td>
        			</tr>
        		</thead>
        		<tbody>
        		<c:if test="${empty restList}">
					<tr>
						<td colspan="4">등록된 사업장이 없습니다.</td>
					</tr>        		
        		</c:if>
        		<c:if test="${not empty restList}">
        			<c:forEach var="restaurant" items="${restList}">
        				<tr>
        					<td>${restaurant.resName}</td>
        					<td>${restaurant.resAddress} ~ ${restaurant.resAddressDetail}</td>
        					<td>${restaurant.resOpenTime} ~ ${restaurant.resCloseTime}</td>
        					<td>${restaurant.resTel}</td>
        				</tr>
        			</c:forEach>
        		</c:if>
        		</tbody>
        	</table>
        </div>
    </section>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>