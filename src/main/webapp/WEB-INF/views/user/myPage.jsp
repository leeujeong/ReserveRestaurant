<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/userCSS/myPage.css"/>" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                <li><a href="사용자페이지이동">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
                <li><a href="호스트로그인페이지이동">HOSTLOGIN</a></li>
                <li><a href="회원가입페이지이동">JOIN</a></li>
                <li><a href="찜목록페이지">FAVORITE</a></li>
                <li><a href="/restaurant/user/myPage">MYPAGE</a></li>
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
                        <li><a href="/restaurant/user/updateUser">내 정보 수정</a></li>
                        <li><a href="#"> 본인 인증 / 재인증</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="col-6">
                 
                <div>
                    <h2 class="ing_title">진행중인 예약</h2>
                </div>
                <hr>
                <div class="ing_menu">
                    <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="# ">승인 결제</a></li>
                        <li><a href="# ">실시간 결제</a></li>
                    </ul>
                </div> 
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
            
                 
                <!-- 완료
                   <div>
                       <h2 class="ing_title">완료된 예약</h2>
                   </div>
                   <hr>
                   <table>
                        <tbody>
                        <c:forEach var="reserve" items="endReserve">
                           <tr>
                              <td>
                                 <div id="paging"></div>
                              </td>
                           </tr>
                        </c:forEach>
                        </tbody> 
                  </table>
                 
                 --> 
                 
                <!-- 취소/ 환불
                   <div>
                       <h2 class="ing_title">취소 / 환불</h2>
                   </div>
                  <div class="ing_menu">
                       <ul>
                           <li><a href="#">취소</a></li>
                           <li><a href="# ">환불</a></li>
                       </ul>
                   </div> 
                   <table>
                        <tbody>
                        <c:forEach var="reserve" items="cancleReserve">
                           <tr>
                              <td>
                                 <div id="paging"></div>
                              </td>
                              <td>
                                 <input type="button" value="취소하기" id="cancle_btn"> //취소하면 바로 환불?
                              </td>
                           </tr>
                        </c:forEach>
                        </tbody> 
                  </table>
                 
                 -->
                
                  <!--
                <div>
                    <h2 class="ing_title">내 정보 수정</h2>
                </div>
                <hr>
                <div class="ing_menu">
                    <ul>
                        <li><a href="#">정보 수정</a></li>
                        <li><a href="# ">본인인증 / 재인증</a></li>
                    </ul>
                </div> 
                <div>
                   <form id="f" method="post">
                      <input type="hidden" name="no" id="no" value="${loginUser.no}">
                      <input type="hidden" name="id" id="id" value="${loginUser.id}">
                      <div class="myInfo">
                         회원번호 : ${loginUser.no}<br><br>
                         
                         아이디: ${loginUser.id}<br><br>
                         
                     이름<br>
                     <input type="text" name="name" id="name" value="${loginUser.name}"><br><br>
                     
                     현재 비밀번호<br>
                     <input type="password" name="pw0" id="pw0" placeholder="현재비밀번호를 입력하세요"><br>
                     
                     새 비밀번호<br>
                     <input type="password" name="pw" id="pw" placeholder="변경할비밀번호를 입력하세요"><br>
                     <span id="pw_result"></span><br>
                     
                     비밀번호 확인<br>
                     <input type="password" name="pw2" id="pw2" placeholder="변경할 비밀번호를 한번더 입력하세요">
                     <span id="pw2_result"></span><br>
   
                     이메일<br>
                     <input type="text" name="email" id="email" value="${loginUser.email}"><br>
                     
                     <input type="button" value="수정하기" id="updatePw_btn" ><br>
                      </div>
                   </form>
                
                </div>
                 내정보 수정 -->    
                    
                 
                
                <div>
                    <div class="empty_box">
                        <img class="empty_img" src="/restaurant/resources/image/myPage/mangirl.png " width="200px" height="200px" alt="빈사진 ">
                    </div>
                    <div class="empty_comment">
                           예약이 비어있습니다.
                    </div>
                </div>
              
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