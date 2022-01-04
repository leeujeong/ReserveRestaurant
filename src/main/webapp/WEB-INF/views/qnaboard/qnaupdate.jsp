<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!-- %@ include file="bootstrap.jsp" %> -->
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> 
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



	<link href="<c:url value="/resources/css/userCSS/qnadetail.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/js/userJS/qnadetail.js"/>"></script>


    <title>Document</title>
<!-- 
%    
    String qnaNo = request.getParameter("qnaNo");        
%
<c:set var="qnaNo" value="%=qnaNo%>"/>  게시글 번호
-->
</head>
<!-- QnA게시판은 사용자가 게시글을 올리고 관리자가 댓글을 다는 방향  -->
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
                   <li><a href="/restaurant/user/loginPage">LOGIN</a></li>
                   <li>/</li>
                   <li><a href="/restaurant/user/join">JOIN&nbsp;&nbsp;&nbsp;</a></li>
               </c:if>
               
       
               <c:if test="${loginUser.state == 1}">
                     <li>${loginUser.id} 님 환영합니다</li>
                    <li><a href="/restaurant/user/logout">LOGOUT</a></li>
                    <li>/</li>
                    <li><a href="/restaurant/user/myPage">MYPAGE&nbsp;&nbsp;&nbsp;</a></li>
               </c:if>
               
         
               <c:if test="${loginUser.state == 2}">
                    <li>${loginUser.id} 님 환영합니다</li>
                    <li><a href="/restaurant/admin/myPage">ADMIN PAGE</a></li>
               </c:if>
               
           
              <c:if test="${loginUser.state == 3}">
                    <li>${loginUser.id} 님 환영합니다&nbsp;&nbsp;&nbsp;/</li>
                    <li><a href="/restaurant/owner/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
                    <li><a href="/restaurant/owner/managePage">OWNER PAGE</a></li>
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
          <ul>
              <li><a href="식당검색페이지"> 식당 검색  </a></li>
              <li><a href="식당검색페이지"> 할인 되는 식당</a></li>
              <li><a href="식당검색페이지"> 신규 오픈 </a></li>
          </ul>
      </div>
      <div class="cate quickmenu">
          <span class="menu"> 
              <a href="#" class="menulink">Board</a>
              <a href="javascript:void(0);" class="subopen"></a>
          </span>
          <ul>
              <li><a href="공지사항"> 공지사항 </a></li>
              <li><a href="리뷰"> 리뷰 </a></li>
              <li><a href="/restaurant/qnaboard/qnalist"> Q&A </a></li>
          </ul>
      </div>
      <div class="cate quickmenu">
          <span class="menu">
              <a href="#" class="menulink">Magazines</a>
              <a href="javascript:void(0);" class="subopen"></a>
          </span>
          <ul>
              <li>다이닝 매거진</li>
          </ul>
      </div>
  </div>

   <section class="review_aver_section">
         <div class="review_detail">
             <p><span>📝&nbsp;QnA 게시글&nbsp;📝</span></p><br><br><br>
         </div>
   </section>   
	
	 <section class="review_section">
      <div class="container">
      <div class="row">
	<!-- 
		<button type="button" class="btn btn-primary" onclick="location.href='/qnaboard/qnaupdate/${qnadetail.qnaNo}'">수정</button> 
		<button type="button" class="btn btn-danger" onclick="location.href='/qnaboard/${qnadetail.qnaNo}'">삭제</button>  
		<button type="button" class="btn btn-secondary mb-3" onclick="location.href='/restaurant/qnaboard/qnalist'">목록</button>
	 -->
		 <table class="board_view">
		 <colgroup> 
		 <col width="15%"/>
		 <col width="35%"/> 
		 <col width="15%"/>

		 
		 <tbody> 
		 <tr> 
		 <th scope="row">글 번호</th>
		 <td>${qna.qnaNo}</td> 
		 
		  
		 <th scope="row">조회수</th> 
		 <td>${qna.qnaHit}</td>
		 </tr>
		 
		 <tr> 
		 <th scope="row">작성일</th>
		 <td>${qna.qnaDate}</td> 
		 
		  
		 <th scope="row">최종수정일</th> 
		 <td>${qna.qnaLastModified}</td>
		 </tr>
		 
		 <tr>
		 <th scope="row">작성자</th> 
		 <td colspan="5">${qna.qnaWriter}</td> 
		 <tr>
         </tbody>
          </table>
	<form id="f" method="post" action="/restaurant/qnaboard/updateBoardQna">
       <label>제목</label>
       <input class="form-control mt-4 mb-2" type="text" name="qnaTitle" id="qnaTitle" value="${qna.qnaTitle}"><br><br>
       <div class="form-group">
       <textarea class="summernote" placeholder="수정할 내용을 입력해주세요" name="qnaContent" id="summernote">${qna.qnaContent}</textarea><br><br>
       </div>
       <input type="hidden" name="qnaNo" value="${qna.qnaNo}" id="qnaNo">
       <c:if test="${loginUser.id == qna.qnaWriter}">
	       <button class="btn btn-primary" value="수정" id="update_btn">수정</button>
	       <!-- <input type="button" class="btn btn-primary" value="수정" id="update_btn"> -->
	       <input type="button" class="btn btn-danger" value="삭제" id="delete_btn">
       </c:if>
       <input type="button" class="btn btn-secondary mb-3"  value="목록" onclick="location.href='/restaurant/qnaboard/qnalist'">
    </form>
    
      <!-- 
       <button type="button" class="btn btn-primary" onclick="location.href='/qnaboard/qnaupdate/${qnadetail.qnaNo}'">수정</button> 
 	   <button type="button" class="btn btn-danger" onclick="location.href='/qnaboard/${qnadetail.qnaNo}'">삭제</button>  
       <button type="button" class="btn btn-secondary mb-3" onclick="location.href='/restaurant/qnaboard/qnalist'">목록</button>
         <br><br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="location.href='/qnaboard/qnaupdate/${qnadetail.qnaNo}'">수정</button> 
		 				               <button type="button" class="btn btn-danger" onclick="location.href='/qnaboard/${qnadetail.qnaNo}'">삭제</button>  
									   <button type="button" class="btn btn-secondary mb-3" onclick="location.href='/restaurant/qnaboard/qnalist'">목록</button>
	  -->
            </div>
         </div>

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

