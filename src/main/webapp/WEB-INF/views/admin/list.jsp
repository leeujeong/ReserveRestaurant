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
    <section class="result_section">
        <p class="comment">총 ${totalRecord}명의 회원이 검색되었습니다.</p>
        <table class="result_table">
            <thead>
                <tr>
                    <td>회원번호</td>
                    <td>아이디</td>
                    <td>이름</td>
                    <td>상태</td>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty list}">
    	        	<c:forEach var="owner" items="${ownerList}">
    	        		<tr>
    	        			<td>${owner.ownerNo}</td>
    	        			<td>
    	        				<a href="/restaurant/admin/ownerDetailPage?ownerNo=${owner.ownerNo}">${owner.id}</a>
    	        			</td>
    	        			<td>${owner.name}</td>
    	        			<td>${owner.state}</td>
    	        		</tr>
    	        	</c:forEach>
    	        	<c:if test="${not empty paging}">
	            		<tfoot>
			                <tr>
			                    <td colspan="4">${paging}</td>
			                </tr>
	            		</tfoot>
            		</c:if>
            	</c:if>
            	<c:if test="${empty ownerList}">
            		<c:forEach var="user" items="${list}">
	            		<tr>	        
	            			<td>${user.userNo}</td>    		
	            			<td>
	            				<a href="/restaurant/admin/userDetailPage?userNo=${user.userNo}">${user.id}</a> 
	            			</td>
							<td>${user.name}</td>
							<td>${user.state}</td>
	            		</tr>
            		</c:forEach>
            		<c:if test="${not empty paging}">
	            		<tfoot>
			                <tr>
			                    <td colspan="4">${paging}</td>
			                </tr>
	            		</tfoot>
            		</c:if>
            	</c:if>
            	
            </tbody>
        </table>
    </section>
</body>
</html>