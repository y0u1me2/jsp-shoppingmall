
    	
	  //회원가입 창
	    var inputEnroll = $('td.inputEnroll>input');//회원가입 창

	    var emailRule = /(?=^\w+@[a-zA-Z]+[.][a-zA-Z.]+$).{5,}/i;//이메일 유효성
	    var pwRule1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;//비밀번호 유효성 1
	    var pwRule2 = /(\w)\1\1\1/;//비밀번호 유효성2

	    for (let i = 0; i < inputEnroll.length; i++) {
	        if ($(inputEnroll[i]).val() == "") {//로드시 input이 비어있을때 empty 클래스 추가
	            $(inputEnroll[i]).addClass('empty');
	        }
	        $(inputEnroll[i]).blur(function () {//input에서 blur시             
	            $(this).siblings('span').remove();//생성되었던 span태그 없애버리기
	            if ($(this).val() == "") { //로그인 아이디, 비밀번호 인풋에 비어있을때               
	                if ($(this).siblings().length == 0) { //input의 형제가 없을때(span하나만 생성하기 위한 조건)
	                    $(this).addClass('error');//input에 에러 클래스 추가
	                    $(this).after($('<span>').html('필수 항목입니다.').addClass('error')); //span 태그에 "필수항목입니다" 표시하고 span에 error 클래스 추가
	                }
	            } else {//인풋이 비어있지 않을때
	                $(this).removeClass('empty error'); //input 값 있으면 input에 empty랑 error클래스 삭제
	                $(this).siblings('span').remove(); //input의 형제인 span 태그 삭제               
	                if ($(this).attr('id') == 'email') { //input이 이메일 입력창일때
	                    if (!emailRule.test($(this).val())) { //이메일 유효성 검사하고 결과 이상하면
	                        $(this).addClass('error');  //input에 error 클래스 추가하고
	                        $(this).after($('<span>').html('유효하지 않은 이메일입니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
	                    } else { //유효성 오케이이면
	                        $(this).removeClass('error');//input error 클래스 삭젠
	                        $(this).siblings('span').remove();//input의 형제인 span 태그 삭제
	                        var email=$(this).val()
	                        //이메일 중복 확인
	                        var userEmail=$(this).val();//이메일을 변수에 저장
	                        //=======================실험용 ajax===================================
	                        $.ajax({
	                        	url:contextPath+'/checkEmailDuplicate',
	                        	type:'post',
	                        	//dataType:"json",
	                        	data: {email:$('#email').val()},
	                        	success:function(resp){	  
	                        		if(resp.isUseAble) {
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
	                    }
	                } else if ($(this).attr('type') == 'password') {//input이 비밀번호창 이면
	                    var pwck1 = pwRule1.test($(this).val());//비밀번호 유효성 검사1
	                    var pwck2 = pwRule2.test($(this).val());//비밀번호 유효성 검사2
	                    var pwck3_1 = ($(this).val()).search(/[0-9]/g) < 0;//비밀번호 유효성 검사3_1
	                    var pwck3_2 = ($(this).val()).search(/[a-z]/g) < 0;//비밀번호 유효성 검사3_2
	                    var pwck3 = pwck3_1 || pwck3_2;//비밀번호 유효성 검사3
	                    /*console.log('====================');
	                    console.log('pwck1찐 : ' + pwck1);
	                    console.log('pwck2같은문자 : ' + pwck2);
	                    console.log('pwck3_1 : ' + pwck3_1);
	                    console.log('pwck3_2 : ' + pwck3_2);
	                    console.log('pwck3 : ' + pwck3);*/
	                    
	                    if (pwck2) {
	                        $(this).removeClass('error');
	                        $(this).siblings('span').remove();
	                        $(this).addClass('error');//error 클래스 추가하고
	                        $(this).after($('<span>').html('같은 문자를 4번 이상 사용하실 수 없습니다.').addClass('error'));//span태그 추가해서 유효하지 않다고 표시
	                    }
	                    if (pwck3) {
	                        $(this).removeClass('error');
	                        $(this).siblings('span').remove();
	                        $(this).addClass('error');//error 클래스 추가하고
	                        $(this).after($('<span>').html('숫자와 영문자를 혼용하여야 합니다.').addClass('error'));//span태그 추가해서 유효하지 않다고 표시
	                    }
	                    if (!pwck1) {//비밀번호 유효성 검사결과 이상상하면
	                        $(this).removeClass('error');
	                        $(this).siblings('span').remove();
	                        $(this).addClass('error');//error 클래스 추가하고
	                        $(this).after($('<span>').html('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.').addClass('error'));//span태그 추가해서 유효하지 않다고 표시
	                    }
	                    //                if(($(this).val()).search(/[0-9]/g)>-1) {
	                    //                	$(this).removeClass('error');
	                    //                    $(this).siblings('span').remove();
	                    //                	$(this).addClass('error');//error 클래스 추가하고
	                    //                    $(this).after($('<span>').html('숫자와 영문자를 혼용하여야 합니다.').addClass('error'));//span태그 추가해서 유효하지 않다고 표시
	                    //                }
	                    if (pwck1 && (!pwck2) && (!pwck3)) {//비번 유효성 오케이이면
	                        $('#passwordCheck').siblings('span').remove();//일단 비밀번호 확인 창 span 지우고 없어도 지우는 척하고
	                        if ($('#password').val() != $('#passwordCheck').val()) { //비밀번호 위에꺼랑 일치하지 않으면
	                            $('#passwordCheck').addClass('error'); //비번 확인창에 error 클래스 추가하고
	                            $('#passwordCheck').after($('<span>').html('비밀번호가 일치하지 않습니다.').addClass('error')); //비번 확인결과 span태그에 표시
	                        } else {//비번 확인결과 같으면
	                            $('#passwordCheck').removeClass('error');//비번확인창에 error 클래스 지우고
	                            $('#passwordCheck').after($('<span>').html('비밀번호가 일치합니다.').addClass('correct'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시하기
	                        }
	                    }
	                } else if ($(this).attr('name') == 'nickName') {
	                	console.log("아니??닉")
	                	$.ajax({
                        	url:contextPath+'/checkNickDuplicate',
                        	type:'post',
                        	//dataType:"json",
                        	data: {nickName:$('#nickName').val()},
                        	success:function(resp){	  
                        		if(resp.isUseAble) {
                        			console.log("닉성공시 : "+resp.isUseAble);
                        			$('#nickName').removeClass('error');//이메일 확인창에 error 클래스 지우고
                        			$('#nickName').after($('<span>').html('사용가능한 닉네임 입니다.').addClass('correct'));// 같다고 표시할 correct 클래스 추가해서 같다고 표시하
                        		}else {
                        			console.log("닉실패시 : "+resp.isUseAble);
                        			$('#nickName').addClass('error');  //input에 error 클래스 추가하고
                        			$('#nickName').after($('<span>').html('사용중인 닉네임이 있습니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
                        		}
                        	}
                        })	          
	                }
	            }
	        });
	    }
	    //약관 동의 부분
	    var agree = $('div.checkbox>input');
	    for (let i = 1; i < agree.length; i++) { //전체동의 빼고 필수동의 칸만 지정해서 for문 돌릴영역 설정
	        $(agree[0]).click(function () { //전체동의 눌렀을때!!!!
	            if (agree[0].checked == true) { //눌렀는데 전체동의가 체크로 변했으면
	                agree[i].checked = true;    //밑에 필수동의 다 체크로 변환
	                $(agree[i]).siblings('span').remove();//혹시 span태그 있으면 지우기
	            } else { //전체동의 눌렀는데 언체크면!!!!
	                agree[i].checked = false; //밑에 필수 동의 들 언체크 변환
	            }
	        });
	        $(agree[i]).click(function () { //그런데 필수동의를 클릭했을때!!!!
	            if (agree[i].checked == false) { //필수동의들이 언체크면(이건 개별임 or나 and처럼 안 묶여 있음 독고다이)
	                agree[0].checked = false;   //일단 전체동의 언체크로 젼환후
	                $(this).parent().append($('<span>').html('필수 항목입니다.').addClass('error')); //위에서 했던것처럼 span 절차 해주고
	                $(this).siblings('span').css({ //span 스타일 위치랑 뭐 그딴거 설정
	                    display: 'block',
	                    paddingLeft: '20px'
	                })
	            } else { //필수동의 애덜이 체크면(이건 개별임 or나 and처럼 안 묶여 있음 독고다이)
	                $(this).siblings('span').remove(); //일단 스판 오류창 지우고
	                if (agree[1].checked == true && agree[2].checked == true && agree[3].checked == true) { //필수동의 애들이 모두다 체크면
	                    agree[0].checked = true;//전체동의 체크로 변신시키기
	                }
	            }
	        });
	    }
	    // 회원가입 완료누르면 로그인 하러가기 뜨기
	    // DB설계후 수정해야함 아마도
	    // console.lgo(agree.length);
	    // var inputEnroll = $('td.inputEnroll>input');

	    // $('div.enrollEnd>button').click(function () {
	    //     login();
	    //     closeEnrollEnd();
	    // })
	    // console.log($('this').attr('type')=='email');//이메일 타입일때 true 아니면 false
	    //회원가입이랑 로그인 입력창에 입력안했을때
	    //필수동의 안하고 섭밋

	    function pilsuAgree() {
	        var subInput=false;
	        var subAgree=false;
	        // console.log(inputEnroll.length);
	        for (let i = 0; i < inputEnroll.length; i++) { //일단 입력창갯수 만큼 for문 돌리긔
	            if ($(inputEnroll[i]).val() == "") { //입력창에 입력된거 없으면
	                if ($(inputEnroll[i]).siblings().length == 0) { //근데 없는데 형제로 span이라던지 뭐 없어 그러면
	                    $(inputEnroll[i]).siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
	                    $(inputEnroll[i]).addClass('error'); //error클래스 추가하고
	                    $(inputEnroll[i]).after($('<span>').html('필수 항목입니다.').addClass('error')); //span태그 추가하긔
	                    subInput = false; //에바니깐 입력 boolean에 false 넣기
	                } else {            //여기는 span태그 있으면인데 살짝 밑에 조건에 있어가지고 깨름칙한데 없어도 될것같음
	                    subInput = false;//에바니깐 입력 boolean에 false 넣기
	                }
	            } else {// 입력창에 입력된거 있을때
	                if ($(inputEnroll[i]).siblings().length != 0) { //입력창 형제들 있으면 span같은 애들있을때 어? 있을때 승원아 임마
	                    if ($(inputEnroll).siblings('span:not(.correct)').length != 0) { //그런 와중에 형제중에 span있는데 correct span말고 나머지 error span
	                        subInput = false; //그럴때 에바니깐 입력 boolean에 false 넣기
	                    } else {
	                        subInput = true; //입력창에 입력된거 있고 그리고 어? 승원아 있고 span.correct클래스 빼고 span 형제들이 0이면 임마 true ㅇㅋ??
	                    }
	                }
	            }
	        }
	        for (let i = 1; i < agree.length; i++) { //여기는 위에 동의랑 거의 같을껄? 왜냐면 복사했거든 그래서 그거 참고
	            if (agree[i].checked == false) {
	                $(agree[i]).siblings('span').remove();
	                $(agree[i]).parent().append($('<span>').html('필수 항목입니다.').addClass('error'));
	                $(agree[i]).siblings('span').css({
	                    display: 'block',
	                    paddingLeft: '20px'
	                })
	                subAgree = false;//그래가지고 동의 boolean에다가 false 
	            } else { //그래가지고 애덜이 언체크가 아니고 체크면
	                $(agree[i]).siblings('span').remove();//일단 오류창 지워주고 span 태그가 오류창 이야 RG???
	                if (agree[1].checked == true || agree[2].checked == true || agree[3].checked == true) { //그런 와중에 필수동의 1부터 3까지 다 체크야 
	                    subAgree = true; //그래서 이제 true 넣어주고
	                }
	            }
	        }
	        return (subInput == true && subAgree == true) ? true : false;
	    }
	    
	    function enrollSubmit() {
	         var enrollSubmitValue = pilsuAgree();
	         console.log(enrollSubmitValue);
	         if(enrollSubmitValue) {
	        	 return true;
	         }else {
	        	 return false;
	         }
	         //console.log("subInput : " + subInput);
	         //console.log("subAgree : " + subAgree);
	         //그러면 입력창이랑 동의창이랑 둘이 같이 true일때 true리턴 하고 아님 아닌건 아닌거니까 false줘서 submit 못하는거지 알았니?? 승원아?
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
