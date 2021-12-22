<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" integrity="sha512-4wfcoXlib1Aq0mUtsLLM74SZtmB73VHTafZAvxIp/Wk9u1PpIsrfmTvK0+yKetghCL8SHlZbMyEcV8Z21v42UQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/owner.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/js/index.js"/>"></script>
	<script src="<c:url value="/resources/js/owner.js"/>"></script>
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
   
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="menu_nav">
                    <h4 class="menu_title">나의 사업장</h4>
                    <ul>
                        <li><a href="addstore.html" class="menu_sub_title">등록하기</a></li>
                        <li><a href="cancel.html" class="menu_sub_title"> 사업장 관리</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h4 class="menu_title">My 활동</h4>
                    <ul>
                        <li><a href="question.html">문의 내역</a></li>
                        <li><a href="review.html">리뷰 관리</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h4 class="menu_title">내 정보</h4>
                    <ul>
                        <li><a href="#">내 정보 수정</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-6">
                <div class="section2">
                    <h4 class="ing_title">사업장 등록 하기</h4>
                </div>
                <hr>
                <div class="formtable">
                    <form id="f" method="POST" enctype="multipart/form-data">
                        <table class="addtable">
                            <tbody>
		                        <tr>
		                            <td>사업장 이름</td>
		                            <td>
		                                <input type="text" name="s_name" id="s_name" placeholder="사업장 이름을 입력하세요">
		                            </td>
		                        </tr>
		                         <tr>
		                             <td>운영시간</td>
		                             <td>
		                                 <select name="open_time" id="open_time">
		                                     <option value="">--오픈 시간--</option>
		                                 </select> ~
		                                 <select name="close_time" id="close_time">
		                                     <option value="">--마감 시간--</option>
		                                     
		                                 </select>
		                             </td>
		                         </tr>
		                         <tr>
		                             <td>전화번호</td>
		                             <td>
		                                 <input type="text" name="tel" id="tel" placeholder="ex) 000-0000-0000">
		                             </td>
		                         </tr>
		                         <tr>
                                    <td> 식당위치</td>
                                    <td>
                                        <div class="inbox">
                                            <div class="cols">
                                                <select id="city1" name="city1" title="시/ 도 선택" onchange="javascript:changeAreaList(1,this);" class="select">
                                                    <option value="">-- 시 / 도 --</option>
                                                    <option value="1" title="서울특별시" selected="selected">서울특별시</option>
                                                    <option value="2" title="부산광역시">부산광역시</option>
                                                    <option value="2" title="대구광역시">대구광역시</option>
                                                    <option value="2" title="인천광역시">인천광역시</option>
                                                    <option value="2" title="광주광역시">광주광역시</option>
                                                    <option value="2" title="대전광역시">대전광역시"</option>
                                                    <option value="2" title="울산광역시">울산광역시</option>
                                                    <option value="2" title="세종특별자치시">세종특별자치시</option>
                                                    <option value="2" title="강원도">강원도</option>
                                                    <option value="2" title="충청북도">충청북도</option>
                                                    <option value="2" title="충청남도">충청남도</option>
                                                    <option value="2" title="전라북도">전라북도</option>
                                                    <option value="2" title="전라남도">전라남도</option>
                                                    <option value="2" title="경상북도">경상북도</option>
                                                    <option value="2" title="경상남도">경상남도</option>
                                                    <option value="2" title="제주특별자치도">제주특별자치도</option>
                                                </select>
                                            </div>
                                            <div>
                                                <select id="country1" name="country1" title="시/ 군/ 구 선택" onchange="javascript:changeAreaList(1,this);" class="select">
                                                    <option value="">--선택--</option>
                                                    <option value="100" title="강남구">강남구</option>
                                                    <option value="101" title="강동구">강동구</option>
                                                    <option value="102" title="강북구">강북구</option>
                                                    <option value="103" title="강서구">강서구</option>
                                                    <option value="104" title="관악구">관악구</option>
                                                    <option value="105" title="광진구">광진구</option>
                                                    <option value="106" title="구로구">구로구</option>
                                                    <option value="107" title="금천구">금천구</option>
                                                    <option value="108" title="노원구">노원구</option>
                                                    <option value="109" title="도봉구">도봉구</option>
                                                    <option value="110" title="동대문구">동대문구</option>
                                                    <option value="111" title="동작구">동작구</option>
                                                    <option value="112" title="마포구">마포구</option>
                                                    <option value="113" title="서대문구">서대문구</option>
                                                    <option value="114" title="서초구">서초구</option>
                                                    <option value="115" title="성동구">성동구</option>
                                                    <option value="116" title="성북구">성북구</option>
                                                    <option value="117" title="송파구">송파구</option>
                                                    <option value="118" title="영등포구">영등포구</option>
                                                    <option value="119" title="용산구">용산구</option>
                                                    <option value="120" title="은평구">은평구</option>
                                                    <option value="121" title="종로구">종로구</option>
                                                    <option value="122" title="중구">중구</option>
                                                    <option value="123" title="중랑구">중랑구</option>
                                                </select>
                                            </div>
                                            <div>
                                                <input type="text" id="detail_town" name="detail_town" placeholder="상세주소를 입력하세요">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
		                          <tr>
		                              <!--다중사진 등록가능-->
		                              <td>사진 등록</td>
		                              <td>
		                                  <input type="file" name="s_file" id="s_file" multiple>
		                                  <div id="upload_result"></div>
		                              </td>
		                           </tr>
		                             <tr>
		                                 <td>메뉴 등록하기</td>
		                                 <td class="menu">
		                                     <div class="menu_input">
		                                         <div class="menu_input_box default">
		                                             <input type="text" name="s_menu1" id="s_menu1" placeholder="메뉴명"/><input type="text" name="s_price1" id="s_price1" placeholder="가격 (원)"/>
		                                         </div>
		                                     </div>
		                                     <button class="plus_btn">
		                                         <i class="far fa-plus-square" ></i>
		                                     </button>
		                                 </td>
		                             </tr>
		                             <tr>
		                                 <td>추가 옵션</td>
		                                 <td>
		                                     <input type="checkbox" name="corkage" id="corkage">
		                                     <label for="corkage">콜키지</label>
		                                     <input type="checkbox" name="night" id="night">
		                                     <label for="night">심야 영업</label>
		                                     <input type="checkbox" name="babyseat" id="babyseat">
		                                     <label for="babyseat">아기 의자</label>
		                                     <input type="checkbox" name="nokids" id="nokids">
		                                     <label for="nokids">노 키즈존</label><br>
		                                     <input type="checkbox" name="group" id="group">
		                                     <label for="group">단체석</label>
		                                     <input type="checkbox" name="parking" id="parking">
		                                     <label for="parking">주차 가능</label>
		                                     <input type="checkbox" name="wifi" id="wifi">
		                                     <label for="wifi">와이파이</label>
		                                 </td>
		                             </tr>
		                             <tr>
		                                 <td>상세 설명</td>
		                                 <td><textarea rows="5" cols="44" placeholder="상세 설명을 입력하세요"></textarea></td>
		                             </tr>
	                            </tbody>
	                            <tfoot>
	                                <tr>
	                                    <td colspan="2">
	                                        <input type="submit" value="사업장 등록하기" class="add_btn">
	                                    </td>
	                                </tr>
                            </tfoot>

                        </table>
                    </form>
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