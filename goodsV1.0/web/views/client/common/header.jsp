<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.member.model.vo.Member"%>
<%@ page import="com.web.member.model.dao.MemberDao" %>
<%@ page import="com.web.common.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%-- <%@ page import="com.web.common.listener.SessionCheckListener" %> --%>
<%@ page import="java.util.List"%>
<%@ page import="com.web.product.model.vo.Product" %>
<%@ page import="com.web.product.model.service.ProductService" %>


<%

	Member loginMember = (Member) session.getAttribute("loginedMember");//로그인 세션
	String loginResult=(String)session.getAttribute("loginResult");
	String emailCheck=(String)session.getAttribute("emailCheck");//이메일체크 여부
	String m_status=(String)session.getAttribute("m_status");//회원상태	
	
	
	String auth=(String)request.getParameter("auth");//인증했는지 안했는지
	String enroll=(String)request.getParameter("enroll");//가입성공 실패여부
	String savePw=(String)request.getParameter("savePw");//임시비번 저장여부
	
	ProductService service =  new ProductService();
	List<Product> 케이스 = service.selectByCategory("케이스");
	List<Product> 악세사리 = service.selectByCategory("악세사리");
	List<Product> 생활용품 = service.selectByCategory("생활용품");
	List<Product> 패션 = service.selectByCategory("패션");
	

%>
<script>
		var loginResult='<%=loginResult%>';
		var sessionCount='<%=session.getAttribute("loginCount")==null?1:session.getAttribute("loginCount")%>'
		var mNo = '<%=session.getAttribute("loginedMember")==null?"":((Member)session.getAttribute("loginedMember")).getM_No()%>';
		/* console.log(loginResult); */
		//var contextPath = "/20AM_GoodGoods";
		var contextPath = '<%=request.getContextPath()%>';
</script>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 구글 로그인 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="434214577564-es7em89nej7dmjke6sa184ttis3ndb70.apps.googleusercontent.com">
<script src="<%=request.getContextPath()%>/js/googleSignIn.js" async defer></script>

<title>굿굿즈</title>

<!-- css폴더에있는 css파일 불러오기 -->
<!-- css불러올때는  아래처럼 항상 절대경로로 불러올것    -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/headStyles.css" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<!-- AJAX 쓴다 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
a{
	text-decoration:none;
	color: rgb(95,93,93);
	font-weight: 700;
}

ul{
	list-style: none;
    list-style-position: inside;
	padding-left:0;
}

li{
	list-style:none;
	list-style-position: inside;
}

/* 메인 메뉴들 가로로 배열(flex) */
.main{
	width:80%;
	height: 120px;
	display:flex;
	align-items: center;
}

.main>li{
	position: relative;
	width:150px;
	height: 100%;
	text-align:center;
	
}

.main>li>a{
	height: 100%;
	display:block;
	line-height:80px;
	position:relative;
	top:20px;
	font-size:20px;
}

/* 서브메뉴들 */
.main .sub{
	position: absolute;
	top: 80px;
	left: 0;
	display: none;
	width:100%;
	z-index: 1;
	background: white;
}

.main .sub li{
	padding: 20px;
}

.main li:hover .sub{
	display: block;
}

img#leftLogo{
	position:relative;
	bottom:5px;
	left:90px;
}

/* 유의사항 */
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
        .middle>dl>dt>span {
            margin-bottom: 15px;
            line-height: 1;
            font-size: 16px;
            text-align: left;
        }
        .middle>dl>dd {
            font-size: 12px;
            text-align: left;
            color: #666;
            line-height: 1.67em;
            padding-left: 8px;
            margin-bottom: 4px;
        }
        .middle>dl>dd>span {
            text-align: left;
            color: #e5362c;
            margin-bottom: 0;
        }
        .bottom {
            padding-top: 108px;
            margin-bottom: 0;
        }

</style>


</head>

<body>
	<!-- ======================================================================================== -->


<header>
		<!-- 상부 우측메뉴 -->
		<div class="util">
			<div class="container">
				<ul class="right-top">
					<li>
						<button type="button"><a href="<%=request.getContextPath() %>/notice/noticeList"
						style="text-decoration:none;">공지사항</a></button>
					</li>
					<li>
						<button type="button"><a href="<%=request.getContextPath() %>/schome"
						style="text-decoration:none;">고객센터</a></button>
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
			} else if(loginMember != null&&emailCheck.equals("Y")) {
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
						<li>
						<button type="button">
						<a href="<%=request.getContextPath()%>/orderDelivery?mNo=<%=loginMember.getM_No()%>">마이페이지</a>
						</button></li>
						<li>
							<button type="button">
								<a href="<%=request.getContextPath()%>/myReviewList">나의 리뷰</a>
							</button>
						</li>
						<li>
							<button type="button">주문/배송</button>
						</li>
						<li>
							<button type="button"><a href="<%=request.getContextPath() %>/cart"
							style="text-decoration:none;">장바구니</a></button>
						</li>
						<li>
							<button type="button">
								<a onclick="signOut();" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</li>
		</ul>
		</div>


		<%
			}
		%>
		</div>
		
		
