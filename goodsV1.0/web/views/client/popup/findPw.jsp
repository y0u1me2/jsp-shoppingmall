<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<!-- AJAX 쓴다 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>findPasswords</title>
<style>
         * {
            font-family:"Nanum Gothic";
        }
        div {
            margin: 0;
        }
        .container {
            margin: 0;
            padding: 0;
        }
        .top>h1 {
            margin: 0;
            padding: 0 0 40px 0;
            text-align: center;
            font-size: 24px;
            font-weight: normal;
        }
        /* 입력창 */
        .input {
            width: 100%;
            height: 50px;
            border: none;
            border-bottom: 1px solid rgb(238, 238, 238);
            font-size: 14px;
            cursor: text;
        }
        /* 입력창 선택시 */
        .input:active {
            width: 100%;
            height: 50px;
            border: none;
            border-bottom: 1px solid black;
            font-size: 14px;
            cursor: text;
        }
         /* 유의사항 */
         .middle {
            padding-top: 40px;
        }
        dt>span {
            margin-bottom: 15px;
            line-height: 1;
            font-size: 16px;
            text-align: left;
        }
        dd {
            font-size: 12px;
            text-align: left;
            color: #666;
            line-height: 1.67em;
            padding-left: 8px;
            margin-bottom: 4px;
        }
        dd>span {
            text-align: left;
            color: #e5362c;
            margin-bottom: 0;
        }
        .bottom {
            padding-top: 108px;
            margin-bottom: 0;
        }
        /* 로그인 버튼 */
        .big-gray-btn {
            padding: 0 97px;
            line-height: 48px;
            width: 100%;
            font-size: 13px;
            text-align: center;
            font-weight: bold;
            background-color: #757575;
            border: 1px solid #757575;
            color: rgb(255, 255, 255);
            cursor: pointer;
        }
        /* 로그인 버튼 호버시 */
        .big-gray-btn:hover {
            background-color: #646464;
            border: 1px solid #646464;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="top">
            <h1>아이디/비밀번호 찾기</h1>
            <form>
	            <input id="email" type="text" class="input" placeholder="이메일">
	            <input id="userName" type="text" class="input" placeholder="이름"> 
            </form>     
        </div>
        <div class="middle">
            <dl>
                <dt>
                    <span>유의사항</span>
                </dt>
                <dd>
                    이메일이 확인이 불가능한 경우, <span>고객센터(1577-4701)</span> 로 연락 주시기 바랍니다.
                </dd>
                <dd>
                    회원님의 이메일 주소로 임시 비밀번호가 발송됩니다.
                </dd>
                <dd>
                    로그인후 비밀번호를 꼭 변경해 주세요.
                </dd>
            </dl>
        </div>
        
    </div>
<script>
$("#top>input").blur(function() {
	if($(this).val()!=null) {
		$.ajax({
			url: contextPath+'/checkEmailDuplicate',
	        type: 'post',
	        data: { email: $('#email').val() },
			success:function(resp){	  
				if(resp.isUseAble) {
					console.log("닉성공시 : "+resp.isUseAble);
					$('#email').removeClass('error');//이메일 확인창에 error 클래스 지우고
					$('#email').after($('<span>').html('등록한 이메일 입니다.').addClass('correct'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시한다.
					$.ajax({//이메일 보내서 이름 일치여부 확인
						url: contextPath+'/findPassword',
				        type: 'post',
				        data: { email: $('#email').val(), userName: $('#userName').val() },
						success:function(findPw){
							
						}
				}else {
					console.log("닉실패시 : "+resp.isUseAble);
					$('#email').addClass('error');  //input에 error 클래스 추가하고
					$('#email').after($('<span>').html('등록한 이메일이 없습니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
				}
			}
		})      
	}
}
	
})
</script>
</body>
</html>