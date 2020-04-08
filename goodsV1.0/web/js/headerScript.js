
//상태 팝업
$('.enrollEnd').siblings().click(function(){
	$('#enrollEnd').css('display', 'none');
})
$('.close-btn').siblings().click(function() {
	$('#enrollEnd').css('display', 'none');
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
function openUsePolicy() {
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
        //타입이 text(ID일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
        if ($(this).attr('type') == 'text') {
            if ($(this).val() == "") {
                $(this).siblings('span').remove();
                $(this).addClass('error');
                $(this).after($('<span>').html('아이디를 입력하세요.').addClass('error'));
            } else {
                $(this).removeClass('empty error');
                $(this).siblings('span').remove();
                $.ajax({
                    url: contextPath+'/checkEmailDuplicate',
                    type: 'post',
                    data: { email: $(inputLogin[0]).val() },
                    success: function (login) {
                        if (login.isUseAble) {
                            console.log("성공시 : " + login.isUseAble);
                            //$(this).removeClass('error');//input error 클래스 삭젠
                            $(inputLogin[0]).siblings('span').remove();//input의 형제인 span 태그 삭제
                            $(inputLogin[0]).addClass('error');//이메일 확인창에 error 클래스 지우고
                            $(inputLogin[0]).after($('<span>').html('가입해야하는 이메일주소 입니다.').addClass('error'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시하
                        } else {
                            $(inputLogin[0]).removeClass('error');
                            $(inputLogin[0]).siblings('span').remove();
                        }
                    }
                })
            }
            //타입이 password(비번일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
        } else if ($(this).attr('type')) {
            if ($(this).val() == "") {
                $(this).siblings('span').remove();
                $(this).addClass('error');
                $(this).after($('<span>').html('비밀번호를 입력하세요.').addClass('error'));
            } else {
                $(this).removeClass('empty error');
                $(this).siblings('span').remove();
                $.ajax({
                    url: contextPath+'/loginAble',
                    type: 'post',
                    data: { email: $(inputLogin[0]).val(), password: $(inputLogin[1]).val() },
                    success: function (login) {
                        if (!login.isUseAble) {
                            if (!login.checkPassword) {
                                $(inputLogin[1]).siblings('span').remove();
                                $(inputLogin[1]).addClass('error');  //input에 error 클래스 추가하고
                                $(inputLogin[1]).after($('<span>').html('비밀번호가 일치하지 않습니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
                            } else {
                                $(inputLogin[1]).siblings('span').remove();
                            }
                        }
                    }
                })
            }
        }
    });
}
var emailCheck;
var passwordCheck;
$(function(){
	 $(inputLogin[0]).blur(function () {
            //타입이 text(ID일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
            if ($(this).attr('type') == 'text') {
                if ($(this).val() == "") {
                    $(this).siblings('span').remove();
                    $(this).addClass('error');
                    $(this).after($('<span>').html('아이디를 입력하세요.').addClass('error'));
                    emailCheck=false;
                } else {
                    $(this).removeClass('empty error');
                    $(this).siblings('span').remove();
                    $.ajax({
                        url: contextPath+'/checkEmailDuplicate',
                        type: 'post',
                        async:false,
                        data: { email: $(inputLogin[0]).val() },
                        success: function (login) {
                            if (login.isUseAble) {
                                //$(this).removeClass('error');//input error 클래스 삭젠
                                $(inputLogin[0]).siblings('span').remove();//input의 형제인 span 태그 삭제
                                $(inputLogin[0]).addClass('error');//이메일 확인창에 error 클래스 지우고
                                $(inputLogin[0]).after($('<span>').html('가입해야하는 이메일주소 입니다.').addClass('error'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시하
                                emailCheck=false;
                            } else {
                                $(inputLogin[0]).removeClass('error');
                                $(inputLogin[0]).siblings('span').remove();
                                emailCheck=true;
                            }
                        }
                    })
                }
                //타입이 password(비번일때)이고, input의 형제가 없을때(span하나만 생성하기 위한 조건)
            } 
	 });
	 $(inputLogin[1]).blur(function(){
                if ($(this).val() == "") {
                    $(this).siblings('span').remove();
                    $(this).addClass('error');
                    $(this).after($('<span>').html('비밀번호를 입력하세요.').addClass('error'));
                    passwordCheck=false;
                } else {
                    $(this).removeClass('empty error');
                    $(this).siblings('span').remove();
                    $.ajax({
                        url: contextPath+'/loginAble',
                        type: 'post',
                        async:false,
                        data: { email: $(inputLogin[0]).val(), password: $(inputLogin[1]).val() },
                        success: function (login) {
                            if (!login.isUseAble) {
                                if (!login.checkPassword) {
                                    $(inputLogin[1]).siblings('span').remove();
                                    $(inputLogin[1]).addClass('error');  //input에 error 클래스 추가하고
                                    $(inputLogin[1]).after($('<span>').html('비밀번호가 일치하지 않습니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
                                    passwordCheck=false;
                                } else {
                                    $(inputLogin[1]).siblings('span').remove();
                                    passwordCheck=true;
                                }
                            }
                        }
                    })
                }
        });
});//function onload
//로그인 가자아 
function loginSubmit() {
    if(emailCheck==true&&passwordCheck==true) {
    	$.ajax({
    		url:contextPath+'/login',
    		type: 'post',
    		async:false,
            data: { email: $(inputLogin[0]).val(), password: $(inputLogin[1]).val() },
            success: function (login) {
            	console.log("성공");
            	
            }
    		
    	})
    }
    return emailCheck==true&&passwordCheck==true?true:false;
}



//sns 로그인 부분
//구글 로그인 
function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    //console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    //console.log('Full Name: ' + profile.getName());
    //console.log('Given Name: ' + profile.getGivenName());
    //console.log('Family Name: ' + profile.getFamilyName());
    //console.log("Image URL: " + profile.getImageUrl());
    //console.log("Email: " + profile.getEmail());
    $.ajax({
		url:contextPath+'/googleLogin',
		type: 'post',
        data: { email: profile.getEmail(), name: profile.getName(), nickName:profile.getGivenName(), password:profile.getId() },
        success: function (login) {
        	//console.log("성공");
        	//console.log(sessionCount)
        	if(sessionCount==1) location.reload();
        }		
	})
    // The ID token you need to pass to your backend:
    //var id_token = googleUser.getAuthResponse().id_token;
    //console.log("ID Token: " + id_token);
    closeLogin();
}
//구글 로그아웃
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        //console.log('User signed out.');
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

if (loginResult == 'Y') {
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


//비번찾기
console.log($(".top>form>input"));
$(".top>form>input").blur(function() {
	console.log("아니??");
	console.log($(this).val());
	if(!$(this).val().equals("")) {
		$.ajax({
			url: contextPath+'/checkEmailDuplicate',
	        type: 'post',
	        data: { email: $('#email').val() },
			success:function(resp){	  
				if(resp.isUseAble) {
					console.log("닉성공시 : "+resp.isUseAble);
					$('#email').siblings('span').remove();
					$('#email').removeClass('error');//이메일 확인창에 error 클래스 지우고
					$('#email').after($('<span>').html('등록한 이메일 입니다.').addClass('correct'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시한다.
					
					$.ajax({//이메일 보내서 이름 일치여부 확인
						url: contextPath+'/findPassword',
						type: 'post',
						data: { email: $('#email').val(), userName: $('#userName').val() },
						success:function(findPw){		
						}
					})
				}else {
					console.log("닉실패시 : "+resp.isUseAble);
					$('#email').siblings('span').remove();
					$('#email').addClass('error');  //input에 error 클래스 추가하고
					$('#email').after($('<span>').html('등록한 이메일이 없습니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
				}
			}
		})   
	}//if
})//blur
	


