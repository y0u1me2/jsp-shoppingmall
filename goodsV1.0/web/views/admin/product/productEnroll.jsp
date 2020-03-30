<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/admin/common/header.jsp"%>

<style>
div.content-wrapper{
	background-color:white;
	position: relative;
	left: 100px;
}

div.goodsback{
	height:auto;
	position: relative;
	top:100px;
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
	width: 100%;
	position: relative;
}

/* 밑에 라인 */
#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}

div.goodsback {
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
.box>tr,td {
	border: 1px solid #e2e0e0;
	padding:10px 30px 10px 10px;
}


/* 테이블 크기 */
.box {
	width: 80%;
	height: 250px;
}

/* 전체 1:1상담 목록 텍스트 */
#one {
		font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

input#submit-btn {
	position: relative;
	top: 30px;
	left: 400px;
	width:100px;
	height:40px;
        border: solid 1px rgb(147, 147, 194);
        background: white;
        border-radius: 5px;
        font-size: 15px;
        color: rgb(134, 134, 133);
        margin-right: 5px;
        position:relative;
    }

   input#submit-btn:hover{
        background:rgb(251, 251, 249);
        outline: none;
    } 
    
   td:first-of-type{
   color: #80878d;
    text-align: center;
    vertical-align: middle;
    font-weight: normal;
    font-size: 15px;
    background-color: #f5f4f4;
   }
   
   label{
  color: #80878d;
  font-weight: normal;
  }
	
</style>
</head>

<!-- ============================================================== -->


 <div class="content-wrapper">
	<div class="back">



		<div class="goodsback">
			<br>
			<br>
			<h1 id="one">상품등록</h1>
			<hr id="gline">
			<br>
			<br>

			<div class="text">
				<form action="<%=request.getContextPath()%>/productEnrollEnd"
				method="post" enctype="multipart/form-data">
					<table class="box">
						<br>
						<br>

						<tr>
							<td width="150px">상품명(필수)</td>
							<td><input type="text" id="td1" name="pName"></td>
						</tr>
						
						<tr>
							<td>카테고리</td>
							<td><select name="pCategory">
									<option>-카테고리 선택-</option>
									<option value="케이스">케이스</option>
									<option value="악세사리">악세사리</option>
									<option value="생활용품">생활용품</option>
									<option value="패션">패션</option>
							</select></td>
						</tr>
						
						<tr>
							<td>판매가(필수)</td>
							<td><input type="text" id="td2" name="pPrice">원</td>
						</tr>					
						<tr>
							<td>상품 설명 등록</td>
							<td><input type="text" name="pComment"/></td>
						</tr>
						
						<tr>
							<td>상품 색상 등록</td>
							<td>
							<input type="text" id="colorInput" size="15" placeholder="색상을 입력하세요"/>						
							<input type="file" id="fbtn" name="pThumbnail" size="4"/>						
							</td>
					
						</tr> 
					
					</table>
					<input type="submit" id="submit-btn" value="상품등록">
				</form>
			</div>

		</div>
	</div>
	
	<script>
		
	//ajax 파일업로드 구현하기
	$(function(){
		$("#update-btn").click(function(){
			var form=$("#frm").serialize(); //이름,비밀번호(input)이 여러개일때 데이터만 보낼수있음
			//데이터보낼때 FormData객체를 이용하여 데이터 전송가능
			const fd = new FormData();
		
		//다중파일 업로드
		$.each($("[name=upfile]")[0].files,function(i,item){
			fd.append("goods"+i,item);
		})
			$.ajax({
				url:"<%=request.getContextPath()%>/fileUp",
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
	})
	
	</script>
	
	
</div>

<%@ include file="/views/admin/common/footer.jsp"%>