<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<link href="<c:url value="/resources/css/userCSS/qnainsert.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/js/userJS/qnainsert.js"/>"></script>





    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>Document</title>
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

<!-------------------------------------------------------------------------------------------------------->

   <section class="review_aver_section">
   <div class="review_detail">
       <p><span>🌠&nbsp;Q&A 작성하기&nbsp;🌠</span></p><br><br><br>
   </div>
   <!-- 로그인된 사용자가 아니라면 로그인창으로 돌려줌 -->
    <form action="/restaurant/qnaboard/insertBoardQna" method="post">
        <!-- 
        <input type="hidden" name="bdGroup" value="bdGroup">
        <input type="hidden" name="bdOrder" value="bdOrder">
        <input type="hidden" name="bdIndent" value="bdIndent">
        -->
        <input type="text" name="qnaWriter" class="form-control mt-4 mb-2" placeholder="작성자를 적어주세요." required><br><br>
        <input type="text" name="qnaTitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required><br><br>
 		<div class="form-group">
		<textarea class="form-control" rows="10" name="qnaContent"
                placeholder="내용을 입력해주세요" required>
           </textarea>
		</div>
				
          <!--  
           <div class="form-group">
          
           <textarea class="summernote" style="width: 100%; height:412px;" 
                        class="form-control" rows="3" name='qnaContent'></textarea>
          
          <textarea class="form-control" rows="10" name="qnaContent"
                placeholder="내용을 입력해주세요" required>
           </textarea>
           
           </div>
          -->  
 
        <button type="submit" class="btn btn-secondary mb-3">작성완료</button>
        <button type="button" class="btn btn-secondary mb-3" onclick="location.href='/restaurant/qnaboard/qnalist'">목록으로 돌아가기</button>
    </form>

   </section>

<!-------------------------------------------------------------------------------------------------------->
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