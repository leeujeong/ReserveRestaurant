<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/userCSS/search.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/userJS/search.js"/>" rel="stylesheet">
 <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" integrity="sha512-4wfcoXlib1Aq0mUtsLLM74SZtmB73VHTafZAvxIp/Wk9u1PpIsrfmTvK0+yKetghCL8SHlZbMyEcV8Z21v42UQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</head>
<body>
	
	
    <section class="search_btn_section">
        <div class="search_btn" name="location" id="location" value="1">지역&nbsp;&nbsp;<i class="fas fa-chevron-down"></i></div>
        <label><div class="search_btn date" name="date" id="date"><input type="text" class="datepicker dateInput" value="날짜" id="dateInput" name="dateInput" readonly><i class="fas fa-chevron-down"></i></div></label>
        <div class="search_btn" name="price_person" id="price_person">가격/인원&nbsp;&nbsp;<i class="fas fa-chevron-down"></i></div>
        <!-- <div class="search_btn" name="person" id="person">인원&nbsp;&nbsp;<i class="fas fa-chevron-down"></i></div> -->
        <div class="search_btn" name="addFilter" id="addFilter"><i class="fas fa-redo"></i>&nbsp;필터초기화</div>
    </section>
    <section class="search_condition_section1">
        <div class="search_condition_line1">
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_kangnam" value="서울/강남구">
                <label for="seoul_kangnam" class="bb"></label>
                <label for="seoul_kangnam" class="cc">서울/강남구</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="seoul_kangdong" value="서울/강동구">
                <label for="seoul_kangdong" class="bb"></label>
                <label for="seoul_kangdong" class="cc">서울/강동구</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_kangbuk" value="서울/강북구">
                <label for="seoul_kangbuk" class="bb"></label>
                <label for="seoul_kangbuk" class="cc">서울/강북구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_kangseo" value="서울/강서구">
                <label for="seoul_kangseo" class="bb"></label>
                <label for="seoul_kangseo" class="cc">서울/강서구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_kwanak" value="서울/관악구">
                <label for="seoul_kwanak" class="bb"></label>
                <label for="seoul_kwanak" class="cc">서울/관악구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_kwangjin" value="서울/광진구">
                <label for="seoul_kwangjin" class="bb"></label>
                <label for="seoul_kwangjin" class="cc">서울/광진구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_guro" value="서울/구로구">
                <label for="seoul_guro" class="bb"></label>
                <label for="seoul_guro" class="cc">서울/구로구</label>
            </span>
        </div>

        <div class="search_condition_line2">
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_kumcheon" value="서울/금천구">
                <label for="seoul_kumcheon" class="bb"></label>
                <label for="seoul_kumcheon" class="cc">서울/금천구</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="seoul_nowon" value="서울/노원구">
                <label for="seoul_nowon" class="bb"></label>
                <label for="seoul_nowon" class="cc">서울/노원구</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_dobong" value="서울/도봉구">
                <label for="seoul_dobong" class="bb"></label>
                <label for="seoul_dobong" class="cc">서울/도봉구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_dongdaemun" value="서울/동대문구">
                <label for="seoul_dongdaemun" class="bb"></label>
                <label for="seoul_dongdaemun" class="cc">서울/동대문구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_dongjak" value="서울/동작구">
                <label for="seoul_dongjak" class="bb"></label>
                <label for="seoul_dongjak" class="cc">서울/동작구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_mapo" value="서울/마포구">
                <label for="seoul_mapo" class="bb"></label>
                <label for="seoul_mapo" class="cc">서울/마포구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_seodaemun" value="서울/서대문구">
                <label for="seoul_seodaemun" class="bb"></label>
                <label for="seoul_seodaemun" class="cc">서울/서대문구</label>
            </span>
        </div>

       
        <div class="search_condition_line3">
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_seocho" value="서울/서초구">
                <label for="seoul_seocho" class="bb"></label>
                <label for="seoul_seocho" class="cc">서울/서초구</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="seoul_seongdong" value="서울/성동구">
                <label for="seoul_seongdong" class="bb"></label>
                <label for="seoul_seongdong" class="cc">서울/성동구</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_seongbuk" value="서울/성북구">
                <label for="seoul_seongbuk" class="bb"></label>
                <label for="seoul_seongbuk" class="cc">서울/성북구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_songpa" value="서울/송파구">
                <label for="seoul_songpa" class="bb"></label>
                <label for="seoul_songpa" class="cc">서울/송파구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_yangcheon" value="서울/양천구">
                <label for="seoul_yangcheon" class="bb"></label>
                <label for="seoul_yangcheon" class="cc">서울/앙천구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_yeongdeungpo" value="서울/영등포구">
                <label for="seoul_yeongdeungpo" class="bb"></label>
                <label for="seoul_yeongdeungpo" class="cc">서울/영등포구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_yongsan" value="서울/용산구">
                <label for="seoul_yongsan" class="bb"></label>
                <label for="seoul_yongsan" class="cc">서울/용산구</label>
            </span>
        </div>


       
        <div class="search_condition_line4">
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_eunpyeong" value="서울/은평구">
                <label for="seoul_eunpyeong" class="bb"></label>
                <label for="seoul_eunpyeong" class="cc">서울/은평구</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="seoul_jongro" value="서울/종로구">
                <label for="seoul_jongro" class="bb"></label>
                <label for="seoul_jongro" class="cc">서울/종로구</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_jung" value="서울/중구">
                <label for="seoul_jung" class="bb"></label>
                <label for="seoul_jung" class="cc">서울/중구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="seoul_jungrang" value="서울/중랑구">
                <label for="seoul_jungrang" class="bb"></label>
                <label for="seoul_jungrang" class="cc">서울/중랑구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_gapyeong" value="경기/가평">
                <label for="gyeonggi_gapyeong" class="bb"></label>
                <label for="gyeonggi_gapyeong" class="cc">경기/가평</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_goyang" value="경기/고양">
                <label for="gyeonggi_goyang" class="bb"></label>
                <label for="gyeonggi_goyang" class="cc">경기/고양</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_gwacheon" value="경기/과천">
                <label for="gyeonggi_gwacheon" class="bb"></label>
                <label for="gyeonggi_gwacheon" class="cc">경기/과천</label>
            </span>
        </div>

        <div class="search_condition_line5">
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_gwangmyeong" value="경기/광명">
                <label for="gyeonggi_gwangmyeong" class="bb"></label>
                <label for="gyeonggi_gwangmyeong" class="cc">경기/광명</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="gyeonggi_gwangju" value="경기/광주">
                <label for="gyeonggi_gwangju" class="bb"></label>
                <label for="gyeonggi_gwangju" class="cc">경기/광주</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_guri" value="경기/구리">
                <label for="gyeonggi_guri" class="bb"></label>
                <label for="gyeonggi_guri" class="cc">경기/구리</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_gunpo" value="경기/군포">
                <label for="gyeonggi_gunpo" class="bb"></label>
                <label for="gyeonggi_gunpo" class="cc">경기/군포</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_gimpo" value="경기/김포">
                <label for="gyeonggi_gimpo" class="bb"></label>
                <label for="gyeonggi_gimpo" class="cc">경기/김포</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_namyangju" value="경기/남양주">
                <label for="gyeonggi_namyangju" class="bb"></label>
                <label for="gyeonggi_namyangju" class="cc">경기/남양주</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_bucheon" value="경기/부천">
                <label for="gyeonggi_bucheon" class="bb"></label>
                <label for="gyeonggi_bucheon" class="cc">경기/부천</label>
            </span>
        </div>

       
        <div class="search_condition_line6">
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_seongnam" value="경기/성남">
                <label for="gyeonggi_seongnam" class="bb"></label>
                <label for="gyeonggi_seongnam" class="cc">경기/성남</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="gyeonggi_suwon" value="경기/수원">
                <label for="gyeonggi_suwon" class="bb"></label>
                <label for="gyeonggi_suwon" class="cc">경기/수원</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_siheung" value="경기/시흥">
                <label for="gyeonggi_siheung" class="bb"></label>
                <label for="gyeonggi_siheung" class="cc">경기/시흥</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_ansan" value="경기/안산">
                <label for="gyeonggi_ansan" class="bb"></label>
                <label for="gyeonggi_ansan" class="cc">경기/안산</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_anyang" value="경기/안양">
                <label for="gyeonggi_anyang" class="bb"></label>
                <label for="gyeonggi_anyang" class="cc">경기/안양</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_yangju" value="경기/양주">
                <label for="gyeonggi_yangju" class="bb"></label>
                <label for="gyeonggi_yangju" class="cc">경기/양주</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_yangpyeong" value="경기/앙평">
                <label for="gyeonggi_yangpyeong" class="bb"></label>
                <label for="gyeonggi_yangpyeong" class="cc">경기/양평</label>
            </span>
        </div>

        
        <div class="search_condition_line7">
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_yeoju" value="경기/여주">
                <label for="gyeonggi_yeoju" class="bb"></label>
                <label for="gyeonggi_yeoju" class="cc">경기/여주</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="gyeonggi_osan" value="경기/오산">
                <label for="gyeonggi_osan" class="bb"></label>
                <label for="gyeonggi_osan" class="cc">경기/오산</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_yongin" value="경기/용인">
                <label for="gyeonggi_yongin" class="bb"></label>
                <label for="gyeonggi_yongin" class="cc">경기/용인</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_uiwang" value="경기/의왕">
                <label for="gyeonggi_uiwang" class="bb"></label>
                <label for="gyeonggi_uiwang" class="cc">경기/의왕</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_uijeongbu" value="경기/의정부">
                <label for="gyeonggi_uijeongbu" class="bb"></label>
                <label for="gyeonggi_uijeongbu" class="cc">경기/의정부</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_icheon" value="경기/이천">
                <label for="gyeonggi_icheon" class="bb"></label>
                <label for="gyeonggi_icheon" class="cc">경기/이천</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_paju" value="경기/파주">
                <label for="gyeonggi_paju" class="bb"></label>
                <label for="gyeonggi_paju" class="cc">경기/파주</label>
            </span>
        </div>


       
              
        <div class="search_condition_line8">
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_pyeongtak" value="경기/평택">
                <label for="gyeonggi_pyeongtak" class="bb"></label>
                <label for="gyeonggi_pyeongtak" class="cc">경기/평택</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="gyeonggi_pocheon" value="경기/포천">
                <label for="gyeonggi_pocheon" class="bb"></label>
                <label for="gyeonggi_pocheon" class="cc">경기/포천</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_hanam" value="경기/하남">
                <label for="gyeonggi_hanam" class="bb"></label>
                <label for="gyeonggi_hanam" class="cc">경기/하남</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gyeonggi_hwaseong" value="경기/화성">
                <label for="gyeonggi_hwaseong" class="bb"></label>
                <label for="gyeonggi_hwaseong" class="cc">경기/화성</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_kanghwa" value="인천/강화">
                <label for="incheon_kanghwa" class="bb"></label>
                <label for="incheon_kanghwa" class="cc">인천/강화</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_gyeyang" value="인천/계양구">
                <label for="incheon_gyeyang" class="bb"></label>
                <label for="incheon_gyeyang" class="cc">인천/계양구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_namdong" value="인천/남동구">
                <label for="incheon_namdong" class="bb"></label>
                <label for="incheon_namdong" class="cc">인천/남동구</label>
            </span>
        </div>


               
        <div class="search_condition_line9">
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_michuhol" value="인천/미추홀구">
                <label for="incheon_michuhol" class="bb"></label>
                <label for="incheon_michuhol" class="cc">인천/미추홀구</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="incheon_bupyeong" value="인천/부평구">
                <label for="incheon_bupyeong" class="bb"></label>
                <label for="incheon_bupyeong" class="cc">인천/부평구</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_seo" value="인천/서구">
                <label for="incheon_seo" class="bb"></label>
                <label for="incheon_seo" class="cc">인천/서구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_yeonsu" value="인천/연수구">
                <label for="incheon_yeonsu" class="bb"></label>
                <label for="incheon_yeonsu" class="cc">인천/연수구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="incheon_jung" value="인천/중구">
                <label for="incheon_jung" class="bb"></label>
                <label for="incheon_jung" class="cc">인천/중구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="daejeon_seo" value="대전/서구">
                <label for="daejeon_seo" class="bb"></label>
                <label for="daejeon_seo" class="cc">대전/서구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="daejeon_yuseong" value="대전/유성구">
                <label for="daejeon_yuseong" class="bb"></label>
                <label for="daejeon_yuseong" class="cc">대전/유성구</label>
            </span>
        </div>


               
        <div class="search_condition_line10">
            <span class="search_one">
                <input type="checkbox" name="location" id="busan_gyeongnam" value="부산/경남">
                <label for="busan/gyeongnam" class="bb"></label>
                <label for="busan/gyeongnam" class="cc">부산/경남</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="daegu_gyeongbuk" value="대구/경북">
                <label for="daegu/gyeongbuk" class="bb"></label>
                <label for="daegu/gyeongbuk" class="cc">대구/경북</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="daegu_dong" value="대구/동구">
                <label for="daegu_dong" class="bb"></label>
                <label for="daegu_dong" class="cc">대구/동구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="kangwon_kangreung" value="강원/강릉">
                <label for="kangwon_kangreung" class="bb"></label>
                <label for="kangwon_kangreung" class="cc">강원/강릉</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="kangwon_sokcho" value="강원/속초">
                <label for="kangwon_sokcho" class="bb"></label>
                <label for="kangwon_sokcho" class="cc">강원/속초</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="kangwon_yangyang" value="강원/양양">
                <label for="kangwon_yangyang" class="bb"></label>
                <label for="kangwon_yangyang" class="cc">강원/양양</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="kangwon_chuncheon" value="강원/춘천">
                <label for="kangwon_chuncheon" class="bb"></label>
                <label for="kangwon_chuncheon" class="cc">강원/춘천</label>
            </span>
        </div>


               
        <div class="search_condition_line11">
            <span class="search_one">
                <input type="checkbox" name="location" id="kangwon_hongcheon" value="강원/홍천">
                <label for="kangwon_hongcheon" class="bb"></label>
                <label for="kangwon_hongcheon" class="cc">강원/홍천</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="kangwon_pyeongchang" value="강원/평창">
                <label for="kangwon_pyeongchang" class="bb"></label>
                <label for="kangwon_pyeongchang" class="cc">강원/평창</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="chungbuk_cheongju" value="충북/청주">
                <label for="chungbuk_cheongju" class="bb"></label>
                <label for="chungbuk_cheongju" class="cc">충북/청주</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="chungbuk_chungju" value="충북/충주">
                <label for="chungbuk_chungju" class="bb"></label>
                <label for="chungbuk_chungju" class="cc">충북/충주</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="chungnam_nonsan" value="충남/논산">
                <label for="chungnam_nonsan" class="bb"></label>
                <label for="chungnam_nonsan" class="cc">충남/논산</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="chungnam_boryeong" value="충남/보령">
                <label for="chungnam_boryeong" class="bb"></label>
                <label for="chungnam_boryeong" class="cc">충남/보령</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="chungnam_cheonan" value="충남/천안">
                <label for="chungnam_cheonan" class="bb"></label>
                <label for="chungnam_cheonan" class="cc">충남/천안</label>
            </span>
        </div>


       
        <div class="search_condition_line12">
            <span class="search_one">
                <input type="checkbox" name="location" id="jeonbuk_jeonju" value="전북/전주">
                <label for="jeonbuk_jeonju" class="bb"></label>
                <label for="jeonbuk_jeonju" class="cc">전북/전주</label>
            </span>    
            <span class="search_one">  
                <input type="checkbox" name="location" id="jeonnam_gurye" value="전남/구례">
                <label for="jeonnam_gurye" class="bb"></label>
                <label for="jeonnam_gurye" class="cc">전남/구례</label>
            </span>  
            <span class="search_one">
                <input type="checkbox" name="location" id="jeonnam_yeosu" value="전남/여수">
                <label for="jeonnam_yeosu" class="bb"></label>
                <label for="jeonnam_yeosu" class="cc">전남/여수</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="gwangju_gwangsan" value="광주/광산구">
                <label for="gwangju_gwangsan" class="bb"></label>
                <label for="gwangju_gwangsan" class="cc">광주/광산구</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="jeju" value="제주">
                <label for="jeju" class="bb"></label>
                <label for="jeju" class="cc">제주</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="sejong_all" value="세종/전체">
                <label for="sejong_all" class="bb"></label>
                <label for="sejong_all" class="cc">세종/전체</label>
            </span>
            <span class="search_one">
                <input type="checkbox" name="location" id="chungbuk_jecheon" value="충북/제천">
                <label for="chungbuk_jecheon" class="bb"></label>
                <label for="chungbuk_jecheon" class="cc">충북/제천</label>
            </span>
        </div>
    </section>
    <div class="search_btn_area" id="search1_btn_area">
        <input type="reset" value="초기화" class="reset_btn">
        <input type="submit" value="적용" class="search_submit_btn">
    </div>

    <section class="search_condition_section2">
        <script>
            $(function(){
  
                  $('.datepicker').datepicker();
    
            })
          </script>
    </section>

    <section class="search_condition_section3">
        <div class="search_btn_area" id="search3_btn_area">
            <div class="min_max_price">
                <b>가격</b>&nbsp;&nbsp;
                <input type="text" placeholder="최소" id="min_price" class="min_price"> 원 ~ 
                <input type="text" placeholder="최대" id="max_price" class="max_price"> 원
            </div>
            <div class="min_max_person">
                <b>인원</b>&nbsp;&nbsp;
                <input type="text" placeholder="최대" id="max_person" class="max_person"> 명
            </div>
            <input type="reset" value="초기화" class="reset_btn">
            <input type="submit" value="적용" class="search_submit_btn">
        </div>
    </section>
    
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
            <li><a href="리뷰"> Q&A </a></li>
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


<h2 class="search_result">'홍대' 레스토랑 검색 결과</h2> 
<br> 
<section class="main_section">
    <a href="#">
        <div class="main_div1" >
            <br>
            <img src="../images/sample.jpg" class="thumnail_img">
            <div class="board_left">
                <span class="title_name">캐치테이블 홍대점</span><br>
                <span class="title_detail">8층 80평 야경레스토랑</span><br>
                <span class="title_address">서울 마포구 월드컵북로 45 SD타워 8층 캐치테이블 홍대</span><br><br><br><br><br><br><br>
                <b>100,000</b><span>원 / 1인</span><br><br>
                <span class="now_count">현재 예약 건수 1건</span>
            </div>  
            <div class="board_right">
                <div class="board_right_line">
                    <span class="status">예약</span>
                    <span class="status_detail">크리스마스 코스</span>
                    <span class="status_price">100,000원 / 1인</span>
                </div>
                <div class="board_right_line">
                    <span class="status_end">예약마감</span>
                    <span class="status_detail">일반코스</span>
                    <span class="status_price">165,000원 / 1인</span>
                </div>
            </div> 
        </div>
    </a>
   
    

  
</section>

<section class="paging_section">
    <span class="paging"></span>
</section>
</body>
</html>