<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp"%>


<style>


/* aside메뉴 */
div.aside {
	width: 20%;
	height: 100%;
	line-height: 130%;
}

/* aside와 content공간띄우기 */
div.aside2 {
	width: 8%;
	height: 100%;
	line-height: 130%;
}

/*리스트 스타일 */
ul.lnb_list a {
	padding-top: 3px;
	padding-left: 13px;
	line-height: 25px;
	font-size: 16px;
	color: #000;
	background: transparent
		url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg)
		no-repeat left 6px;
	text-decoration:none;
}

ul {
	list-style: none;
}

/* ======================================================================== */

/* 섹션 */
section.back {
	width: 80%;
	position: relative;
	left: 10%;
	display: flex;
}

/* 1:1문의 */
div.inquiry-container {
	width: 100%;
}

/* 1:1문의 텍스트 */
h1#title {
	/* font-weight: bolder; */
	font-size: 25px;
	position: relative;
	top: 10px;
	;
}

/*제목 밑에 라인 */
hr#line1 {
	border: 1px solid rgb(78, 77, 77);
	position: relative;
	top: 20px;
}
/* 테이블 */
table.box {
	border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad;
	border-collapse: collapse;
	width: 100%;
}

/* 테이블 선 색상 */
table.box>tr, th, td {
	border-top: 1px solid #e2e0e0;
	border-bottom: 1px solid #e2e0e0;
	padding:7px;
}

/* 1:1문의하기 텍스트 */
h1#title2 {
	width: 100%;
	text-align: center;
	color: rgb(97, 96, 96);
	font-size: 20px;
	font-weight: lighter;
}

/* 문의유형 선없음 */
select {
	border: none;
}

/* 연락처 선없음 */
input#phone {
	border: none;
}

/* 내용박스 스타일 */
textarea#content {
	border: none;
	resize: none;
}
 
/* 등록하기 버튼 라인 */
td#tdBtn {
	text-align: center;
	padding: 2%;
}

/* 등록하기 버튼 */
#btn2 {
	height: 40px;
	width: 100px;
	background: #313030;
	border-radius: 3px;
	margin-left: auto;
	margin-right: auto;
	border: 0;
	font-size: 15px;
	color: rgb(233, 233, 229);
	position: relative;
	left: 2px;
}

#btn2:hover {
	background: black;
	outline: none;
}

/* 전화문의 운영시간 */
p#call {
	text-align: center;
	color: rgb(138, 136, 136);
	font-weight: bolder;
	font-size: 15px;
	background: rgb(245, 245, 245);
	padding: 10px;
}
</style>

<!--=====================================================================  -->

<section class="back">
	
	<div class="aside">
		<h5 style='line-height: 400%'>&nbsp&nbsp HOME // MyPage</h5>
		<h2 style='line-height: 300%'>&nbsp&nbsp마이페이지</h2>

		<ul class="lnb_list">
			<li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/listLookUp">찜 목록 조회</a></li>
			<br>
			<li><a href=>반품/환불</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/MyInquiryWrite"
			style="color: rgb(23, 7, 248); font-weight: bold;">1:1문의</a></li>
			<br />
			<li><a href="<%=request.getContextPath()%>/myInquiryList">1:1문의내역</a></li>
			<br>
			<li><a href="">쿠폰관리</a></li>
			<br>
			<li><a href="">포인트관리</a></li>
			<br>
			<li><a href="회원정보1.html">회원정보수정</a></li>
			<br>
			<li><a href="회원탈퇴.html">회원탈퇴</a></li>
			<br>
		</ul>
	</div>
	
	<!-- aside2 목록과붙어있는공간띄우기-->
	<div class="aside2"></div>


	<div class="inquiry-container">
		<br><br>
		<h1 id="title">1:1문의</h1>
		<hr id="line1">
		<br>
		<br>

			<div>
				<h1 id="title2">1:1 문의하기</h1>
			</div>
			<br>

			<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/MyInquiryWriteEnd">

				<table class="box">
				<input type="hidden" name="mNo" value="<%=loginMember.getM_No()%>"/>
					<tr>
						<th id="th1">문의유형</th>
						<td><select name="inquiryType">
								<option>문의유형을 선택해 주세요</option>
								<option value="대량구매문의">대량구매문의</option>
								<option value="배송문의">배송문의</option>
								<option value="상품교환 및 취소/결제 문의">상품교환 및 취소/결제 문의</option>
								<option value="기타문의">기타문의</option>
						</select></td>

					</tr>
					<tr>
						<th>연락처</th>
						<td><input name="phone" id="phone" placeholder="연락처를 입력해주세요"
							required /></td>
					</tr>
					<tr>
						<th>문의제목</th>
						<td><input type="text" name="title"
							placeholder="제목을 입력해 주세요 " style="border: none;" required /></td>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" cols="80" rows="15"
								placeholder="문의하실 내용을 입력해 주세요." required>
                            </textarea></td>
					</tr>

					<tr>
						<th>이미지 첨부 <lable id="flabel"> 파일
							<td><input type="file" name="upfile" multiple/></td>
							</lable>
						</th>
					</tr>
					<tr>
						<td colspan=2 id="tdBtn">
						<input id="btn2" type="submit" value="등록하기" >
						</td>
				</table>
			</form>
	<div id="images"></div>


			<div id="callArea">
				<p id="call">전화문의 1577-3822 | 운영시간 평일 9:00~18:00</p>
			</div>
	</div>

	<script>
	//ajax 파일업로드 구현하기
	/* $(function(){
		$("#btn2").click(function(){
			var form=$("#frm").serialize(); //이름,비밀번호(input)이 여러개일때 데이터만 보낼수있음
			//데이터보낼때 FormData객체를 이용하여 데이터 전송가능
			const fd = new FormData(); */
					 
		//다중파일 업로드
		<%-- $.each($("[name=upfile]")[0].files,function(i,item){
			fd.append("goods"+i,item);
		})
			$.ajax({
				url:"<%=request.getContextPath()%>/MyInquiryWriteEnd",
				data:form,
				type:"post",
				processData:false,
				contentType:false,
				success:function(data){
					alert("업로드 성공");
					$("#images").html("");
					$("[name=upfile]").val("");
					
				},error:function(re,e,m){
					alert("업로드 실패");
				}					
			})
			
		})
	}) --%>

	
	</script>

</section>
<br>
<br>
<br>


<%@ include file="/views/client/common/footer.jsp"%>

