<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp"%>
<%@ page import="java.util.List,com.web.review.model.vo.Review" %>
<% 
	List<Review> list=(List)request.getAttribute("review");
%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

/* 리뷰 창 */
div.review-container {
	width: 1140px;
	margin: 0 10%;
}

/* 리뷰 상부 타이블/스위치 */
div.review-top {
	border-bottom: 3px solid rgba(0,0,0,0.5);
}

div.review-title {
	float: left;
	padding: 20px 0;
}

div.review-selection {
	padding: 10px 0;
	display: flex;
	justify-content: flex-end;
}

div.review-dropdown {
	margin-right: 20px;
}

select.review-select {
	margin: 30px 0;
	border: none;
	appearance: none;
}

div.review-toggle {
	display: inline-flex;
	padding: 30px 5px;
}


/* 리뷰 중간부/내용 */

div.review-middle>div {
	display: inline-flex;
	justify-content: space-between;
}

.reviewImg {
	cursor: pointer;
	padding: 10px;
}

.reviewImg>img {
	width: 150px;
	height: 150px;
}

/* 리뷰창 상품이미지 */
img.review-product {
	width: 50px;
	height: 50px;
}

div.review-middle table tr td a {
	text-decoration: none;
	color: black;
}

div.review-middle table tr td {
	padding: 10px;
}

td.reviewProductImg {
	padding-top: 0px !important;
}
/* 별점 스타일  */
.checked {
	color: orange;
}

/* 토글 스위치 스타일 */
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 20px;
	margin-left: 10px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 15px;
	width: 15px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
.reviewView-modal-back {
	display: none;
	z-index: 1;
	width: 100%;
	height: 100%;
	top: 0;
	position: fixed;
	background-color: rgba(0, 0, 0, 0.4);
}

.reviewView {
	width: 1024px;
	max-height: 650px;
	padding: 40px 0;
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	position: relative;
}
/* 리뷰미들 */
.reviewView-middle {
	display: inline-flex;
}

/* 리뷰보기 사진창(왼쪽) */
.reviewViewPhoto>ul {
	list-style: none;
	padding: 0 20px;
}

.reviewViewPhoto>ul>li>img {
	width: 624px;
	/* height: 768px; */
}
/* 리뷰보기 글창(오른쪽) */
.reviewViewRight {
	padding: 10px 20px;
}

.reviewViewWriter {
	margin-bottom: 10px;
}

.reviewViewStar {
	text-align: center;
	margin: 10px 0;
	display: inline-flex;
}

div.starOut {
	/* cursor: pointer; */
	width: 20px;
	height: 20px;
}
/* 별점 스타일 
        .checked {
            color: orange;
        } */
.reviewViewDate {
	margin: 10px 0;
}

.reviewViewContent {
	margin: 20px 0;
}

