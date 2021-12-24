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
<script>
	$(document).ready(function() {
		fnArea();
		fnInit();	
		fnFind();
	})
	
	// 검색 초기화 함수
	function fnInit() {
		$('#column').val('');
		$('#query').val('');	
	}
	
	// 검색 화면 세팅 함수
	function fnArea() {
		$('#first_area').css('display', 'none');
		$('#second_area').css('display', 'none');
		
		
		
	}
	
	
	// 검색 함수
	function fnFind() {
		$('#search_btn').click(function() {
			if ($('#column').val() == '') {
				alert('검색 카테고리를 선택하세요');
			}
			if ($('#query').val() == '') {
				alert('검색어를 입력하세요');
			}
			var column = $('#column').val();
			var query = $('#query').val();
			$.ajax({
				url: '',
				type: 'get',
				data: 'column=' + column + 'query=' + query,
				dataType: 'json',
				success: function() {
					
				},
				error:function() {
					
				}
			})
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
                <li><a href="사용자페이지이동">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
                <li><a href="호스트로그인페이지이동">HOSTLOGIN</a></li>
                <li><a href="회원가입페이지이동">JOIN</a></li>
                <li><a href="찜목록페이지">FAVORITE</a></li>
                <li><a href="마이페이지이동">MYPAGE</a></li>
            </ul>
        </div>
    </header>
    <section class="menu">
        <p>회원 검색</p>
        <form>
        	<select>
        		<option>일반회원</option>
        		<option>host회원</option>
        	</select>
        	<span id="first_area">
		        <select name="column" id="column">
		        	<option value="">선택</option>
		            <option value="NAME">이름</option>
		            <option value="AGE">나이</option>
		            <option value="GRADE">등급</option>
		        </select>
        	</span>
        	<span id="second_area">
		        <input type="text" name="query" id="query">
		        <input type="button" value="검색" id="search_btn">
        	</span>
        </form>
    </section>
    <section class="list_section">
    	<table>
    		<thead>
    			<tr>
    				<td>회원번호</td>
    				<td>이름</td>
    				<td>아이디</td>
    				<td>등급</td>
    				<td>이메일</td>
    				<td>가입일</td>
    			</tr>
    		</thead>
    		<tbody id="user_info"></tbody>
    	</table>
    
    
    </section>

</body>
</html>