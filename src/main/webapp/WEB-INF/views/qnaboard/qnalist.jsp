<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<link href="<c:url value="/resources/css/userCSS/qnalist.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/js/userJS/qnalist.js"/>"></script>
    <meta charset="UTF-8">
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
       <p><span>💡&nbsp;Q&A&nbsp;💡</span></p><br><br><br>
   </div>
   </section>

   <section class="review_section">
      <div class="container">
         <div class="row">
              
            <div>
               <div class="col-md-3">
                  <form action="/restaurant/qnaboard/selectQnaBoardList" method="get">
                      <div class="input-group">             
                          <input class="form-control" id="system-search" name="q" placeholder="제목 검색" required>
                          <span class="input-group-btn">
                              <button type="submit" class="btn btn-default">🍳</button><br><br><br>
                           </span>
                      </div>
                  </form>
              </div>
              <table class="table table-list-search">
                  <thead>
                     <tr>
	                     <th>글 번호</th>
	                     <th>작성자</th>
	                     <th>제목</th>
	                     <th>조회수</th>
	                     <th>등록일</th>
	                     <th>최종수정일</th>
                     </tr>
                  </thead>
                  <tbody>
                    <c:if test="${empty list}">
                    <td colspan="6">작성된 Q&A 없음</td>
                    </c:if>
                  <c:if test="${not empty list}">   
                      <c:forEach var="qnaboard" items="${list}"> 
                     <tr>
                           <td>${qnaboard.qnaNo}</td>
                           <td>${qnaboard.qnaWriter}</td>
                           <td><a href="selectQnaBoardByNo?qnaNo=${qnaboard.qnaNo}">${qnaboard.qnaTitle}</a></td>
                           <td>${qnaboard.qnaHit}</td>
                           <td>${qnaboard.qnaDate}</td>
                           <td>${qnaboard.qnaLastModified}</td>
                     </tr>
                    </c:forEach>
                   </c:if>                    
                  </tbody>
              </table>   
                      <!-- 작성하기 버튼 -->
                <div class="btn-wrap">
                  <div class="btn-area">
                  <c:if test="${not empty loginUser}">
	                  <button type="button" id="qnaIn" class="start" id="btn-1">작성하기</button>
                  </c:if>
                  </div>
                </div>
            </div> 
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
	<script>
		function fninsertPage() {
			$('#qnaIn').click(function(){
				location.href="/restaurant/qnaboard/insertPage";
			});
		}
	</script>
</html>


<!-- $(document).ready(function(){
		fninsertPage();
	});
	-->
	<!-- 
	      /* 게시판 */
      $(document).ready(function() {
         var activeSystemClass = $('.list-group-item.active');

         //something is entered in search form
         $('#system-search').keyup( function() {
            var that = this;
            // affect all table rows on in systems table
            var tableBody = $('.table-list-search tbody');
            var tableRowsClass = $('.table-list-search tbody tr');
            $('.search-sf').remove();
            tableRowsClass.each( function(i, val) {
            
               //Lower text for case insensitive
               var rowText = $(val).text().toLowerCase();
               var inputText = $(that).val().toLowerCase();
               if(inputText != '')
               {
                     $('.search-query-sf').remove();
                     tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                        + $(that).val()
                        + '"</strong></td></tr>');
               }
               else
               {
                     $('.search-query-sf').remove();
               }

               if( rowText.indexOf( inputText ) == -1 )
               {
                     //hide rows
                     tableRowsClass.eq(i).hide();
                     
               }
               else
               {
                     $('.search-sf').remove();
                     tableRowsClass.eq(i).show();
               }
            });
            //all tr elements are hidden
            if(tableRowsClass.children(':visible').length == 0)
            {
               tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
            }
         });
      });

      
               /* 작성하기 */

               $(document).ready(function(){
                  function typeWriter(text, n) {
               if (n < (text.length)) {
               $('.test').html(text.substring(0, n+1));
               n++;
               setTimeout(function() {
               typeWriter(text, n)
               }, 100);
               }
               }

               $('.start').click(function(e) {
               e.stopPropagation();

               var text = $('.test').data('text');

               typeWriter(text, 0);
               });

               });
               $(document).ready(function(){
                  $(".que-list>li").css({"display": "none"});
                     $(".start").click(function(){
                     $(".que-list>li").fadeIn(800);
                        $(this).siblings('button').hide();               
                        $(".start").animate({marginLeft: "+=150px", marginTop: "-=100px"});
                        $(".start").css({"position": "fixed", top: "200px"});
                  });
               
               });        -->