/* 닫기버튼(X) */
.close-btn {
	position: absolute;
	top: 0;
	right: 0;
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.close-btn>.close {
	position: relative;
	font-size: 20px;
	cursor: pointer;
}

.close:hover {
	color: red;
}

.reviewView-top {
	text-align: center;
	font-weight: bolder;
	font-size: 16px;
}

/* Add Zoom Animation 
        팝업시 줌 애니메이션*/
.animate {
	animation: animatezoom 0.6s
}

@
keyframes animatezoom {from { transform:scale(0)
	
}

to {
	transform: scale(1)
}
}
</style>


<section>

	<div class="review-container">
		<div class="review-top">
			<div class="review-title">
				<h1>
					나의리뷰 ( <span id="number-of-object">52684</span> )
				</h1>
			</div>
			<div class="review-selection">
				<div class="review-dropdown">
					<select class="review-select" name="reviewSelect">
						<option value="all">모든 상품</option>
						<option value="1">케이스</option>
						<option value="2">악세사리</option>
						<option value="3">생활용품</option>
						<option value="4">패션</option>
					</select>
				</div>
				<div class="review-toggle">
					<span style="margin: 0; font-size: 14px;">포토리뷰</span> 
					<label class="switch"> 
						<input type="checkbox"> 
						<span class="slider round"></span>
					</label>
				</div>
			</div>
		</div>
		<div class="review-middle">
			<!-- 다시해야할듯........================div로 ======================= -->
			<%for(Review r : list) { %>
			<div style="border-bottom: 2px solid rgba(0, 0, 0, 0.2); width: 100%;">
				<input id="RvNo" type="hidden" value="<%=r.getRv_No()%>">
				<table>
					<tr>
						<td class="reviewProductImg" rowspan="3"><a href="#"> 
						<img class="review-product"
								src="http://blogfiles.naver.net/MjAyMDAyMjhfMjk1/MDAxNTgyODg3OTYxNTAx.65if9cw_x-J4nP-t9AUFic4VeVhf_V0mi88ZZ5XODUgg.XvjMwjsTpXdosK9tlxsm7nTTWE0YTYJtbc9Qq0pkXnMg.JPEG.momo7891/Description.jpg">
						</a></td>
						<td class="reviewTitle" colspan="3">
						<a href="#">
							상품이구요
						</a></td>
					</tr>
					<tr class="reviewTR">
						<td class="reviewStar">
						<%for(int i=0;i<r.getRv_Star();i++) { %>
							<span class="fa fa-star checked"></span>
						<%} %>
						<%for(int i=0;i<5-(r.getRv_Star());i++) { %>
							<span class="fa fa-star"></span>
						<%} %>
						
						<td class="reviewDate"><%=r.getRv_Date() %></td>
						<td class="reviewWriter"><%=r.getM_nickName() %></td>
					</tr>
					<tr>
						<td class="reviewContent" style="width:150px;" colspan="3"><%=r.getRv_Content() %></td>
					</tr>
				</table>
				<div class="reviewImg">
					<img
						src="https://s3.marpple.co/files/u_1206533/2020/3/900/18296301f2293ae1ec778c915db20e7aab4de4adc53c16b.jpg">
				</div>
			</div>
			<%} %>
			<!-- -============================================================================== -->
		</div>
	</div>
	<!-- ============================================================================================ -->
	<div class="reviewView-modal-back">
		<div class="animate reviewView">
			<div class="reviewView-top">
				<!-- 로그인 창 X표시 -->
				<div class="close-btn">
					<span onclick="closeReviewView();" class="close"
						title="Close Modal">&times;</span>
				</div>
			</div>
			<div class="reviewView-middle">
				<div class="reviewViewPhoto">
					<ul>
						<li><img
							src="https://s3.marpple.co/files/u_1206533/2020/3/900/18296301f2293ae1ec778c915db20e7aab4de4adc53c16b.jpg">
						</li>
					</ul>
				</div>
				<div class="reviewViewRight">
					<div class="reviewViewWriter" id="reviewViewWriter"></div>
					<div class="reviewViewStar">
						<div class="starOut">
							<span id="starPoint" name="star[0]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[1]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[2]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[3]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[4]" class="fa fa-star"></span>
						</div>
					</div>
					<div class="reviewViewDate" id="reviewViewDate"></div>
					<div class="reviewViewContent" id="reviewViewContent"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	var check = $("input[type='checkbox']");
	check.click(function() {
		$("p").toggle();
	});

	// 리뷰작성창 닫기
	function closeReviewView() {
		$('.reviewView-modal-back').css('display', 'none');
	}

	$('.reviewImg').click(function() {
		$('.reviewView-modal-back').show();
		var star=$('div.starOut>span');
		$.ajax({
			url:'<%=request.getContextPath()%>/reviewView',
			type:'post',
			data:{rvNo:$(event.target).parent().siblings('input').val()},
			success:function(data) {
				$('#reviewViewWriter').text(data.m_nickName);
				$('#reviewViewDate').text(data.rv_Date);
				$('#reviewViewContent').text(data.rv_Content);
				for(let i=0;i<5;i++) {
					$(star[i]).removeClass('checked');
				}
				for(let i=0;i<data.rv_Star;i++) {
					$(star[i]).addClass('checked');
				}
			}
		})
	})
</script>


<%@ include file="/views/client/common/footer.jsp"%>