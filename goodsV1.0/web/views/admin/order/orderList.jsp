<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/header.jsp" %>
<%
	String type=request.getParameter("searchType")!=null?request.getParameter("searchType"):"All";;
	String keyword=request.getParameter("searchKeyword")!=null?request.getParameter("searchKeyword"):"";;
	/* int totalDate=(int)request.getAttribute("totalDate");
	int finderDate=(int)request.getAttribute("finderDate");
	int cPage=(int)request.getAttribute("cPage");
	int numPer=(int)request.getAttribute("numPerPage"); */
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
    div#search_c_no{display:none;}
    div#search_p_name{display:none;}
    div#search_or_name{display:none;}
    div#search_or_date{display:none;}
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
    #one{
    font-weight: bolder;
   		font-size: 30px;
   		}
    
    </style>




<section style="height:auto;">
        <div class="back">

    
        <div class="goodsback">
            <br><br>

            <h1 id="one">주문 전체관리</h1>
            <hr id="gline">
            <br/><br/>
            
            <!-- 회원정보 조회 div -->
            
            <div style="margin-bottom: 30px;">
              <h4 style="font-size: 17px;">주문 조회</h4>
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
                                <th scope="row">주문정보</th>
                                <!-- 개인정보 테이블 바디 -->
                                <td colspan="3">
                                    <!-- 개인정보 테이블 바디 개인정보선택 -->
                                     <select name="search_Type" id="search_Type" class="fSelect">
                                        <option value="All" >전체검색</option>
                                        <option value="c_no" >상품번호</option>
                                        <option value="p_name" >상품명</option>
                                        <option value="or_date" >결제날짜</option>
                                        <option value="or_name" >구매자명</option>
                                    	</select> 
                                    <!-- 개인정보 검색 -->

                                    <div id="search_All">
                                    	<form action="/goods/admin/memberList">
	                                    	<input type="hidden" name="searchType" value="All"/>
	                                    	<input type="text" name="searchKeyword" value="" placeholder="전체 검색" readonly/>
	                                     	<button type="submit" class="btn_Search">검색</button>
                                     	</form>
                                    </div>

                               		 <div id="search_c_no">
                               		 	<form action="/goods/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="c_no"/>
	                                    	<input type="text" name="searchKeyword" value="" placeholder="검색할 상품번호 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
	                                    </form>
                                    </div>
                                     <div id="search_p_name">
                                     	<form action="/goods/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="p_name"/>
	                                    	<input type="text" name="searchKeyword" value="" placeholder="검색할  상품명 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
                                     <div id="search_or_date">
                                     	<form action="/goods/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="or_date"/>
	                                    	<input type="text" name="searchKeyword" value="" placeholder="검색할 구매날짜 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
                                     <div id="search_or_name">
                                     	<form action="/goods/admin/memberFinder">
	                                    	<input type="hidden" name="searchType" value="or_name"/>
	                                    	<input type="text" name="searchKeyword" value="" placeholder="검색할 구매자 입력"/>
	                                    	<button type="submit" class="btn_Search">검색</button>
                                    	</form>
                                    </div>
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
                    <h4 style="font-size: 17px;">주문 목록</h4>
                </div>
                <!-- 총 회원수 및 검색 결과 -->
                <div class="mState">
                    <p class="total">
                        [총 매출 <strong>19</strong>원] 검색결과 
                        <strong>19</strong>원
                    </p>
                </div>
                <!-- 회원목록 박스 헤더 -->
                <div class="mListHeader">
                    <div class="gleft">
                        <button type="button" class="btn_Wihte" onclick="allcheck();">전체선택</button>
                        <button type="button" class="btn_Wihte" onclick="allclear();">선택해제</button>
                        <button type="button" class="btn_Wihte" id="checkdelete">삭제</button>
                    </div>
                    
                    <div class="gright" id="numPerPage-container">
        				<form name="numPerPageFrm" id="numPerPageFrm" style="margin-left:5px" action="/goods/admin/memberFinder">	
        					<input type="hidden" name="cPage" value="1">
        					<input type="hidden" name="searchType" value="">
        					<input type="hidden" name="searchKeyword" value="">														
        					<select name="numPerPage" id="numPerPage">
        						<option value="10" selected>5개씩 보기</option>
        						<option value="20" >10개씩 보기</option>
        						<option value="30" >15개씩 보기</option>
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
                        <col style="width:40px;">
                        <col style="width:auto;">
                        <col style="width:50px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:80px;">
                        <thead>
                            <tr>
                                <th scope="col"><input type="checkbox"></th>
                                <th scope="col">No</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">수량</th>
                                <th scope="col">총가격</th>
                                <th scope="col">구매자</th>     
                                <th scope="col">결제날짜</th>
                                <th scope="col">내역삭제</th>
                            </tr>
                        </thead>
                       
                        <tbody>                        
	                        	<tr>
	                        		<td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="sunmi1926@naver.com"></td>
	                        		
	                        		<td>1</td>
	                        		<td>114</td>
	                        		<td>5</td>
	                        		<td>나는 정</td>
	                        		<td>null</td>
	                        		<td></td>
	                        		<td>
	                        			<button type="button" class="btn_Wihte" onclick="orderDelete();" value="sunmi1926@naver.com">삭제</button>
	                        		</td>
	                        	</tr>	                   
	                        	                         
	                        	<tr>
	                        		<td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="choscien@gmail.com"></td>
	                        		
	                        		<td>2</td>
	                        		<td>113</td>
	                        		<td>5</td>
	                        		<td>지수</td>
	                        		<td>null</td>
	                        		<td></td>
	                        		<td>
	                        			<button type="button" class="btn_Wihte" onclick="orderDelete();" value="choscien@gmail.com">삭제</button>
	                        		</td>
	                        	</tr>	                   
	                        	                         
	                        	<tr>
	                        		<td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="girin@email.com"></td>
	                        		
	                        		<td>3</td>
	                        		<td>84</td>
	                        		<td>5</td>
	                        		<td>기린</td>
	                        		<td>null</td>
	                        		<td></td>
	                        		<td>
	                        			<button type="button" class="btn_Wihte" onclick="orderDelete();" value="girin@email.com">삭제</button>
	                        		</td>
	                        	</tr>	                   
	                        	                         
	                        	<tr>
	                        		<td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="apdlwl1582@naver.com"></td>
	                        		
	                        		<td>4</td>
	                        		<td>82</td>
	                        		<td>5</td>
	                        		<td>재훈</td>
	                        		<td>null</td>
	                        		<td></td>
	                        		<td>
	                        			<button type="button" class="btn_Wihte" onclick="orderDelete();" value="apdlwl1582@naver.com">삭제</button>
	                        		</td>
	                        	</tr>	                   
	                        	                         
	                        	<tr>
	                        		<td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="sciencho@naver.com"></td>
	                        		
	                        		<td>5</td>
	                        		<td>81</td>
	                        		<td>5</td>
	                        		<td>산더미</td>
	                        		<td>null</td>
	                        		<td></td>
	                        		<td>
	                        			<button type="button" class="btn_Wihte" onclick="orderDelete();" value="sciencho@naver.com">삭제</button>
	                        		</td>
	                        	</tr> 
                        </tbody>
                       
                    </table>
                    
                  <!--   <p class="empty">검색한 회원 결과가 없습니다.</p> -->
                </div>
                </form>
				<div id="pageBar" style="width:80%; text-align:center; padding:20px 0;">
        				<span><</span><span class='cPage'>1</span><a href='/goods/admin/memberList?cPage=2&numPerPage=10'>2</a> <span>></span>
        		</div>
		
            </div>
            
            
        </div>
    </div>
    </section>
    <script>
    	//검색목록 나타나기
    	$(function(){
    		$("#search_Type").change(function(){
    			let value=$("#search_Type").val();
    			let all=$("#search_All");
    			let no=$("#search_c_no");
    			let name=$("#search_p_name");
    			let date=$("#search_or_date");
    			let orname=$("#search_or_name");
    			all.hide();
    			no.hide();
    			name.hide();
    			date.hide();
    			orname.hide();
    			$("#search_"+value).css("display","inline-block")
    		})
    	})
    	//전체선택
    	function allcheck(){
    		$(".mRowCheck").prop("checked",true);
    	}
    	//전체해제
    	function allclear(){
    		$(".mRowCheck").prop("checked",false);
    	}
    	//한개삭제
    	function orderDelete(){
    		var result=confirm("주문을 취소하시겠습니까?");
    		var value=$(event.target).val();
    		if(result){
    			location.replace("<%=request.getContextPath()%>/admin/orderListDelete?no="+value+"?type="+type+"keyword="+keyword);
    		}
    	}
    	//선택삭제
    	$(function(){
    		$("#checkdelete").click(function(){
    			
    		})
    	})
    </script>

<%@ include file="/views/admin/common/footer.jsp" %>