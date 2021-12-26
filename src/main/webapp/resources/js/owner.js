$('document').ready(function(){
	//시간 select
    for(let i =0; i<=24; i++){
        let append_value = "<option value='"+i+":00' >"+i+":00</option>";
        if(i / 10 < 1) {
            append_value = "<option value='"+i+":00' >0"+i+":00</option>";
        } 
        $('#open_time').append(append_value);
        $('#close_time').append(append_value);
    }
    
    //확장자, 파일크기 확인
    
    $('#s_file').on('change', function(){
    let origin = $(this).val();  
    let extName = origin.substring(origin.lastIndexOf(".") + 1).toUpperCase(); 
    if ( $.inArray(extName, ['JPG', 'JPEG', 'GIF', 'PNG']) == -1 ) {  
        alert('확장자가 jpg, jpeg, gif, png인 파일만 업로드가 가능합니다.');
        $(this).val('');
        return;
    }
    let maxSize = 1024 * 1024 * 10;
    let fileSize = $(this)[0].files[0].size; 
    if (fileSize > maxSize) {
        alert('10MB 이하의 파일만 업로드가 가능합니다.');
        $(this).val('');
        return;
    }
    });
    
    
    //썸네일
    // $('#upload_result').empty();
    // $.each(map.thumnails, function(i,thumbnail){
    //     ('#upload_result')
    //     .append($('<div>').html($('<img>').attr('src','/reserve/' + map.path + '/' + thumbnail))
    // });
    
    
    //가게 주소등록
    
     document.getElementById("address_kakao").addEventListener("click", function(){ 
		       
        new daum.Postcode({
        	width: 500,
        	height: 600,
            oncomplete: function(data) {
                document.getElementById("address_kakao").value = data.address;
                document.querySelector("input[name=address_detail]").focus(); 
               
            }
        }).open({
        	left:(window.screen.width / 2)-(500 / 2),
        	top:(window.screen.height / 2)-(600 / 2)
        });
	});
    
    //메뉴추가 버튼
    //let num = 1;
    document.querySelector(".plus_btn").addEventListener("click", function(e){
        e.preventDefault();
        //let input_num = num + 1;
        let clone_menu_input_box = document.querySelector(".menu_input_box").cloneNode();
        let input_menu = document.createElement("input");
        input_menu.setAttribute("type", "text");
        let input_menu_name = input_menu.cloneNode();
        //input_menu_name.setAttribute("name", "s_menu" + input_num);
        input_menu_name.setAttribute("name", "menu");
        input_menu_name.setAttribute("placeholder", "메뉴명")
        clone_menu_input_box.appendChild(input_menu_name);
        let input_menu_price = input_menu.cloneNode();
        //input_menu_price.setAttribute("name", "s_price" + input_num);
        input_menu_price.setAttribute("name", "price");
        input_menu_price.setAttribute("placeholder", "가격(원)")
        clone_menu_input_box.appendChild(input_menu_price);
        document.querySelector(".menu_input").appendChild(clone_menu_input_box);
    });
    
    //
    $('#delete_btn').on('click',function(){
        if(confirm('[가게이름] 을 삭제할까요?')){
            alert('삭제했습니다.');
        }
    });


    //회원정보 수정 함수 버튼 클릭시 기존 정보들 넘어오게
	$('#update_btn').on('click', function(){
		alert('안녕');
	
	});
});