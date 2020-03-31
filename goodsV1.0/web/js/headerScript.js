
//드롭다운 메뉴
//$(function() {

    // 서브메뉴가 처음화면엔 안보이게 숨김
    $("ul.subMenu").hide();
    // 메인메뉴 li에 마우스 클릭하면
    $("ul.mainMenu").mouseenter(function () {
        $(".subMenu").slideDown(1000);        
    })
    $(".topMenu").mouseleave(function() {
    	$(".subMenu").slideUp(1000);  
    })


    // 로그인, 회원가입 팝업

    // 로그인 창 닫기
    function closeLogin() {
        $('#login').css('display', 'none');
        $('#login-form')[0].reset();//폼리셋
        //입력창 에러 클래스, 경고문구 제거
        for (let i = 0; i < $('.inputLogin>input').length; i++) {
            var inputs = $('.inputLogin>input');
            $(inputs[i]).removeClass('error');
            $(inputs[i]).parent().children('span').remove();
        }
    }
    // 가입 창 닫기
    function closeEnroll() {
        $('#enroll').css('display', 'none');
        $('#enroll-form')[0].reset();//폼리셋
        //입력창 에러 클래스, 경고문구 제거
        for (let i = 0; i < $('.inputEnroll>input').length; i++) {
            var inputs = $('.inputEnroll>input');
            $(inputs[i]).removeClass('error');
            $(inputs[i]).parent().children('span').remove();
            $('div.checkbox').children('span').remove();
        }
    }
    // 로그인 열기
    function openLogin() {
        $('#login').css('display', 'block');
    }
    // 가입 열기
    function openEnroll() {
        $('#enroll').css('display', 'block');
    }
    // 비번찾기 열기
    function openFindPw() {
        $('#findPw').css('display', 'block');
    }
    // 비번찾기 닫기
    function closeFindPw() {
        $('#findPw').css('display', 'none');
    }
    // 이용약관 열기
    function usePolicy() {
        $('#enroll').css('display', 'none');
        $('#usePolicy').css('display', 'block');
    }
    // 이용약관 닫기
    function closeUsePolicy() {
        $('#enroll').css('display', 'block');
        $('#usePolicy').css('display', 'none');
    }
    // 개인정보 열기
    function openPersonalInfo() {
        $('#enroll').css('display', 'none');
        $('#personalInfo').css('display', 'block');
    }
    // 개인정보 닫기
    function closePersonalInfo() {
        $('#enroll').css('display', 'block');
        $('#personalInfo').css('display', 'none');
    }
    function closeEnrollEnd() {
        $('#enrollEnd').css('display', 'none');
    }

    //로그인창 입력창
    var inputLogin = $('div.inputLogin>input');


    //로그인창
    for (let i = 0; i < inputLogin.length; i++) {
        //로드시 input이 비어있을때 empty 클래스 추가
        if ($(inputLogin[i]).val() == "") {
            $(inputLogin[i]).addClass('empty');
        }
        $(inputLogin[i]).blur(function () {
            //로그인 아이디, 비밀번호 인풋에 비어있을때
            if ($(this).val() == "") {
                //타입이 text(ID일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
                if ($(this).attr('type') == 'text' && $(this).siblings().length == 0) {
                    $(this).addClass('error');
                    $(this).after($('<span>').html('아이디를 입력하세요.').addClass('error'));
                    //타입이 password(비번일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
                } else if ($(this).attr('type') == 'password' && $(this).siblings().length == 0) {
                    $(this).addClass('error');
                    $(this).after($('<span>').html('비밀번호를 입력하세요.').addClass('error'));
                }
                //인풋이 비어있지 않을때
            } else {
                $(this).removeClass('empty error');
                $(this).siblings('span').remove();
            }
        });
    }

    //로그인 가자아
    function loginSubmit() {
        var login = false;
        for (let i = 0; i < inputLogin.length; i++) {
            if ($(inputLogin[i]).val() == "") {
                //타입이 text(ID일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
                if ($(inputLogin[i]).attr('type') == 'text' && $(inputLogin[i]).siblings().length == 0) {
                    $(inputLogin[i]).addClass('error');
                    $(inputLogin[i]).after($('<span>').html('아이디를 입력하세요.').addClass('error'));
                    login = false;
                    //타입이 password(비번일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
                } else if ($(inputLogin[i]).attr('type') == 'password' && $(inputLogin[i]).siblings().length == 0) {
                    $(inputLogin[i]).addClass('error');
                    $(inputLogin[i]).after($('<span>').html('비밀번호를 입력하세요.').addClass('error'));
                    login = false;
                }
                //인풋이 비어있지 않을때
            } else {
                $(inputLogin[i]).removeClass('empty error');
                $(inputLogin[i]).siblings('span').remove();
                login = true;
            }
        }
        if(login) {//로그인 창이 빈칸이 아닐때
//        	console.log("읭?");
//        	console.log("이멜"+$(inputLogin[0]).val());
//        	console.log("비번"+$(inputLogin[1]).val());
        	$.ajax({
            	url:'/goods/loginAble',
            	type:'post',
            	data: {email:$(inputLogin[0]).val(),password:$(inputLogin[1]).val()},
            	success:function(login){	  
            		if(login.isUseAble) {
            			console.log("성공시 : "+resp.isUseAble);
            			$('#email').removeClass('error');//이메일 확인창에 error 클래스 지우고
            			$('#email').after($('<span>').html('사용가능한 이메일주소 입니다.').addClass('correct'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시하
            		}else {
            			console.log("실패시 : "+resp.isUseAble);
            			$('#email').addClass('error');  //input에 error 클래스 추가하고
            			$('#email').after($('<span>').html('사용중인 이메일 주소가 있습니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
            		}
            	}
            })
        	/*action="<%=request.getContextPath()%>/login"
				method="post" onsubmit="return loginSubmit();"*/
        	return false;
        }else {
        	console.log("에러");
        	return false;
        }
    }
    //구글 로그인 
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        //console.log('Family Name: ' + profile.getFamilyName());
        //console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        //var id_token = googleUser.getAuthResponse().id_token;
        //console.log("ID Token: " + id_token);
        closeLogin();
    }
    //구글 로그아웃
	function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	}


    //로그인 구분버튼(카카오, 페이스북, 구글, 네이버)
    var loginImg = $('#loginCenterImg>.img>img');
    for (let i = 0; i < loginImg.length; i++) {
        $(loginImg[i]).hover(function () {
            $(this).fadeTo(300, 1);
            $(this).css('cursor', 'pointer');
        }, function () {
            $(this).fadeTo(300, 0.5);
        })
    }
    
    if(loginResult=='Y') {
    	var nameBar = document.getElementById("memberName");
    	nameBar.addEventListener("mouseenter", function () {
    		document.getElementById("infomation").style.display = "block";
    		nameBar.parentElement.setAttribute("class", "dropdown-scope active");
    	})
    	nameBar.addEventListener("mouseleave", function () {
    		document.getElementById("infomation").style.display = "none";
    		nameBar.parentElement.setAttribute("class", "dropdown-scope");
    	})    		
    }
    
    

    
//});
