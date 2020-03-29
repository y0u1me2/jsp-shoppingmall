<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.product.model.vo.Product" %>



<%@ include file="/views/admin/common/header.jsp"%>
<style>
div.content-wrapper {
	background-color: white;
	position: relative;
	left: 100px;
}

div.goodsback {
	height: auto;
	position: relative;
	top: 100px;
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
		padding:10px 30px 10px 5px;
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
	font-size: 30px;
	position: relative;
	top: 10px;
}

#btns {
	position: relative;
	top: 30px;
	left: 300px;
}

button#update-btn {
	height: 40px;
	width: 120px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 10px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

button#update-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

button#color-btn {
	height: 40px;
	width: 150px;
	background: #313030;
	border-radius: 7px;
	margin-left: auto;
	margin-right: auto;
	border: 0;
	font-size: 15px;
	color: rgb(233, 233, 229);
	position: relative;
}

button#color-btn:hover {
	background: black;
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
			<br> <br>
			<h1 id="one">상품색상수정</h1>
			<hr id="gline">
			<br> <br>
				
			<div class="text">
				<form name='ajaxFile' id="frm" method="post" enctype="multipart/form-data" >
						
				<input type="hidden" name="no" value=""/>
					<table class="box">
						<br>
																
						<tr>
							<td>상품 색상 설정</td>
							<td>
								<div>
									<input type="checkbox" name="option" id="option" checked>
									<label for="option">화이트</label>
									
									<input type="checkbox" name="option" id="option2" >
									<label for="option2">블랙</label>
									
									<input type="checkbox" name="option" id="option3" >
									<label for="option3">핑크</label>
									
									<input type="checkbox" name="option" id="option4" >
									<label for="option4">그린</label>
									
									<input type="checkbox" name="option" id="option5" >
									<label for="option5">블루</label>
									
									<input type="checkbox" name="option" id="option6" >
									<label for="option6">옐로우</label>
									
									<input type="checkbox" name="option" id="option7" >
									<label for="option7">레드</label>
									
									<input type="checkbox" name="option" id="option8" >
									<label for="option8">네이비</label>
									
									<input type="checkbox" name="option" id="option9" >
									<label for="option9">퍼플</label>
									
									<input type="checkbox" name="option" id="option10" >
									<label for="option10">연그레이</label>
									
									<input type="checkbox" name="option" id="option11" >
									<label for="option11">진그레이</label>
																										
								</div>
							</td>						
						</tr>  
						
						<tr>
							<td>색상 이미지</td>
							<td><input type="file" id="fbtn" name="upfile" multiple/></td>
						</tr>
						
					</table>
				<div id="btns">
					<button type="button" id="update-btn">상품색상수정</button>				
				</div>
				</form>
				
				<div id="images"></div>
			</div>

		</div>
	</div>
	
<script>

//상품색상수정
function pColorUpdate(){	
	//name=option
	var result = confirm('상품색상을 수정하시겠습니까?'); 
	var count=0;
	var pColors=$("#option");
	
	if(result) { 
		for(let i=0; i<pColors.length; i++){
			if(pColors[i].checked==true){
				count++;
			}
		}
			
	if(count==0){
		alert("수정할 색상을 선택해주세요.");
	}else{
		//배열 선언
	    var pColorArray=[];

	    $('input[name="option"]:checked').each(function(i){
	        		iCkArray.push($(this).val());
	   	});	
	    //체크된 리스트 저장
	    console.log(pColorArray);
	       
	    var objParams = {
			"pColorArray" : pColorArray //선텍된 글을 저장
	   }; 
	      
	   
	    $.ajax({
	        url         :   "<%=request.getContextPath()%>/productUpdateColorEnd",
	       	dataType    :   "html",
	        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	        type        :   "post",
	        data        :   objParams,
	        success     :   function(retVal){
			alert(retVal);
			location.replace("<%=request.getContextPath()%>/productUpdateColor");
		},
			error : function(request, status, error) {
			console.log("AJAX_ERROR");
					}
		});
		}
		} else {

		}
	}
	
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

//이미지 미리보기(file)
$(function(){
	$("[name=upfile]").change(function(){
		
		const reader = new FileReader();
				
	//다중 이미지 출력하기 multiple속성이 있을 때
		$.each($(this)[0].files,function(i,item){
			const reader = new FileReader();
			
			reader.onload=function(e){
				var img=$("<img>").attr("src",e.target.result)
				.css({width:"100px",height:"100px"});
				$("#images").append(img);						
			}
			reader.readAsDataURL(item);
		});
	})
})
</script>	
	
	

</div>



<%@ include file="/views/admin/common/footer.jsp"%>

