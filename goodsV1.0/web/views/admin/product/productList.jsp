<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.web.product.model.vo.Product"%>

<%
	List<Product> list = (List) request.getAttribute("list");

	/* 원하는  조회기간 별로 출력하기 */
	int cPage = (int)request.getAttribute("cPage");
	String numPer = request.getParameter("numPerPage");
%>

<%@ include file="/views/admin/common/header.jsp"%>

<style>
div.content-wrapper {
	background-color: white;
}

* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}

/* 섹션안 공간  */
div.back {
	position: relative;
	left: 110px;
	top: 50px;
	height: 1100px;
}

/* content 공간 */
div.goodsback {
	width: 100%;
}

/* 전체 1:1상담 목록 텍스트 */
h1#title {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

/* 제목밑에 선 */
hr#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}
/* content 위치 */
div.list-container {
	position: relative;
	top: 10px;
}

/* 테이블 선 색상 */
div.box>th, tr, td {
	border: 1px solid #e2e0e0;
	border-right: 1px solid #e2e0e0;
	padding: 7px;
}

/* 테이블 스타일 */
table.box {
	width: 80%;
	text-align: center;
	border: 1px solid #e2e0e0;
	border-collapse: collapse;
}

/* 문의내용이 존재하지 않습니다. */
td#conbox {
	text-align: center;
	height: 300px;
	font-size: 15px;
	position: relative;
	width: 100%;
}

/* 페이지바 위치 */
div#pageBar {
	position: relative;
	top: 20px;
}

/* 페이지바 a태그  */
div#pageBar a {
	text-decoration: none;
	color: rgb(95, 93, 93);
}

/* 답변상태 버튼 */
#inquiry-btn {
	position: relative;
	height: 30px;
	width: 80px;
	border: solid 1px rgb(190, 190, 196);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

#inquiry-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

/* 리스트상자  */
.mListHeader {
	padding: 7px 15px;
	padding-bottom: 10px;
	border: 1px solid #bcbfc4;
	line-height: 21px;
	text-align: center;
	background: #dfe3e6;
	position: relative;
	z-index: 1;
	margin-bottom: -1px;
	width: 80%;
	height: 50px;
	top: 23px;
}

/* 삭제 버튼위치 */
.gleft {
	position: relative;
	right: 330px;
	top: 2px;
}

#numPerPage {
	position: relative;
	left: 370px;
	top: -25px;
}

/* 삭제  버튼 스타일 */
.btn_Wihte {
	padding: 3px 10px;
	font-size: 12px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
}

/* 검색결과 스타일 */
.total {
	font-size: 15px;
	font-family: "Nanum Gothic";
	color: rgb(49, 49, 49);
	margin: 2px 8px 0px 0px;
}

#pageBar {
	width: 80%;
	margin: 40px 0 40px 0;
	text-align: center;
}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #eee;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	position: relative;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
}

input#update-btn {
	height: 30px;
	width: 80px;
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

input#update-btn:hover {
	background: black;
	outline: none;
}

input#color-btn {
	height: 30px;
	width: 80px;
	border: solid 1px rgb(190, 190, 196);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

input#color-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}
</style>

<!-- ============================================================== -->


<div class="content-wrapper">
	<div class="back">

		<div class="goodsback">
			<br> <br>

			<h1 id="title">전체상품목록</h1>
			<hr id="gline">

			<br> <br>

			<div class="list-container">


				<div class="mListHeader">
					<div class="gleft">
						<button type="button" class="btn_Wihte"
							onclick=" mAllClickSelect()">전체선택</button>
						<button type="button" class="btn_Wihte"
							onclick=" mAllClickRelease()">선택해제</button>
						<button type="button" class="btn_Wihte" onclick=" mCkDelete()">삭제</button>
					</div>

					<div class="gright" id="numPerPage-container">

						<form name="numPerPageFrm" id="numPerPageFrm"
							action="<%=request.getContextPath()%>/ProductListView">

							<input type="hidden" name="cPage" value="<%=cPage%>"> <select
								name="numPerPage" id="numPerPage">
								<option value="5"
									<%=numPer==null || numPer.equals("5")?"selected":"" %>>5개씩
									보기</option>
								<option value="10"
									<%=numPer==null || numPer.equals("10")?"selected":"" %>>10개씩
									보기</option>
								<option value="15"
									<%=numPer==null || numPer.equals("15")?"selected":"" %>>15개씩
									보기</option>
							</select>

						</form>

					</div>
				</div>
				</br>

				<table class="box">
					<tr style="background-color: rgb(245, 245, 245); height: 40px;">
						<td><input type="checkbox" name="allCheck"
							onclick="allChk();"></td>
						<td>번호</td>
						<td>카테고리</td>
						<td>이미지</td>
						<td>상품명</td>
						<td>상품가격</td>
						<td>수정</td>

					</tr>

					<%
							if (list.isEmpty()) {
						%>
					<tr>
						<td id="conbox" colspan='6'>상품 내역이 존재 하지 않습니다.</td>
					</tr>
					<%
							} else {
						%>

					<%
							for (Product p : list) {
						%>
					<tr>
						<td><input type="checkbox" name="rowCheck"
							value="<%=p.getpNo()%>"></td>

						<td><%=p.getpNo()%></td>

						<td><%=p.getpCategory()%></td>

						<td><img
							src="<%=request.getContextPath()%>/images/product/thumbnail/<%=p.getpThumbnail() %>"
							width="40px" alt="이미지 없음"></td>

						<td><%=p.getpName()%></td>

						<td><%=p.getpPrice()%></td>

						<td><a href="<%=request.getContextPath()%>/productUpdateView?no=<%=p.getpNo()%>">
						<input type="button" id="update-btn" value="정보수정" />
						</a> 
						<input type="button" id="color-btn"  value="색상수정" /></td>

						</form>
					</tr>
					<%
							}
							}
						%>
				</table>

				<div id="pageBar">
					<%=request.getAttribute("pageBar")%>
				</div>


			</div>
		</div>
	</div>

	<script>
		//체크박스 전체선택하기
		var check = false;

		function allChk(){

			var chk = document.getElementsByName("rowCheck");

			if (check == false) {

				check = true;

				for (var i = 0; i < chk.length; i++) {

					chk[i].checked = true; //모두 체크

				}

			} else {

				check = false;

				for (var i = 0; i < chk.length; i++) {

					chk[i].checked = false; //모두 해제

				}

			}
	

		}
		
		//사용자가 조회기간 지정하기		
	   $("#numPerPage").change(()=>{
	        $("#numPerPageFrm").submit();
	     });
				
		
	</script>

</div>

<%@ include file="/views/admin/common/footer.jsp"%>