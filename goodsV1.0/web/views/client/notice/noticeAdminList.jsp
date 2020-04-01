<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/header.jsp" %>
<%@ page import="java.util.List,com.web.notice.model.vo.Notice" %>

<%
   List<Notice> list=(List)request.getAttribute("list");
   String type=request.getParameter("searchType")!=null?request.getParameter("searchType"):"All";;
   String keyword=request.getParameter("searchKeyword")!=null?request.getParameter("searchKeyword"):"";;
   int totalDate=(int)request.getAttribute("totalDate");
   int finderDate=(int)request.getAttribute("finderDate");
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
    div#search_n_title{display:none;}
    div#search_n_writer{display:none;}
    div#search_n_no{display:none;}
    
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
   		clear:both;
   		content:"";
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
   .numPer{
   		padding: 7px 15px;
   		width: 80%;
   		float:right;	
   }
   #numPerPageFem{
   	margin-botton:10px;
   }
   /* 회원목록 버튼 div스타일 */
   .gleft{
         margin-top:2.5px;
        float: left;
        text-align: left;
        display: inline-block;
   }
   .gright{
         font-size:12px;
         width: 430px;
   	 	padding-right: 220px;
    	padding-top: 50px;
    	  text-align: right;
   }
   .write{
   		 padding-top:3px;
         padding-bottom:2px;
         font-size:12px;
         text-align:rigth;    
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
        border-right: 1px solid #d9dadc;
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
	/* 공지사항 관리 글귀 */
	#one{
		font-weight: bolder;
   		font-size: 30px;
	}
	.item{
		float:left;
	}
    </style>