</body>
</html>
				  <!-- 	
		 </tbody> 
		 </table>
		 <div style="width: 60%; margin: auto;">
	     <form method="post" action="/modify" >
		 <input type="hidden" name=qnaNo value="${qnaBoardDetail.qnaNo}">
		 <br><br> 
		 <textarea id="summernote" name="content"></textarea>
		 <input id="subBtn" type="button" value="글 수정" style="float: right;" onclick="goModify(this.form)"/>
	     </form>
		                <table width="100%" class="table01">
		                    <colgroup>
		                        <col width="15%">
		                        <col width="35%">
		                        <col width="15%">
		                        <col width="*">
		                    </colgroup>
		                    <tbody id="tbody">
		                    </tbody>
		                 </table>     
		                  <input type="hidden" id="qnaNo"        name="qnaNo"    value="${qnaNo}"/> 
		                  <input type="hidden" id="search_type"    name="search_type"     value="S"/>
							<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
							<input type="hidden" name="qnaWriter" value="${qna.qnaWriter}">
							<input type="hidden" name="qnaTitle" value="${qna.qnaTitle}">
							<input type="hidden" name="qnaContent" value="${qna.qnaContent}">
							<input type="hidden" name="qnaHit" value="${qna.qnaHit}"> 
							<input type="hidden" name="qnaDate" value="${qna.qnaDate}"> 
							<input type="hidden" name="qnaLastModified" value="${qna.qnaLastModified}"> 
							
									글 번호<br>
									${qna.qnaNo}<br><br>
									
									작성자<br>
									${qna.qnaWriter}<br><br>
									
									작성일<br>
									${qna.qnaDate}<br><br>
									
									수정일<br>
									${qna.qnaLastModified}<br><br>
									
									조회수<br>
									${qna.qnaHit}<br><br>
									
		            <form id="boardForm" name="boardForm">        
		            
					제목<br>
					<input type="text" name="qnaTitle" id="qnaTitle" value="${qnaBoardDetail.qnaTitle}"><br><br>
					
					내용<br>
					<input type="text" name="qnaContent" id="qnaContent" value="${qnaBoardDetail.qnaContent}"><br><br>
							
		            </form>
		 <tr> 
		 <th scope="row">제목</th> 
		 <td colspan="5">${qnaBoardDetail.qnaTitle}</td> 
		 </tr> 
		 
		 <tr> 
		 <td colspan="4">${qnaBoardDetail.qnaContent}</td> 
		 </tr> 
				   -->	 


