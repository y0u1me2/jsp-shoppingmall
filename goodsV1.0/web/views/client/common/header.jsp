<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.member.model.vo.Member"%>
<%@ page import="com.web.member.model.dao.MemberDao" %>
<%@ page import="com.web.common.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%-- <%@ page import="com.web.common.listener.SessionCheckListener" %> --%>
<%@ page import="java.util.List"%>

<%

	Member loginMember = (Member) session.getAttribute("loginedMember");//로그인 세션
	String loginResult=(String)session.getAttribute("loginResult");
	String emailCheck=(String)session.getAttribute("emailCheck");//이메일체크 여부
	String m_status=(String)session.getAttribute("m_status");//회원상태	
	//boolean isUseAble=(boolean)request.getAttribute("isUseAble");//중복사용 가능 불가능
	//String checkedEmail=(String)request.getAttribute("emailCheck");//중복검사한 이메일
	//int duplication=Integer.parseInt(request.getParameter("duplication"));
	
	
	String auth=(String)request.getParameter("auth");//인증했는지 안했는지
	String enroll=(String)request.getParameter("enroll");//가입성공 실패여부
%>
<script>
		var loginResult='<%=loginResult%>';
		console.log(loginResult);
</script>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>굿굿즈</title>

<!-- css폴더에있는 css파일 불러오기 -->
<!-- css불러올때는  아래처럼 항상 절대경로로 불러올것    -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/headStyles.css" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<!-- AJAX 쓴다 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>
	<!-- ======================================================================================== -->


	<header>
		<!-- 상부 우측메뉴 -->
		<div class="util">
			<div class="container">
				<ul class="right-top">
					<li>
						<button type="button">고객센터</button>
					</li>
					<li>
						<button type="button">주문/배송</button>
					</li>
					<li>
						<button type="button">장바구니</button>
					</li>
					<%
						if (loginMember == null || loginMember != null&&emailCheck.equals("N")) {
					%>
					<li>
						<button type="button" onclick="openEnroll()">회원가입</button>
					</li>
					<li>
						<button type="button" onclick="openLogin()">로그인</button>
					</li>
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<li>
			<div class="dropdown" id="memberName">
				<div class="dropdown-scope">
					<button type="button">
						<h4><%=loginMember.getM_NickName()%>
							님
						</h4>
					</button>
				</div>
				<div id="infomation">
					<ul>
						<li><button type="button">마이페이지</button></li>
						<li><button type="button">나의 리뷰</button></li>
						<li>
							<button type="button">
								<a href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</li>
		</ul>
		</div>
		</div>

		<%
			}
		%>

		<!-- 메뉴바 -->
		<div class="container2">

			<!-- 로고 -->
			<span class="logo"> <img
				src="<%=request.getContextPath()%>/images/영문검정.png" width="300px"
				height="150px" alt="goodgoods">
			</span>


			<div class="topMenu">
				<ul class="mainMenu" style="">
					<li><span><a href="<%=request.getContextPath()%>/product/list?category=케이스"> 케이스</a></span></li>
					<li><span><a href="<%=request.getContextPath()%>/product/list?category=악세사리"> 악세사리</a></span></li>
					<li><span> <a href="<%=request.getContextPath()%>/product/list?category=생활용품"> 생활용품</a></span></li>
					<li><span><a href="<%=request.getContextPath()%>/product/list?category=패션"> 패션</a></span></li>
					<li><span><a href="">갤러리</a></span></li>
					<li><span><a href="<%=request.getContextPath()%>/reviewList"> 리뷰</a></span></li>
					<li id="middleBar-img"></li>
					<li><a href="https://www.kakaocorp.com/"><img id="cart"
							src="<%=request.getContextPath()%>/images/cart.png" alt=""></a></li>
					<li><a href="https://www.kakaocorp.com/"><img id="love"
							src="<%=request.getContextPath()%>/images/icon.png" alt=""></a></li>
				</ul>

				<ul class="mainMenu2">
					<li>
						<ul class="subMenu">
							<li id="nop"><a href="#">에어팟 케이스</a></li>
							<li id="nop"><a href="#">버즈 케이스</a></li>
							<li id="nop"><a href="#">핸드폰 케이스</a></li>
						</ul>
					</li>
					<li>
						<ul class="subMenu">
							<li id="nop"><a href="#">키링</a></li>
							<li id="nop"><a href="#">뱃지</a></li>
							<li id="nop"><a href="#">그립톡</a></li>
						</ul>
					</li>
					<li>
						<ul class="subMenu">
							<li id="nop"><a href="#">텀블러</a></li>
							<li id="nop"><a href="#">머그컵</a></li>
							<li id="nop"><a href="#">노트</a></li>
							<li id="nop"><a href="#">다이어리</a></li>
						</ul>
					</li>
					<li>
						<ul class="subMenu">
							<li id="nop"><a href="#">티셔츠</a></li>
							<li id="nop"><a href="#">에코백</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<hr>
		</div>




		<!--========================================팝업창들=============================================  -->

		<!-- 로그인 팝업 -->
		<div class="modal-back" id="login">
			<div class="modal-login animate">
				<form id="login-form" action="<%=request.getContextPath()%>/login"
					method="post" onsubmit="return loginSubmit();">
					<div class="top-login">
						<span> <img class="login-logo"
							src="<%=request.getContextPath()%>/images/로그인영문.png">
						</span>
						<div class="inputLogin">
							<input type="text" name="email" placeholder="이메일 또는 아이디">
						</div>
						<div class="inputLogin">
							<input type="password" name="password" placeholder="비밀번호"
								maxlength="15">
						</div>
					</div>
					<div id="loginCenterImg">
						<div class="img">
							<img src="<%=request.getContextPath()%>/images/kakao.png"
								alt="kakao">
						</div>
						<div class="img">
							<img src="<%=request.getContextPath()%>/images/face.png"
								alt="facebook">
						</div>
						<div class="img">
							<img src="<%=request.getContextPath()%>/images/googleicon.png"
								alt="google">
						</div>
						<div class="img">
							<img src="<%=request.getContextPath()%>/images/naver.png"
								alt="naver">
						</div>
					</div>
					<div class="bottom-login">
						<button type="submit" class="big-gray-btn">로그인</button>
						<div class="find-info">
							<button type="button" onclick="openEnroll(); closeLogin()">회원가입</button>
							<span class="line">|</span>
							<button type="button" onclick="openFindPw(); closeLogin();">비밀번호
								찾기</button>
						</div>
					</div>
				</form>
				<!-- 로그인 창 X표시 -->
				<div class="close-btn">
					<span onclick="closeLogin();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>
		</div>

		<!-- 비밀번호 찾기 -->
		<div class="modal-back" id="findPw">
			<!-- 이용약관 팝업-->
			<div class="modal-findPw animate">
				<div class="url-html">
					<%-- <object type="text/html" data="<%=request.getContextPath()%>/popup/findPw.html" id="htmlPw"></object> --%>
				</div>
				<div class="close-btn">
					<span onclick="closefindPw();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>
		</div>
		
		<!-- ====================================회원가입 창 ==================================================== -->
		<!-- 회원가입 팝업 뒷배경 -->
		<!-- 중복검사 후 -->
		<div class="modal-back" id="enroll" >
			<!-- 회원가입 팝업-->
			<div class="modal-enroll animate">
				<form id="enroll-form"
					action="<%=request.getContextPath()%>/memberEnrollEnd"
					method="post" onsubmit="return enrollSubmit();">
					<div class="top-enroll">
						<h1>회원가입</h1>
					</div>
					<div class="middle-enroll">
						<table class="enroll-form">
							<colgroup>
								<col style="width: 25%;">
								<col style="width: 75%;">
							</colgroup>
							<tbody>
								<tr>
									<th>이메일 <em><sup>*</sup></em></th>
									<td class="inputEnroll"><input id="email" type="email"
										name="email" placeholder="@를 포함한 이메일 주소 입력"
										maxlength="40">	
									</td>
								</tr>
								<tr>
									<th>비밀번호 <em><sup>*</sup></em></th>
									<td class="inputEnroll"><input type="password"
										name="password" value="" id="password"
										placeholder=" 영문·숫자·특수문자 조합 6~15자리" maxlength="15"></td>
								</tr>
								<tr>
									<th>비밀번호 확인 <em><sup>*</sup></em></th>
									<td class="inputEnroll"><input type="password" value=""
										id="passwordCheck" placeholder="비밀번호 다시 입력" maxlength="15">
									</td>
								</tr>
								<tr>
									<th>이름 <em><sup>*</sup></em></th>
									<td class="inputEnroll"><input type="text" name="userName"
										value="" placeholder="이름 입력" maxlength="15"></td>
								</tr>
								<tr>
									<th>닉네임 <em><sup>*</sup></em></th>
									<td class="inputEnroll"><input type="text" name="nickName"
										value="" placeholder="닉네임 입력" maxlength="15"></td>
								</tr>
								<!-- <tr>
                                        <th>이름 <em><sup>*</sup></em></th>
                                        <td class="inputEnroll">
                                            <input type="text" value="" placeholder="이름 입력" maxlength="15">
                                        </td>
                                    </tr> -->
							</tbody>
						</table>
						<!-- 이용약관 -->
						<div class="agreement">
							<div class="checkbox">
								<input type="checkbox" name="agree-all"> <label
									for="agree-all"> <strong>전체동의</strong>
								</label>
							</div>
							<div class="checkbox">
								<input type="checkbox" name="joinAgree"> <label
									for="joinAgree"> 만 14세 이상입니다. (필수) </label>
							</div>
							<div class="checkbox">
								<input type="checkbox" name="joinAgree"> <label
									for="joinAgree"> 굿굿즈
									<button type="button" class="agree-btn" onclick="openUsePolicy();">
										이용약관</button> 동의 (필수)
								</label>
							</div>
							<div class="checkbox">
								<input type="checkbox" name="joinAgree"> <label
									for="joinAgree">
									<button type="button" class="agree-btn"
										onclick="openPersonalInfo();">개인정보 수집 및 이용</button> 동의 (필수)
								</label>
							</div>
						</div>
					</div>
					<!-- 가입창 하단부 -->
					<div class="bottom-enroll">
						<button type="submit" class="big-gray-btn">완료</button>
						<!--타입지웠다-->
					</div>
				</form>
				<div class="close-btn">
					<!-- <span onclick="closeEnroll();" class="close" title="Close Modal">&times;</span> -->
					<span onclick="closeEnroll();" class="close" title="Close Modal">&times;</span>
				</div>
				<form action="<%=request.getContextPath()%>/checkEmailDuplicate" method="post" id="emailCheckForm">
					<input type="hidden" id="emailCheck" name="emailCheck" value="">
				</form>
				
			</div>
		</div>
		<!--================================================= 이용약관 링크 팝업 ========================================================-->
		<!-- 뒷배경 -->
		<div class="modal-back" id="usePolicy">
			<!-- 이용약관 팝업-->
			<div class="modal-usePolicy animate">
				<div class="url-html">
					<%-- <object type="text/html" data="<%=request.getContextPath()%>/popup/usePolicy.html" id="htmlPolicy"></object> --%>
				</div>
				<div class="close-btn">
					<span onclick="closeUsePolicy();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>
		</div>

		<!-- 개인정보 수집 링크 팝업 -->
		<!-- 뒷배경 -->
		<div class="modal-back" id="personalInfo">
			<!-- 개인정보 수집 팝업-->
			<div class="modal-personalInfo animate">
				<div class="url-html">
					<%-- <object type="text/html" data="<%=request.getContextPath()%>/popup/personalInfo.html" id="htmlpInfo"></object> --%>
				</div>
				<div class="close-btn">
					<span onclick="closePersonalInfo();" class="close"
						title="Close Modal">&times;</span>
				</div>
			</div>
		</div>
		<!-- 가입완료 -->
		<!-- 뒷배경 -->
		<% if(auth!=null&&auth.equals("true")) { %> <!-- 가입성공한 상태에서 인증 완료 -->
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class=" modal-enrollEnd animate">
				<div>
					<h4>굿굿즈의 가족이 되신것을 환영합니다.</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" onclick="openLogin(); closeEnrollEnd();" class="big-gray-btn">로그인 하러가기</button>
				</div>
				<div class="close-btn">
					<span onclick="closeEnrollEnd();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>	
		</div>
		<%} else if(auth!=null&&enroll!=null&&auth.equals("false")&&enroll.equals("true")) {%>
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class=" modal-enrollEnd animate">
				<div>
					<h4>
					가입이 완료되었습니다.<br>
					이메일을 확인하여 인증을 완료해주세요.
					</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" onclick="closeEnrollEnd();" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span onclick="closeEnrollEnd();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>
		</div>	
			<%} else if(auth!=null&&enroll!=null&&auth.equals("false")&&enroll.equals("false")) { %> <!-- 가입 실패! 이메일 인증은 미완료! -->
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class=" modal-enrollEnd animate">
				<div>
					<h4>
					가입이 실패되었습니다.
					관리자에게 문의하세요
					</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" onclick="closeEnrollEnd();" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span onclick="closeEnrollEnd();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>
		</div>	
			<%} %>
			<!-- 로그인 실패시 알림창 -->
		<% if(loginMember!=null) {
		if(loginResult!=null&&emailCheck!=null&&m_status!=null&&loginResult.equals("N")&&emailCheck.equals("N")&&m_status.equals("Y")) { %> <!-- 로그인 실패 -->
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class=" modal-enrollEnd animate">
				<div>
					<h4>이메일을 확인하여 인증을 완료해주세요.</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" onclick="closeEnrollEnd();" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span onclick="closeEnrollEnd();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>	
		</div>
		<%}else if(loginResult!=null&&emailCheck!=null&&m_status!=null&&loginResult.equals("N")&&emailCheck.equals("N")&&m_status.equals("N")) {%>
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class=" modal-enrollEnd animate">
				<div>
					<h4>로그인에 실패하였습니다.
					관리자에게 문의하여주세요.</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" onclick="closeEnrollEnd();" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span onclick="closeEnrollEnd();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>	
		</div>
		<%} }%>
		
	</header>