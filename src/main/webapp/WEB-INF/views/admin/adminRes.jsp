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
<link href="<c:url value="/resources/css/adminCSS/adminRes.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/index.js"/>"></script>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	$(document).ready(function() {
		fnResList();
		
	})

	function fnResList() {
		$.ajax({
			url: '/restaurant/admin/selectResList',
			type: 'get',
			dataType: 'json',
			success: function() {
				
			}
		})
	} // end fnResList()
	
	
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
    <section class="res_section">
        <div class="xx">
            <span class="res_title">식당 목록</span>
            <div class="comment_box">
                <span class="res_comment">총 00개의 사업장이 등록되어있습니다</span>
            </div>
        </div>
        <table class="res_list_table">
            <thead>
                <tr>
                    <td>이름</td>
                    <td>주소</td>
                    <td>영업시간</td>
                    <td>전화번호</td>
                </tr>
            </thead>
            <tbody id="tbody"></tbody>
            <tfoot>
                <tr>
                    <td colspan="4" id="paging"></td>
                </tr>
            </tfoot>
        </table>
    </section>
</body>
</html>