<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/header.jsp" %>
<%@ page import="java.util.List,com.web.member.model.vo.Member" %>

<%
	List<Member> list=(List)request.getAttribute("list");
	String type=request.getParameter("searchType")!=null?request.getParameter("searchType"):"";
	String keyword=request.getParameter("searchKeyword")!=null?request.getParameter("searchKeyword"):"";
	int totalMember=(int)request.getAttribute("totalMember");
	int finderMember=(int)request.getAttribute("finderMember");
	int cPage=(int)request.getAttribute("cPage");
	int numPer=(int)request.getAttribute("numPerPage");
%>

   <style>

    *{    
        margin: 0; 
    }

    body{
        width: 1366px;
        height: auto;
    }
    button {
            /* 버튼 색 */
            background-color: transparent;
            /* 버튼 외곽선 */
            border: none;
            /* 커서 변화 */
            cursor: pointer;
            /* 버튼 폰트 사이즈 및 폰트 
            일괄 적용이 불가능하여 따로 설정함 */
            font-size: 12px;
            font-family: "Nanum Gothic";

        }
    input{
        font-size: 12px;
        font-family: "Nanum Gothic";
        color: #111;
        vertical-align: middle;
    }
	 .back {
            height: 100%;
            width: 80%;
            position: relative;
            top:50px;
            bottom:50px;
            display: flex;
            left:360px;
        }
       
         /* 밑에 라인 */
    #gline{
        border: 1px solid rgb(177, 174, 174);
        position: relative;
        top: 20px;
        width: 80%;
    }

      


    .goodsback{
        width: 100%;
    }
    /* 테이블 스타일 */
    table{
    table-layout: fixed;
    width: 80%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    }
    table.tbodyCenter td{
    	font-size:14px;
    	padding: 9px 9px 7px;
    	vertical-align: top;
    	text-align: center;
    }
    /* 회원정보 조회 스타일  */
    .memberSearch{
        display: block;
    }
    /* 회원정보 조회테이블 스타일 */
    div.memberSearch>table{
        line-height: 1.5;
        background-color: #fff;
    }
    /* 회원정보 조회테이블 소제목 */
    .memberSearch th{
        font-weight: normal;
        /* vertical-align: top; */
        background-color: #f5f4f4;
        padding: 9px 9px 9px;
        border: 1px solid #d9dadc;
        text-align: left;
        font-family: "돋움",Dotum,sans-serif;
        font-size: 13px;
    }
    /* 회원정보 조회테이블 내용 */
    .memberSearch td{
        padding: 8px 9px 10px;
        border: 1px solid #d9dadc;
        text-align: left;
        font-size: 12px;
    }
    /* 회원정보로 조회 셀렉 옵션 리스트 스타일 */
    .fSelect{
        display: inline;
        margin-right: 5px;
        height: 29px;
        line-height: 22px;
        max-width: 100%;
        font-size: 12px;
        font-family: "돋움",Dotum,sans-serif;
        color: #111;
        vertical-align: middle;
    }
    /* 회원정보 조회 인풋 스타일  */
    .fText{
        max-width: 100%;
        height: 22px;
        padding: 0 5px;
        line-height: 22px;
        box-sizing: border-box;
        border: 1px solid #a7a7a7;
        border-right-color: #cfcfcf;
        border-bottom-color: #cfcfcf;
        outline: 0 none;
        width: 200px;
    }

    /* 성별 스타일 전체 */
    .eSelected {
    font-weight: bold;
    letter-spacing: -1px;
    }
    /* 성별 스타일 전체/남/여 */
    .gLabel{
        padding-right: 20px;
        display: inline-block;
        outline: 0 none;
    }
    /* 주문상품 a태그 스타일 */
    .btnNomal{
        display: inline-block;
        position: relative;
        text-align: center;
        vertical-align: middle;
        text-decoration: none;
        white-space: nowrap;
        box-sizing: border-box;
        cursor: pointer;
        height: 22px;
    }
    /* 주문상품 a태그 안에 span 스타일 */
    .btnNomal>span{
        padding: 2px 6px;
        color: #1c1c1c;
        font-size: 12px;
        font-weight: normal;
        line-height: 22px;
        border: 1px solid #cacaca;
        background-color: #f8f8f8;
    }
    /* 예시 text 스타일 */
   .textInfo{
        margin: 0 0 0 10px;
        color: #898989;
        font-size: 11px;
        font-style: normal;
   }

   /* 검색버튼 div스타일 */
   .btnSearch{
        position: relative;
        margin: 40px 0;
        padding: 0 4px 0 0;
        width: 80%;
        text-align: center;
   }
   /* 검색버튼 스타일 */
   .btn_Search{
   		margin-left: 10px;
        padding: 0 15px;
        line-height: 27px;
        font-size: 12px;
        color: #eee;
        text-align: center;
        background-color: #404f6a;
        border: 1px solid #404f6a;
   }



   /* 회원목록 스타일 시작 */

   /* 회원목록 타이틀 div 스타일 */
   .mListTitle{
        position: relative;
        margin: 18px 0px 10px;
        
   }
   /* 회원목록 타이틀 밑 총 회원수 및 검색결과 div스타일 */
   .mState{
        line-height: 20px;
        margin: 7px 0px;
   }
   /* 회원목록 총 회원수 및 검색결과 스타일 */
   .total{
        /* float: left; */
        font-size: 12px;
        font-family: "Nanum Gothic";
        color: rgb(49, 49, 49);
        margin: 2px 8px 0px 0px;
   }
   .total>strong{
        color: rgb(255, 109, 1);
   }

 	div#search_All{display:inline-block;}
    div#search_m_Name{display:none;}
    div#search_m_Email{display:none;}
    div#search_m_Enroll{display:none;}
    div#search_m_NickName{display:none;}
    div#search_m_No{display:none;}
    div#search_m_Phone{display:none;}
    
    #numPerPage{
    	padding:4px;
    }
    
 	td>div>form>input{
 		width:250px;
 		height:29px;
 		padding-left:5px;
 	}
   /* 회원목록 리스트상자 헤더 */
   .mListHeader{
        padding: 7px 15px;
        padding-bottom:10px;
        border: 1px solid #bcbfc4;
        line-height: 21px;
        text-align: center;
        background: #dfe3e6;
        position: relative;
        z-index: 1;
        margin-bottom: -1px;
        width: 80%;
   }
   /* 회원목록 버튼 div스타일 */
   .gleft{
   		margin-top:2.5px;
        float: left;
        text-align: left;
        display: inline-block;
   }
   .gright{
   		padding-top:3px;
   		padding-bottom:2px;
   		text-align: right;
   		font-size:12px;
   }
    /* 회원목록 헤더 버튼 스타일 */
    .btn_Wihte{
        padding: 3px 10px;
        /* line-height: 32px; */
        font-size: 12px;
        color: rgb(0, 0, 0);
        text-align: center;
        background-color: white;
        border: 1px solid rgb(161, 161, 161);
   }
   /* 회원목록 리스트 내용 div스타일 */
   .mlist{
        position: relative;
        overflow: auto;
        /* border-right: 1px solid #d9dadc; */
        border-left: 1px solid #d9dadc;
   }
    /* 회원목록 테이블스타일 */
   .mlist>table{
        background-color: #fff;
        margin-left: -1px;
   }
   .mlist>table>thead>tr>th{
        border: 1px solid #bbc0c4;
        color: #80878d;
        text-align: center;
        vertical-align: middle;
        font-weight: normal;
        font-size: 13px;
        background-color: #f5f4f4;
        padding:9px 10px 7px;
   }
   /* 회원목록 검색결과 x 스타일 */
   .empty{
        width: 839.2px;
        display: block;
        border: 1px solid #d9dadc;
        /* border-right-width: 0; */
        border-left-width: 0px;
        margin-top: 0;
        border-top-width: 0px;
        padding: 50px 0;
        text-align: center;
   }
   
   /* 페이지바 */
    #pageBar{
      width:80%;
      margin: 40px 0 40px 0;
      text-align:center;
   }
   #pageBar>a,#pageBar>span{
      width: 40px;
       height: 40px;
       text-align: center;
       line-height: 40px;
       border: 1px solid #d5d5d5;
       color: #999;
       background-color: #fff;
       margin: 0 2px;
       position: relative;
       font-size: 13px;
       font-family: "YoonGothicPro760";
       display: inline-block;
       vertical-align: top;
   }
    /* 페이지바 cpage span */
    #pageBar>span.cPage{
    	border: 1px solid #191919;
    	color: #191919;
    }
    
    </style>




