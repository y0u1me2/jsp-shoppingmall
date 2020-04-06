<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>
<%@ page import="java.util.List,com.web.faq.model.vo.*" %>
<%
		List<FAQ> list=(List)request.getAttribute("faq");
%>
<script src="js/jquery-3.4.1.min.js"></script>
    <style>
        section {
            position: relative;
            left: 10%;
            display: inline-flex;
            /* border: 1px solid blue; */
            width: 80%;
/*             height: 50%;
 */        }

        /*CONTACT US 고객센터 번호 및 이메일 휴일안내 */
        
        .goto {
            position: relative;
            bottom: 382px;
            left: 600px;
        }

        /* .box {
            border: 1px solid red;
        } */

        /*고객센터Home , 공지사항 등 */
        .aside {
            /* border: 1px solid hotpink; */
            width: 20%;
            height: 100%;
            line-height: 130%;
        }

        .aside2 {
            /* border: 1px solid hotpink; */
            width: 8%;
            height: 100%;
            line-height: 130%;
        }



        .line {
            border-bottom: 1px solid silver;
            text-align: center;
        }


        /*FAQ 자주하는 질문 아래로 내리는 style*/
        /* 리스트 스타일 동그라미 없애기 ol스타일임 */
        .faq-list {
            list-style: none;
            padding: 0;
            /* position: relative; */
        }

        /* 각 ol밑에 list부분 스타일 */
        .golo {
            background-color: whitesmoke;
            /* 리스트 안에 div 넣음, list 포지션 릴레이티브 하고 + 표시 앱솔하면
            +표시만 리스트 틀안에서 조정 가능함 */
            /* padding-top: 15px;
            padding-bottom: 15px; */
            /* border: 1px solid silver; */
            position: relative;
        }

        /* 리스트 안에 div 묶어버림 */
        .list-content {
            /* div로 묶어서 +표시말고 다른것들은 패딩 줘서 글자들 정렬함 */
            /* padding-top: 15px; */
            /* padding-bottom: 15px; */
            /* 넓이는 리스트 틀 다 쓰게끔 100%로 */
            width: 100%;
/*             height: 100%;
 */            /* 이거 파란거는 나 확인할라고 */
            /* border: 1px solid blue; */

        }

        /* 리스트 타이틀 버튼 스타일 */
        .btn-container {
            position: relative;
            width: 100%;
            font-size: 20px;
            display: inline-flex;
            border: 0.5px solid rgb(219, 219, 219);
            cursor: pointer;


        }

        .faq-btn {
            position: relative;
            padding: 0;
            margin: 0;
            width: 100%;
            
            /* border: 1px solid red; */
            cursor: pointer;
        }

        /* 리스트 타이틀 스타일 */
        .list-title {
            text-align: left;
            font-size: 20px;
            background-color: transparent;
        }

        /* +버튼 스타일 */
        .list-link {
            /* 리스트 틀에서 위에서 10px 오른쪽에서 10px 떨어진곳에다 위치 */
            position: relative;
            right: 40px;
        }

        .faq-detail {
            display: none;
            /* width: 100%; */
            padding-top: 15px;
            padding-bottom: 15px;
        }

        /*회원정보, 배송 ,주문 크기 조절*/
        .hor2 {
            border: 1px solid white;
            width: 25%;
            text-align: center;
            padding: 5px 5px;
            box-sizing: border-box;

        }

        .hor2>a {
            text-decoration: none;
            color: rgb(109, 109, 109);
        }

        .faqmiddle {
            width: 80%;
        }

        /*FAQ설명란 글꼴 크기 및 색상*/
        .font1 {
            font-size: 12px;
            color: slategrey;
            background-color: white;
            padding-left: 15px;
        }

        /*FAQ 설명 제목 글꼴 크기 및 색상*/
        .font2 {
            font-size: 14px;
            color: #00A8B5;
            /* background-color: white; */
            padding: 15px 20px;
        }
        /*고객센터 링크 색상 바꾸기*/
        .senter{
            text-decoration: none;
            color: black;
        }
        .senter>li>a{
            text-decoration: none;
            color: black;
        }
            /*고객센터 목록 앞에보이는 것*/
            .lnb_list a {
    padding-top: 3px;
    padding-left: 13px;
    line-height: 25px;
    font-size: 16px;
    color: #000;
    background: transparent url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg) no-repeat left 6px;
}
        .senter>li>a{
            text-decoration: none;
            color: black;
        }
        ul{
            list-style:none;
        }
    </style>
    
   <section>
        <!-- HOME // CONTACT -->

        <div class="aside">
            <h5 style='line-height:400%'>&nbsp&nbsp HOME // CONTACT US</h5>
            <h2 style='line-height:300%'>&nbsp&nbsp고객센터</h2>

            <ul class="lnb_list">
                <li><a href="<%=request.getContextPath() %>/schome">고객센터 Home</a></li><br />
                <li><a href="">공지사항</a></li><br />
                <li><a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_1" style="color: rgb(23, 7, 248); font-weight: bolder;">FAQ</a></li><br />
                <li><a href="">이벤트</a></li><br />
                <li><a href="">이용안내</a></li><br />
                <li><a href="">제작 가이드</a></li><br />
                <li><a href="<%=request.getContextPath() %>/privacy">개인정보 보호정책</a></li><br />
                <li><a href="<%=request.getContextPath() %>/tou">이용약관</a></li><br />
                <li><a href="">회사소개</a></li><br />
            </ul>
        </div>
        <!--aside 고객센터와 공지사항등 목록과 질문사이의 여백주기 -->
        <div class="aside2">

        </div>
        <!-- style="border: 1px solid red; width:80%; height:500px; overflow: auto; -->
        <div class="faqmiddle">

            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2 style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        FAQ<span style="font-size: 17px;">자주하는 질문</span></td>
                </tr>
                <tr>
                    <!-- 글자크기 12px 긁자의 굵기 조절 포지션으로 FAQ와 상하 거리 조절 -->
                    <td style="font-size: 12px; font-weight: 500;">자주 문의하시는 질문입니다.<br />
                        문의 전 확인하시고 더 궁금한 사항은 게시판 또는 고객센터로 문의해 주세요.</td>
                </tr>
            </table>
			<form>
            <div style=" background-color: #E7ECF0; padding-top: 15px; padding-bottom: 15px;">
                <label style="margin-left: 10%;">&nbspFAQ 검색</label>
                <select style="margin-left: 5%;">
                    <option>제목</option>
                    <option>내용</option>
                    <option>제목+내용</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요.">
                <button>검색</button>
            </div>
            </form>
            <br /><br /> <!-- writing-mode: horizontal-tb;  가로정렬 안댐 -->
            <div style="display: flex; flex-wrap: wrap; background-color: rgb(233, 232, 232);">
                <div class="hor2">
                    <a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_1">회원정보</a></div>
                <div class="hor2">
                    <a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_2">배송</a></div>
                <div class="hor2" style="background-color: rgb(240, 226, 226); ">
                    <a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_3" style="color: rgb(196, 143, 196);">주문</a></div>
                <div class="hor2">
                    <a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_4">결제</a></div>

            </div>
            <br />
            <br />

            <div>
                <ol class="faq-list">
                     <%if(request.getAttribute("faq")!=null){
                	for(FAQ f:list)  {%>
                    <li class="golo">
                        <div class="list-content">
                            <div class="btn-container">
                                <!-- <button class="faq-btn" onclick="detail1();"> -->
                                    <div class="list-title font3">
                                    <%=f.getFaq_Title() %>
                                    </div>
                                <!-- </button> -->
                                <!-- <div class="list-link">+</div> -->
                            </div>
                            <div class="faq-detail font1" id="faq-detail1">
                                <p>
                                  <%=f.getFaq_Content() %>
                                </p>
                            </div>
                        </div>
                    </li>
                    <%}} %>
                    
                </ol>
            </div>

        </div>
    </section>
    
        <script>
        $("div.btn-container").click(function(){
            $('div.faq-detail').not($(this).siblings('div.faq-detail')).slideUp(500);
            $(this).siblings('div.faq-detail').slideToggle(500);
        })
    </script>




<%@ include file="/views/client/common/footer.jsp" %>