<section style="height:auto;">
        <div class="back">

    
        <div class="goodsback">
            <br><br>

            <h1 id="one">게시판조회/목록</h1>
            <hr id="gline">
            <br/><br/>
            
            <!-- 회원정보 조회 div -->
            
            <div style="margin-bottom: 30px;">
              <h4 style="font-size: 17px;">게시판 조회</h4>
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
                                     <select name="search_Type" id="search_Type" class="fSelect">
                                        <option value="All" <%=type==null||type.equals("All")?"selected":"" %>>전체검색</option>
                                        <option value="n_title" <%=type!=null&&type.equals("n_title")?"selected":"" %>>제목</option>
                                        <option value="n_writer" <%=type!=null&&type.equals("n_writer")?"selected":"" %>>작성자</option>
                                        <option value="n_no" <%=type!=null&&type.equals("n_no")?"selected":"" %>>번호</option>
                                       </select>
                                    <!-- 개인정보 검색 -->

                                    <div id="search_All">
                                       <form action="<%=request.getContextPath()%>/admin/noticeList">
                                          <input type="hidden" name="searchType" value="All"/>
                                          <input type="text" name="searchKeyword"  placeholder="전체 검색" readonly/>
                                           <button type="submit" class="btn_Search">검색</button>
                                        </form>
                                    </div>

                                      <div id="search_n_title">
                                         <form action="<%=request.getContextPath()%>/admin/noticeFinder">
                                          <input type="hidden" name="searchType" value="n_title"/>
                                          <input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("n_title")?keyword:""%>" placeholder="검색할 제목 입력"/>
                                          <button type="submit" class="btn_Search">검색</button>
                                       </form>
                                    </div>
                                     <div id="search_n_writer">
                                        <form action="<%=request.getContextPath()%>/admin/noticeFinder">
                                          <input type="hidden" name="searchType" value="n_writer"/>
                                          <input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("n_writer")?keyword:""%>" placeholder="검색할  작성자 입력"/>
                                          <button type="submit" class="btn_Search">검색</button>
                                       </form>
                                    </div>
                                     <div id="search_n_no">
                                        <form action="<%=request.getContextPath()%>/admin/noticeFinder">
                                          <input type="hidden" name="searchType" value="n_no"/>
                                          <input type="text" name="searchKeyword" value="<%=type!=null&&type.equals("n_no")?keyword:""%>" placeholder="검색할 번호 입력"/>
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
            <div style="margin-bottom: 150px;">
                <div class="float">
	                <div class="item">
		                <div class="mListTitle">
		                <!-- 회원목록 타이틀 -->
		                    <h4 style="font-size: 17px;">게시판 목록</h4>
		                </div>
		                <!-- 총 회원수 및 검색 결과 -->
		                <div class="mState" style="display:inline-block">
		                    <p class="total">
		                        [총 게시판목록 <strong><%=totalDate%></strong>명] 검색결과 
		                        <strong><%=finderDate%></strong>건
		                    </p>
		                </div>
	                </div>
	                <div class="gright numPer" id="numPerPage-container" >
	                    <form name="numPerPageFrm" id="numPerPageFrm" style="margin-left:5px" action="<%=request.getContextPath()%>/admin/<%=type==null||type.equals("All")?"noticeList":"noticeFinder"%>">   
	                       <input type="hidden" name="cPage" value="<%=cPage%>">
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
                
                <!-- 회원목록 박스 헤더 -->
                <div class="mListHeader">
                    <div class="gleft">
                        <button type="button" class="btn_Wihte" id="allcheck" >전체선택</button>
                        <button type="button" class="btn_Wihte" id="removecheck" >선택해제</button>
                        <button type="button" class="btn_Wihte" id="checkDelete">삭제</button>
                    </div>
                    <div class="write" style="text-align:right">
                    	<button type="button" class="btn_Wihte" id="write">글쓰기</button>
                        <button type="button" class="btn_Wihte" id="writeup">글수정</button>
                    </div>
                    
                </div>
                <!-- 회원목록 박스 바디 -->
                <form id="ckvalue">
                <div class="mlist"> 
                    <table border="1" style="width: 875px;" class="tbodyCenter">
                        <col style="width:30px;">
                        <col style="width:90px;">
                        <col style="width:auto;">
                        <col style="width:50px">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:100px">
                        <thead>
                            <tr>
                                <th scope="col"><input type="checkbox" class="mRowCheck"></th>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">첨부파일</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                                <th scope="col">글삭제</th>
                            </tr>
                        </thead>
                                         
                        <tbody>
                        <%if (list.isEmpty()) {%>
                             <tr>
                              <td id="conbox" colspan='7'>
                                 <p style="padding:30px 0; margin:0;">검색된 회원 내역이 없습니다.</p>
                              </td>
                           </tr>
                        <%} else { %>
                           <%for(Notice m : list){ %>                            
                              <tr>
                                 <td><input class="mRowCheck" name="mRowCheck" type="checkbox" value="<%=m.getnNo()%>"></td>
                                 
                                 <td><%=m.getnNo()%></td>
                                 <td><a href="<%=request.getContextPath()%>/notice/noticeView?nNo=<%=m.getnNo()%>">
                					<%=m.getnTitle() %>
                				</a>
                				</td>
                				<td><%if(m.getnOriginalFile()!=null){ %>
                					<img src="<%=request.getContextPath()%>/images/notice/file.png" width="15px" height="15px">
                					<%}else{ %>
                						X
                					<%} %>
                					
                				</td>
                                 <td><%=m.getnWriter()%></td>
                                 <td><%=m.getnDate()%></td>
                                 <td>
                                    <button type="button" class="btn_Wihte" onclick="noticeDelete();" value="<%=m.getnNo()%>">삭제</button>
                                 </td>
                              </tr>                      
                           <%} %>
                       <%} %>
                        </tbody>
              
                    </table>
                    
                  <!--   <p class="empty">검색한 회원 결과가 없습니다.</p> -->
                </div>
                </form>

            <div id="pageBar">
                    <%=request.getAttribute("pageBar") %>
            </div>
            </div>
        </div>
    </div>
    </section>
   <script>
   		//글쓰기
   		$(function(){
   			$("#write").click(function(){
   				location.replace("<%=request.getContextPath()%>/admin/noticeWrite");
   			})
   		})
   		//검색기능
   		//검색기능 나오게하기
   		$(function(){
   			$("#search_Type").change(function(){
   				let value=$("#search_Type").val();
   				let all=$("#search_All");
   				let writer=$("#search_n_writer");
   				let no=$("#search_n_no");
   				let title=$("#search_n_title");
   				all.hide();
   				writer.hide();
   				no.hide();
   				title.hide();
   				console.log(value);
   				$("#search_"+value).css("display","inline-block");
   			})
   		})
   		
   		
   		//전체선택
   		$(function(){
   			$("#allcheck").click(function(){
   				$(".mRowCheck").prop("checked",true);
   			})
   		})
   		//전체해제
   		$(function(){
   			$("#removecheck").click(function(){
   				$(".mRowCheck").prop("checked",false);
   			})
   		})
   		
   		//한개삭제
   		function noticeDelete(){
   			var result=confirm('글을 삭제하시겠습니까?');
   			var value=$(event.target).val();
   			if(result){
   				location.replace("<%=request.getContextPath()%>/admin/noticeDelete?no="+value);
   			}
   		}
   		//선택한 항목삭제 및 수정하기
   		$(function(){
   			$("#checkDelete").click(function(){
   				$("#ckvalue").attr("action","<%=request.getContextPath()%>/admin/allDelete")
   				$("#ckvalue").submit();
   			})
   		})
   		$(function(){
   			$("#writeup").click(function(){
   				$("#ckvalue").attr("action","<%=request.getContextPath()%>/admin/noticeUpdate")
   				if($("[name=mRowCheck]:checked").length==1){
   				$("#ckvalue").submit();
   				}else if($("[name=mRowCheck]:checked").length==0){
   					alert("수정할 글을 선택하시오!");
   				}else{
   					alert("한개만 선택하시오");
   				}
   			})
   		})
   	 	
   		$(function(){
   			$("#numPerPage").change(function(){
   				$("#numPerPageFrm").submit();
   			})
   		})
   		</script>




<%@ include file="/views/admin/common/footer.jsp" %>