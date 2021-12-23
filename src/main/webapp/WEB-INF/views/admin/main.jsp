<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/adminCSS/main.css"/>" rel="stylesheet">
</head>
<body>
    <h1>관리자 전용 페이지</h1>
    <div class="go">
        <div class="admin">
            <div class="admin_user">
                <p>회원 관리</p>
            </div>
            <div class="admin_rest">
                <p>식당 관리</p>
            </div>
        </div>
			<div class="go_mainPage">
	    		<a href="/restaurant/main/mainPage">메인페이지 이동</a>
		    </div>
	    </div>
	
</body>
</html>