<section style="height:auto; padding-bottom:100px;">
        <div class="back">

    
        <div class="goodsback">
            <br><br>

            <h1 id="one">회원조회/목록</h1>
            <hr id="gline">
            <br/><br/>
            
            <!-- 회원정보 조회 div -->
            
            <div style="margin-bottom: 30px;">
              <h4 style="font-size: 17px;">회원 조회</h4>
                <div class="memberSearch">
                    <!-- 회원정보 조회 테이블 -->
                    <table border="1" summary >
                        <colgroup>
                            <col style="width:145px;">
                            <col style="width:auto;">
                            <col style="width:145px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <!-- 개인정보 테이블헤더 -->
                                <th scope="row">개인정보</th>
                                <!-- 개인정보 테이블 바디 -->
                                <td colspan="3">
                                    <!-- 개인정보 테이블 바디 개인정보선택 -->
                                     <select name="serach_Type" id="serach_Type" class="fSelect">
                                        <option value="All" <%=type!=null&&type.equals("All")?"selected":"" %>>전체검색</option>
                                        <option value="m_Name" <%=type!=null&&type.equals("m_Name")?"selected":"" %>>이름</option>
                                        <option value="m_Email" <%=type!=null&&type.equals("m_Email")?"selected":"" %>>이메일</option>
                                        <option value="m_Enroll" <%=type!=null&&type.equals("m_Enroll")?"selected":"" %>>가입일</option>
                                        <option value="m_NickName" <%=type!=null&&type.equals("m_NickName")?"selected":"" %>>닉네임</option>
                                        <option value="m_No" <%=type!=null&&type.equals("m_No")?"selected":"" %>>회원번호</option>
                               <%--          <option value="m_Phone" <%=type!=null&&type.equals("m_Phone")?"selected":"" %>>전화번호</option> --%>
                                    	</select> 
                                    <!-- 개인정보 검색 -->

                                    <div id="search_All">
                                    	<form action="<%=request.getContextPath()%>/admin/memberList">
	                                    	<input type="hidden" name="searchType" value="All"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("All")?keyword:""%>" placeholder="전체 검색" readonly/>
	                                     	<button type="submit" class="btn_Search">검색</button>
                                     	</form>
                                    </div>

                               		 <div id="search_m_Name">
                               		 	<form action="<%=request.getContextPath()%>/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="m_Name"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("m_Name")?keyword:""%>" placeholder="검색할 이름 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
	                                    </form>
                                    </div>
                                     <div id="search_m_Email">
                                     	<form action="<%=request.getContextPath()%>/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="m_Email"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("m_Email")?keyword:""%>" placeholder="검색할  이메일 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
                                     <div id="search_m_Enroll">
                                     	<form action="<%=request.getContextPath()%>/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="m_Enroll"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("m_Enroll")?keyword:""%>" placeholder="검색할 가입일 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
                                     <div id="search_m_NickName">
                                     	<form action="<%=request.getContextPath()%>/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="m_NickName"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("m_NickName")?keyword:""%>" placeholder="검색할 닉네임 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
                                     <div id="search_m_No">
                                     	<form action="<%=request.getContextPath()%>/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="m_No"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("m_No")?keyword:""%>" placeholder="검색할 회원번호 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
                                  <%--    <div id="search_m_Phone">
                                     	<form action="<%=request.getContextPath()%>/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="m_Phone"/>
	                                    	<input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("m_Phone")?keyword:""%>" placeholder="검색할 전화번호 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div> --%>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
               
            </div>

            <!-- 회원 목록 div -->
            <div style="margin-bottom: 30px;">
                <div class="mListTitle">
                <!-- 회원목록 타이틀 -->
                    <h4 style="font-size: 17px;">회원 목록</h4>
                </div>
                <!-- 총 회원수 및 검색 결과 -->
                <div class="mState">
                    <p class="total">
                        [총 회원수 <strong><%=totalMember%></strong>명] 검색결과 
                        <strong><%=finderMember%></strong>건
                    </p>
                </div>
                <!-- 회원목록 박스 헤더 -->
                <div class="mListHeader">
                    <div class="gleft">
                        <button type="button" class="btn_Wihte" onclick=" mAllClickSelect()">전체선택</button>
                        <button type="button" class="btn_Wihte" onclick=" mAllClickRelease()">선택해제</button>
                        <button type="button" class="btn_Wihte" onclick=" mCkDelete()">삭제</button>
                    </div>
                    
                    <div class="gright" id="numPerPage-container">
        				<form name="numPerPageFrm" id="numPerPageFrm" style="margin-left:5px" action="<%=request.getContextPath()%>/admin/<%=type==""||type.equals("All")?"memberList":"memberFinder"%>">	
        					<input type="hidden" name="cPage" value="1">
        					<input type="hidden" name="searchType" value="<%=type%>">
        					<input type="hidden" name="searchKeyword" value="<%=keyword%>">														
        					<select name="numPerPage" id="numPerPage">
        						<option value="10" <%=numPer==10?"selected":"" %>>10개씩 보기</option>
        						<option value="20" <%=numPer==20?"selected":"" %>>20개씩 보기</option>
        						<option value="30" <%=numPer==30?"selected":"" %>>30개씩 보기</option>
        					</select>
        					
        			<!-- select선택을하면 데이터 출력갯수가 옵션값으로 변경 -->
        		</form>

        	</div>
                </div>
                <!-- 회원목록 박스 바디 -->
                <form>
                <div class="mlist"> 
                    <table border="1" style="width: 875px;" class="tbodyCenter">
                        <col style="width:30px;">
                        <col style="width:90px;">
                        <col style="width:90px;">
                        <col style="width:100px;">
                        <col style="width:130px;">
                        <col style="width:auto;">
                        <col style="width:155px;">
                        <thead>
                            <tr>
                                <th scope="col"><input type="checkbox"  onclick="mAllClick()"></th>
                                <th scope="col">가입일</th>
                                <th scope="col">회원번호</th>
                                <th scope="col">이름</th>
                                <th scope="col">아이디</th>
                                <th scope="col">이메일</th>
                                <th scope="col">회원삭제</th>
                            </tr>
                        </thead>
                       
                        <tbody>
                        <%if (list.isEmpty()) {%>
          	       			<tr>
                     			<td id="conbox" colspan='8'>
                     				<p style="padding:30px 0; margin:0;">검색된 회원 내역이 없습니다.</p>
                     			</td>
                  			</tr>
                  		<%} else { %>
	                        <%for(Member m : list){ %>	                         
	                        	<tr>
	                        		<td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="<%=m.getM_Email()%>"></td>
	                        		
	                        		<td><%=m.getM_Enroll() %></td>
	                        		<td><%=m.getM_No() %></td>
	                        		<td><%=m.getM_Name() %></td>
	                        		<td><%=m.getM_NickName() %></td>
	                        		<td><%=m.getM_Email() %></td>
	                        		<td>
	                        			<button type="button" class="btn_Wihte" onclick="memberDelete();" value="<%=m.getM_Email()%>">삭제</button>
	                        		</td>
	                        	</tr>	                   
	                        <%} %>
	                    <%} %>
                        </tbody>
                       
                    </table>
                    
                  <!--   <p class="empty">검색한 회원 결과가 없습니다.</p> -->
                </div>
                </form>
				<div id="pageBar" style="width:80%; text-align:center; padding:20px 0;">
        				<%=request.getAttribute("pageBar") %>
        		</div>
		
            </div>
            
            
        </div>
    </div>
    </section>
	<script>
      	$(function(){
      		$("#serach_Type").change(()=>{
      			//console.log($(event.target).val());
      			let type=$("#serach_Type").val();
      			let sarchAll=$("#search_All");
      			let mName=$("#search_m_Name");
      			let mEmail=$("#search_m_Email");
      			let mEnroll=$("#search_m_Enroll");
      			let mNickName=$("#search_m_NickName");
      			let mNo=$("#search_m_No");
      			let mPhone=$("#search_m_Phone");
      			sarchAll.hide();
      			mName.hide();
      			mEmail.hide();
      			mEnroll.hide();
      			mNickName.hide();
      			mNo.hide();
      			mPhone.hide();	
      			$("#search_"+type).css("display","inline-block");
      		})
      		 $("#serach_Type").trigger("change"); 
      		/* 떳다 사라짐 들어갈때 실행이됨 */
      	});
      	
      	$(function(){
      	   
			$("#numPerPage").change(function(){
				$("#numPerPageFrm").submit();
			});
		});
      	
      //체크박스 전체선택하기
        var check = false;
        var chk = document.getElementsByName("mRowCheck");
        function mAllClick(){
         
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
        function mAllClickSelect(){
        	 check = true;
             for (var i = 0; i < chk.length; i++) {
                chk[i].checked = true; //모두 체크
             }
        };
        function mAllClickRelease(){
        	  check = false;
              for (var i = 0; i < chk.length; i++) {
                 chk[i].checked = false; //모두 해제
              }
        }
        
        //멤버 삭제
        function memberDelete(){
    		var result = confirm('회원을 탈퇴시키겠습니까?'); 
    		if(result) { 
				var deleteMail=$(event.target).val();
    			location.replace("<%=request.getContextPath()%>/admin/memberDelete?m_Email="+deleteMail);
    		} else {
    		}	
    	}
      <%--   function mCkDelete(){
        	//배열 선언
        	var memCkArray = [];
        
        	$('input[name="mRowCheck"]:checked').each(function(i){
        		memCkArray.push($(this).val());
        	});	//체크된 리스트 저장
        	console.log(memCkArray);
        	 var objParams = {
					"memCkArray" : memCkArray //선텍멤버 저장
        	}; 
        	//ajax호출
        	  $.ajax({
                  url         :   "<%=request.getContextPath()%>/admin/memberCkDelete",
                  dataType    :   "json",
                  contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                  type        :   "post",
                  data        :   objParams,
                  success     :   function(retVal){
                      if(retVal.code == "OK") {
                          alert(retVal.message);
                      } else {
                          alert(retVal.message);
                      }   
                  },
                  error       :   function(request, status, error){
                      console.log("AJAX_ERROR");
                  }
              });
        } --%>
        
        //멤버삭제 위에 버튼
         function mCkDelete(){	
        	//mRowCheck
        	var result = confirm('회원을 탈퇴시키겠습니까?'); 
        	var count=0;
        	var mRowCheck=$(".mRowCheck");
        	var memRowCheck=$(".memRowCheck");
    		if(result) { 
	 			for(let i=0;i<mRowCheck.length;i++){
	 				if(mRowCheck[i].checked==true){
	 					count++;
	 				}
	 			}
	 			if(count==0){
	 				alert("삭제할 회원을 체크해주세요.");
	 			}else{
	 				//배열 선언
	 	        	var memCkArray = [];

	 	        	$('input[name="mRowCheck"]:checked').each(function(i){
	 	        		memCkArray.push($(this).val());
	 	        	});	//체크된 리스트 저장
	 	        	//console.log(memCkArray);
	 	        	 var objParams = {
	 						"memCkArray" : memCkArray //선텍멤버 저장
	 	        	}; 
	 	        	//ajax호출
	 	        	  $.ajax({
	 	                  url         :   "<%=request.getContextPath()%>/admin/memberCkDelete",
	 	                  dataType    :   "html",
	 	                  contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	 	                  type        :   "post",
	 	                  data        :   objParams,
	 	                  success     :   function(retVal){
	 	                	  alert(retVal);
	 	                	 location.replace("<%=request.getContextPath()%>/admin/memberList");
	 	                  },
	 	                  error       :   function(request, status, error){
	 	                      console.log("AJAX_ERROR");
	 	                  }
	 	              });
	 			}
    		}else {
    			
    		}	
        } 

        
        /*  $.each($(".mRowCheck"),function(i,item){
		item.check==true;
		fd.append("ck",item.value)
	})  */
	
      </script>







<%@ include file="/views/admin/common/footer.jsp" %>