<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/header.jsp" %>

<%@ page import="java.util.List,com.web.member.model.vo.Member" %>

<%
	List<Member> list=(List)request.getAttribute("list");
	//String type=request.getParameter("searchType")!=null?request.getParameter("searchType"):"";
	//String keyword=request.getParameter("searchKeyword")!=null?request.getParameter("searchKeyword"):"";
	int totalMember=(int)request.getAttribute("totalMember");
	int deleteMember=(int)request.getAttribute("deleteMember");
	int todayEnrollMember=(int)request.getAttribute("todayEnrollMember");
	int visitMember=(int)request.getAttribute("visitMember");
	//int finderMember=(int)request.getAttribute("finderMember");
	//int cPage=(int)request.getAttribute("cPage");
	//int numPer=(int)request.getAttribute("numPerPage");
%>
 
    <style>

    *{    
        margin: 0; 
    }
    
     body{
        width: 1366px;
        height: auto;
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
    /* 회원 현황 스타일 */
    .dashpannel{
        margin: 0 0 45px;
    }
    /* 회원현황 헤더부분 */
    .dashpannel .header {
        display: -webkit-flex;
        display: -ms-flex;
        display: flex;
        -webkit-align-items: stretch;
        -ms-align-items: stretch;
        align-items: stretch;
        width: 80%;
        padding: 0 8px 0 0;
        border: 1px solid #7a9fd1;
        color: #fff;
        box-sizing: border-box;
        background: #87afe3;
    }
    /* 회원현황 타이틀 */
    .dashpannel .header > .title {
        -webkit-flex: 1;
        -ms-flex: 1;
        flex: 1;
        float: left;
        padding: 10px 10px 8px;
    }
    /* 회원현황 소제목 내용 스타일 */
    tr.trheader>th{
        padding: 11px 10px 8px;
        border-left: 1px solid #cdcdcd;
        border-right: 1px solid #cdcdcd;
        border-bottom: 1px solid #cdcdcd;
        font-size: 12px;
        color: #354c84;
        background: #e4e7f1;
    }
    table{
    table-layout: fixed;
    width: 80%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    }
    /* 회원현황 소제목 테이블 스타일  */
    .contenttable{
    table-layout: fixed;
    width: 80%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    }
    /* 회원현황 바디 부분 스타일 */
    .contenttable>tbody>tr>td{
        border-left: 1px solid #d9dadc;
        padding: 13px 10px;
        border-right: 1px solid #d9dadc;
        border-bottom: 1px solid #d9dadc;
        font-size: 12px;
        color: #1c1c1c;
        background: #fff;
    }
    /* 각 명수 em 스타일 */
    .contenttable>tbody>tr>td>em{
        border-bottom: 1px solid #568cd0;
        margin-bottom: 5px;
        color: #1b87d4;
        font-style: normal;
        font-weight: normal;
        font-size: 22px;
        line-height: 1.25;
        text-decoration: none;
    }
    /* 신규회원 테이블 헤더 스타일 */
    .box>thead>tr>th{
        border: 1px solid #bbc0c4;
        color: #80878d;
        text-align: center;
        vertical-align: middle;
        background-color: #f5f4f4;
        padding: 9px 9px 7px;
        vertical-align: top;
        font-weight: normal;
        font-size: 13px;
    }
    
    /* 테이블 위치 */
    .text{
        position: relative;
        top: 30px;
    
    }

    
    /* 신규회원 테이블 크기 */
    .box{
        width: 80%;
        border-top: 1px solid #adadad;
        border-bottom:  1px solid #adadad;
        border-collapse: collapse;
        text-align: center;
        line-height: 1.5;
    }
    /* 신규회원 테이블 바디 스타일 */
    .box>tbody>tr>td{
        border-top-width: 0;
        border: 1px solid #d9dadc;
        padding: 9px 9px 7px;
        vertical-align: top;
        font-size: 13px;
    }

    </style>





  <section style="height:850px;">
        <div class="back">

        

        <div class="goodsback">
            <br><br>
            <h1 id="one">회원방문/가입 현황</h1>
            <hr id="gline">
            <br><br>
            <div class='dashpannel'>
                <div class="header">
                    <div class="title">
                        <h4>회원현황</h4>
                    </div>
                </div>

                <div class="content1">
                    <table boder="1" summary class="contenttable">
                        <!-- <caption>회원현황</caption> -->
                        <colgroup>
                        <col style="width: 25%;">
                        <col style="width: 25%;">
                        <col style="width: 25%;">
                        <col style="width: 25%;">
                        </colgroup>
                        <thead>
                            <tr class="trheader">
                                <th scope="col">신규회원(today)</th>
                                <th scope="col">방문회원(today)</th>
                                <th scope="col">탈퇴회원</th>
                                <th scope="col">TOTAL</th>
                            </tr>
                        </thead>
                        <tbody style="text-align: right;">
                            <tr>
                                <td>
                                    <em><%=todayEnrollMember%></em>&nbsp;명
                                </td>
                                <td>
                                    <em><%=visitMember %></em>&nbsp;명
                                </td>
                                <td>
                                    <em><%=deleteMember%></em>&nbsp;명
                                </td>
                                <td>
                                    <em><%=totalMember%></em>&nbsp;명
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            
            <div class="text">
                <form>
                <table class="box">
                    최근 가입한 회원
                    <br><br>
                    <colgroup>
                        <col style="width: 150px;">
                        <col style="width: 150px;">
                        <col style="width: 150px;">
                        <col style="width: 150px;">
                        <col style="width: auto;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>가입일</th> 
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>닉네임</th>      
                            <th>이메일</th>                 
                        </tr>
                    </thead> 
                    <tbody>
                     <%for(Member m : list){ %>	   
                        <tr>
                 			<td><%=m.getM_Enroll() %></td>
	                        <td><%=m.getM_No() %></td>
	                        <td><%=m.getM_Name() %></td>
	                        <td><%=m.getM_NickName() %></td>
                            <td><%=m.getM_Email() %></td>
                        </tr>
					<%} %>
                    </tbody>
                </table>
            </form>
            </div>
        </div>
    </div>
    </section>









<%@ include file="/views/admin/common/footer.jsp" %>