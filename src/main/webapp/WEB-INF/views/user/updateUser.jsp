<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/userCSS/updateUser.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <style>
 
 		a {
		    text-decoration: none;
		    color: inherit;
		}
    </style>
   
    
</head>
<body>
  
      <header>
        <div class="wrap">
            <h1 id="header_h1">
                <a href="/restaurant">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
            </h1>
            <ul id="gnb"> 
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
            		  <li>${loginUser.id} 님 환영합니다</li>
            		  <li><a href="/restaurant/admin/myPage">ADMIN PAGE</a></li>
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
       
   
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="menu_nav">
                    <h2 class="menu_title">예약내역</h2>
                    <ul>
                        <li><a href="ingReserve" class="menu_sub_title">진행중</a></li>
                        <li><a href="endReserve" class="menu_sub_title"> 완료</a></li>
                        <li><a href="cancleReserve" class="menu_sub_title">취소 / 환불</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h2 class="menu_title">My 활동</h2>
                    <ul>
                        <li><a href="#">문의 내역</a></li>
                        <li><a href="#">My 관심상품</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h2 class="menu_title">내 정보</h2>
                    <ul>
                        <li><a href="#">내 정보 수정</a></li>
                        <li><a href="#"> 본인 인증 / 재인증</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="col-6">
                 
                <div>
                    <h2 class="ing_title">개인 정보</h2>
                </div>
                <hr>
                <form id="f" method="post">
                	<input type="hidden" name="no" id="no" value="${loginUser.userNo}">
                	<input type="hidden" name="id" id="id" value="${loginUser.id}">
	      
	               	 <div class="input_row">
	                       <div class="icon_cell">
	                           <span class="icon_id">
	                               <span style="display: none;">아이디</span>
	                           </span>
	                       </div>
	                     <div class="input_text">
	                    	 ${loginUser.id}
	                     </div>
	                 </div>
	                 
	               	 <div class="input_row">
	               	 
	                     <div class="input_text">
	                    	 이름 : ${loginUser.name}
	                     </div>
	                 </div>
	               	 <div class="input_row">
	                       <div class="icon_cell1">
	                           		 <div class="input_text">
				                    	<i class="fas fa-phone-alt"></i>
				                     </div>
	                               <span style="display: none;">전화번호</span>
	                       </div>
	                     <div class="input_text">
	                    	 <input id="input_text" type="text" name="user_tel" id="user_tel" value="${loginUser.tel}"/>
	                     </div>
	                 </div>
	                 
	               	 <div class="input_row">
	                       <div class="icon_cell1">
	                           		 <div class="input_text">
				                    	<i class="far fa-envelope-open"></i>
				                     </div>
	                               <span style="display: none;">이메일</span>
	                       </div>
	                     <div class="input_text">
	                    	 ${loginUser.email}
	                     </div>
	                 </div>
	                 
	               	 <div class="input_row">
	                       <div class="icon_cell1">
	                           <div class="input_text">
			                    	<i class="fas fa-birthday-cake"></i>
				                </div>
	                               <span style="display: none;">생일</span>
	                       </div>
	                     <div class="input_text">
	                    	 ${loginUser.hbd}
	                     </div>
	                 </div>
	               	 <div class="input_row">
	                       <div class="icon_cell1">
	                           <div class="input_text">
			                    	<i class="far fa-star"></i>
				                </div>
	                               <span style="display: none;">등급</span>
	                       </div>
	                     <div class="input_text">
	                    	 ${loginUser.grade}
	                     </div>
	                 </div>
	               	 <div class="input_row">
	                       <div class="icon_cell1">
	                           <div class="input_text">
			                    	<i class="fas fa-coins"></i>
				                </div>
	                               <span style="display: none;">포인트</span>
	                       </div>
	                     <div class="input_text">
	                    	 ${loginUser.point}
	                     </div>
	                 </div>
	               		
	               	 <div class="input_row">
	                       <div class="icon_cell1">
	                            <div class="input_text">
			                    	<i class="far fa-calendar-alt"></i>
				                </div>
	                               <span style="display: none;">가입일</span>
	                       </div>
	                     <div class="input_text">
	                    	 ${loginUser.userDate}
	                     </div>
	                 </div>
                	
	               	 <div class="input_row">
	                     <div class="input_text">
	                    	현재비밀번호 :&nbsp;<input class="input_text" type="password" name="pw0" id="pw0">
	                     </div>
	                 </div>
	               	 <div class="input_row">
	                     <div class="input_text">
	                    	비밀번호확인 :&nbsp;<input class="input_text" type="password" name="pw" id="pw">
	                     </div>
	                 </div>
	               	 <div class="input_row">
	                     <div class="input_text">
	                    	새 비밀번호 :&nbsp;<input class="input_text" type="password" name="pw2" id="pw2">
	                     </div>
	                 </div>
                	<input type="button" value="회원정보변경하기" id="updateMember_btn">
                	<input type="button" value="초기화" id="초기화">
                	<input type="button" value="탈퇴하기" id="updateMember_btn">
                </form>
                
           
                <table>
                     <tbody>
                     <c:forEach var="reserve" items="ingReserve">
                        <tr>
                           <td>
                              <div id="paging"></div>
                           </td>
                        </tr>
                     </c:forEach>
                     </tbody> 
               </table>
              
            </div>
        </div>
        
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
</body>
</html>