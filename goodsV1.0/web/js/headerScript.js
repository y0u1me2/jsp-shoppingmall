
//드롭다운 메뉴
//$(function() {

    // 서브메뉴가 처음화면엔 안보이게 숨김
    $("ul.subMenu").hide();
    // 메인메뉴 li에 마우스 클릭하면
    $("ul.mainMenu").mouseenter(function () {
        $(".subMenu").slideToggle(1000).css({
            width: "100%",
            height: "100%"
        });

        // $('body').toggle().css('overflow', 'hidden');
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
        return login;
    }


    //로그인 구분버튼(카카오, 페이스북, 구글, 네이버)
    var loginImg = $('#loginCenterImg>.img>img');
    for (let i = 0; i < loginImg.length; i++) {
        $(loginImg[i]).hover(function () {
            // console.log('===============')
            // console.log($(this).parent());
            $(this).fadeTo(300, 1);
            $(this).css('cursor', 'pointer');
        }, function () {
            $(this).fadeTo(300, 0.5);
        })
    }
    
    /*<%if(loginMember!=null) {%>*/
//    var m_name='<%=memberName%>';
//    console.log(m_name);
//    console.log('<%=memberName%>');
//    if(!=null) {
    	//console.log(loginMember);
    	if(loginMember>0) {
    		console.log("실행");
    		var nameBar = document.getElementById("memberName");
    		console.log(nameBar);
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
