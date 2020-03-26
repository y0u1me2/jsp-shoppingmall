<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/admin/common/header.jsp"%>
<style>
* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}

/* 섹션안 공간  */
div.back {
	width: 80%;
	position: relative;
	top: 50px;
	bottom: 50px;
	display: flex;
	left: 360px;
	height: 850px;
}


/* 밑에 라인 */
#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}

.goodsback {
	width: 100%;
}

/* box 스타일 */
.box {
	border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad;
	border-collapse: collapse;
	width: 80%;
}

/* 테이블 위치 */
.text {
	position: relative;
	top: 30px;
}

/* 테이블 선 색상 */
.box>tr, td {
	border: 1px solid #e2e0e0;
}

/* 테이블 크기 */
.box {
	width: 80%;
	height: 200px;
}

#td1, #td2, #td3, #fbtn {
	margin-left: 10px;
}

/* 전체 1:1상담 목록 텍스트 */
#one {
	font-weight: bolder;
	font-size: 25px;
	position: relative;
	top: 10px;
}

#btns {
	position: relative;
	top: 30px;
	left: 350px;
}
</style>
</head>

<!-- ============================================================== -->


<section>
	<div class="back">

		

		<div class="goodsback">
			<br>
			<br>
			<h1 id="one">상품정보수정</h1>
			<hr id="gline">
			<br>
			<br>

			<div class="text">
				<form>
					<table class="box">
						<br>
						<br>
						<tr>
							<td width="150px">상품명(필수)</td>
							<td><input type="text" id="td1"></td>
						</tr>
						<tr>
							<td>판매가(필수)</td>
							<td><input type="text" id="td2">원</td>
						</tr>
						<tr>
							<td>상품이미지수정</td>
							<td><input type="file" id="fbtn"
								onchange="javascriptdocument.getElementById('file_route').value=this.value">
							</td>
						</tr>
						<tr>
							<td>상품옵션설정</td>
							<td>
								<div id="td3">
									<input type="radio">사용함 <input type="radio">사용안함
									<p style="font-size: 8px">
										-상품옵션이란, 상품의 사이즈, 색상 등 선택값을 뜻합니다.<br /> -등록하는 상품에 설정할 옵션이 있을
										경우 사용함을 선택해주세요.
									</p>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div id="btns">
					<button>상품정보수정</button>
					&nbsp; &nbsp;
					<button>상품삭제</button>
				</div>
			</div>

		</div>
	</div>
</section>


<%@ include file="/views/admin/common/footer.jsp"%>