<!-- 드롭다운 메뉴 -->
<div style=" display:flex;padding-bottom:20px;padding-top:20px;">
	<!-- 로고 -->
	<a href="<%=request.getContextPath()%>/index.jsp" style="display:block; width:20%; height:80px;">
		<img src="<%=request.getContextPath()%>/images/common/좌측로고.png"  id="leftLogo" alt="goodgoods">
	</a>
	
	<ul class="main">
		<li><a href="<%=request.getContextPath()%>/product/list?category=케이스">케이스</a>
			<ul class="sub">
				<%for(Product p: 케이스){%>
					<li><a href="<%=request.getContextPath()%>/product/view?pNo=<%=p.getpNo() %>"><%=p.getpName() %></a></li>
				<% }%>
			</ul>
		</li>
		
		<li><a href="<%=request.getContextPath()%>/product/list?category=악세사리">악세사리</a>
			<ul class="sub">
				<%for(Product p: 악세사리){%>
					<li><a href="<%=request.getContextPath()%>/product/view?pNo=<%=p.getpNo() %>"><%=p.getpName() %></a></li>
				<% }%>
			</ul>
		</li>
		
		<li><a href="<%=request.getContextPath()%>/product/list?category=생활용품">생활용품</a>
			<ul class="sub">
				<%for(Product p: 생활용품){%>
					<li><a href="<%=request.getContextPath()%>/product/view?pNo=<%=p.getpNo() %>"><%=p.getpName() %></a></li>
				<% }%>
			</ul>
		</li>
		
		<li><a href="<%=request.getContextPath()%>/product/list?category=패션">패션</a>
			<ul class="sub">
				<%for(Product p: 패션){%>
					<li><a href="<%=request.getContextPath()%>/product/view?pNo=<%=p.getpNo() %>"><%=p.getpName() %></a></li>
				<% }%>
			</ul>
		</li>
		
		<li><a href="<%=request.getContextPath()%>/gallery/list">갤러리</a></li>
		
		<li><a href="<%=request.getContextPath()%>/reviewList">리뷰</a></li>
	</ul>
</div>


		<!--========================================팝업창들=============================================  -->

		<!-- 로그인 팝업 -->
		<div class="modal-back" id="login">
			<div class="modal-login animate">
				<form id="login-form" onsubmit="return loginSubmit()" method="post">
					<div class="top-login">
						<span> <img class="login-logo"
							src="<%=request.getContextPath()%>/images/common/로그인영문.png">
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
						
						
						<div class="img g-signin2" data-onsuccess="onSignIn" data-theme="dark">
							<img src="<%=request.getContextPath()%>/images/common/googleicon.png"
								alt="google">
						</div>
				
						
					</div>
					<div class="bottom-login">
						<button type="submit" class="big-gray-btn" onclick="loginSubmit();">로그인</button>
						<div class="find-info">
							<button type="button" onclick="openEnroll(); closeLogin()">회원가입</button>
							<span class="line">|</span>
							<button type="button" onclick="openFindPw(); closeLogin();">비밀번호 찾기</button>
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
					<div class="container">
				        <div class="top">
				            <h1>아이디/비밀번호 찾기</h1>
				            <form method="post" action="<%=request.getContextPath()%>/findPw">
					            <input id="findPwEmail" name="findPwEmail" type="text" class="input" placeholder="이메일">
					            <input id="findPwUserName" name="findPwUserName" type="text" class="input" placeholder="이름"> 
				        </div>
				        <div class="middle">
				            <dl>
				                <dt>
				                    <span>유의사항</span>
				                </dt>
				                <dd>
				                    이메일이 확인이 불가능한 경우, <span>고객센터(1544-9970)</span> 로 연락 주시기 바랍니다.
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
				</div>
				<div class="close-btn">
					<span onclick="closeFindPw();" class="close" title="Close Modal">&times;</span>
				</div>
            	<button type="submit" class="big-gray-btn">보내기</button>
				            </form>     
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
									<td class="inputEnroll"><input id="nickName" type="text" name="nickName"
										value="" placeholder="닉네임 입력" maxlength="15"></td>
								</tr>
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
					<object type="text/html" data="<%=request.getContextPath()%>/views/client/popup/usePolicy.html" id="htmlPolicy"></object>
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
					<object type="text/html" data="<%=request.getContextPath()%>/views/client/popup/personalInfo.html" id="htmlpInfo"></object>
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
					<button type="button" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span class="close" title="Close Modal">&times;</span>
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
				<div class="enrol lEnd">
					<button type="button" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span class="close" title="Close Modal">&times;</span>
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
					<button type="button" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span class="close" title="Close Modal">&times;</span>
				</div>
			</div>	
		</div>
		<%}else if(loginResult!=null&&emailCheck!=null&&m_status!=null&&loginResult.equals("N")&&(emailCheck.equals("N")||m_status.equals("N"))) {%>
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class=" modal-enrollEnd animate">
				<div>
					<h4>로그인에 실패하였습니다.
					관리자에게 문의하여주세요.</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span class="close" title="Close Modal">&times;</span>
				</div>
			</div>	
		</div>
		<%} }%>
		
		<% if(savePw!=null&&savePw.equals("true")) { %> <!-- 임시비밀번호 저장성공 -->
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class="modal-enrollEnd animate">
				<div>
					<h4>해당 이메일 주소로 임시비밀번호를 발송했습니다.
					이메일을 확인해 주세요.</h4>
				</div>
				<div class="enrollEnd">
					<button type="button" onclick="closeEnrollEnd();" class="big-gray-btn">확인</button>
				</div>
				<div class="close-btn">
					<span onclick="closeEnrollEnd();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>	
		</div>
		<%} else if(savePw!=null&&savePw.equals("false")) {%>
		<div class="modal-back" id="enrollEnd" style="display:block;">
			<!-- 가입완료 팝업-->		
			<div class="modal-enrollEnd animate">
				<div>
					<h4>임시 비밀번호 발송에 실패하였습니다.
					고객센터(1544-9970)로 문의하여 주세요.</h4>
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
		




	</header>