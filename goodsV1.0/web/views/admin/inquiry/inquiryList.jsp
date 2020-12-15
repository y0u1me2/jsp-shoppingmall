<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.web.inquiry.model.vo.Inquiry"%>

<%
	List<Inquiry> list = (List)request.getAttribute("list");

	/* 원하는  조회기간 별로 출력하기 */
	int cPage = (int) request.getAttribute("cPage");
	String numPer = request.getParameter("numPerPage");

%>

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
	margin-bottom:25px;
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

tr:first-of-type {
	color: #80878d;
	text-align: center;
	vertical-align: middle;
	font-weight: normal;
	font-size: 15px;
	background-color: #f5f4f4;
	padding: 9px 10px 7px;
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

.total>strong {
	color: rgb(255, 109, 1);
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
</style>

<%@ include file="/views/admin/common/header.jsp"%>

<!-- ============================================================== -->


<div class="content-wrapper">
	<div class="back">

		<div class="goodsback">


			<h1 id="title">전체1:1문의 목록</h1>
			<hr id="gline">

			<br> <br>

			<p class="total">
				[오늘 등록된 새 글<strong><%=request.getAttribute("todayInquiry")%></strong>건]
				검색결과<strong><%=request.getAttribute("totalInquiry")%></strong>건
			</p>


			<div class="list-container">

			
				<div class="mListHeader">
					<div class="gleft">
						<button type="button" class="btn_Wihte"
							onclick=" iAllClickSelect();">전체선택</button>
						<button type="button" class="btn_Wihte"
							onclick=" iAllClickRelease();">선택해제</button>
						<button type="button" class="btn_Wihte" onclick=" iCkDelete()">삭제</button>
					</div>

					<div class="gright" id="numPerPage-container">

						<form name="numPerPageFrm" id="numPerPageFrm"
							action="<%=request.getContextPath()%>/admin/InquiryList">

							<input type="hidden" name="cPage" value="<%=cPage%>"> <select
								name="numPerPage" id="numPerPage">
								<option value="30"
									<%=numPer == null || numPer.equals("30") ? "selected" : ""%>>30개씩
									보기</option>
								<option value="20"
									<%=numPer == null || numPer.equals("20") ? "selected" : ""%>>20개씩
									보기</option>
								<option value="10"
									<%=numPer == null || numPer.equals("10") ? "selected" : ""%>>10개씩
									보기</option>
							</select>

						</form>

					</div>
				</div>
				</br>

				<table class="box">
					<tr>
						<td><input type="checkbox" name="allCheck" id="allck"
							onclick="iAllClick();"></td>
						<td>번호</td>
						<td>제목</td>
						<td>답변상태</td>

					</tr>

					<%
						if (list.isEmpty()) {
					%>
					<tr>
						<td id="conbox" colspan='5'>문의 내용이 존재 하지 않습니다.</td>
					</tr>
					<%
						} else {
					%>

					<%
						for (Inquiry i : list) {
					%>
					<tr>
						<td><input type="checkbox" class="rowCheck" name="iRowCheck" 
							value="<%=i.getI_No()%>"></td>

						<td><%=i.getI_No()%></td>

						<td><a> <%=i.getI_Title()%></a></td>
						</form>


						<%
							if (i.getAnswer_status().equals("Y")) {
						%>
						<td><a
							href="<%=request.getContextPath()%>/admin/InquiryAdminAnswer?ino=<%=i.getI_No()%>">
								<button id="inquiry-btn">답변완료</button>
						</a></td>
						<%
							} else {
						%>
						<td><a
							href="<%=request.getContextPath()%>/admin/inquiryAnswerDetail?no=<%=i.getI_No()%>">
								<button id="inquiry-btn">답변전</button>
						</a></td>

						<%
							}
						%>
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
        var chk = document.getElementsByName("iRowCheck");
        
        function iAllClick(){
         
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
        };
        
        function iAllClickSelect(){
        	 check = true;
             for (var i = 0; i < chk.length; i++) {
                chk[i].checked = true; //모두 체크
             }
        };
        function iAllClickRelease(){
        	  check = false;
              for (var i = 0; i < chk.length; i++) {
                 chk[i].checked = false; //모두 해제
              }
        }

     //글삭제
        function iCkDelete(){	
       	//rowCheck
       	var result = confirm('1:1문의글을 삭제 하시겠습니까?'); 
       	var count=0;
       	var iRowCheck=$(".rowCheck");
       	
   		if(result) { 
	 			for(let i=0; i<iRowCheck.length; i++){
	 				if(iRowCheck[i].checked==true){
	 					count++;
	 				}
	 			}
	 			
	 			if(count==0){
	 				alert("삭제할 글을 선택해주세요.");
	 			}else{
	 				//배열 선언
	 	        	var iCkArray=[];

	 	        	$('input[name="iRowCheck"]:checked').each(function(i){
	 	        		iCkArray.push($(this).val());
	 	        	});	
	 	        	//체크된 리스트 저장
	 	        	console.log(iCkArray);
	 	        	 var objParams = {
	 						"iCkArray" : iCkArray //선텍된 글을 저장
	 	        	}; 
	 	      
	 	        	  $.ajax({
	 	                  url         :   "<%=request.getContextPath()%>/admin/inquiryCheckDelete",
	 	                  dataType    :   "html",
	 	                  contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	 	                  type        :   "post",
	 	                  data        :   objParams,
	 	                  success     :   function(retVal){
					 	     alert(retVal);
					 	     location.replace("<%=request.getContextPath()%>/admin/InquiryList");
	 	                  },
	 	                  error       :   function(request, status, error){
	 	                      			  console.log("AJAX_ERROR");
	 	                  }
	 	              });
	 			}
   		}else {
   			
   		}	
       } 
     
        $(function(){
            $("#allck").click(function(){
               if($("#allck").is(":checked")){
                  $(".rowCheck").prop("checked",true);
               }else{
                  $(".rowCheck").prop("checked",false);
               }
            })
            
         })
             
		//사용자가 조회기간 지정하기		
	   $("#numPerPage").change(()=>{
	        $("#numPerPageFrm").submit();
	     });
				
		
	</script>

</div>

<%@ include file="/views/admin/common/footer.jsp"%>