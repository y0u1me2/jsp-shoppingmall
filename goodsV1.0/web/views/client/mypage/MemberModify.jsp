<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>

 <style>
       
        /*CONTACT US 고객센터 번호 및 이메일 휴일안내 */
        .goto {
            position: relative;
            bottom: 382px;
            left: 600px;
        }


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

        /*고객센터 목록 앞에보이는 것*/
        .lnb_list a {
            padding-top: 3px;
            padding-left: 13px;
            line-height: 25px;
            font-size: 16px;
            color: #000;
            background: transparent url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg) no-repeat left 6px;
        }

        .senter>li>a {
            text-decoration: none;
            color: black;
        }

        ul {
            list-style: none;
        }

        .faqmiddle {
            width: 80%;
            /* height: 600px; */

        }

        /*tr 첫번째 아이디정보 (기본정보)*/
        .line {
            border-bottom: 1px solid rgb(216, 209, 209);
            padding: 10px 0px 10px 50px;
            text-align: left;


        }

        /*em 중요부위 빨간색표시*/
        em {
            color: red;
        }

        /* ======================================================================== */
        /* 섹션 스타일 */
           .back{
        width: 80%;
        position: relative;
        left: 10%;
        display: flex;
    }
       .backDiv{
        width:100%;
    }
    </style>
    
     <section class="back">
        <!-- HOME // CONTACT -->

        <div class="aside">
            <h5 style='line-height:400%'>&nbsp&nbsp HOME //</h5>
            <h2 style='line-height:300%'>&nbsp&nbsp마이페이지</h2>

            <ul class="lnb_list">
                <li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li><br />
                <li><a href="<%=request.getContextPath()%>/listLookUp">찜 목록 조회</a></li><br />
                <li><a href="">반품/환불</a></li><br />
                <li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1상담</a></li><br />
                <li><a href="<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No() %>">상담내역</a></li><br>
                <li><a href="">쿠폰관리</a></li><br />
                <li><a href="">포인트관리</a></li><br />
                <li><a href="<%=request.getContextPath()%>/profile2" style="color: rgb(23, 7, 248); font-weight: bold;">회원정보수정</a></li><br />
                <li><a href="Membersecession.jsp">회원탈퇴</a></li><br />
            </ul>
        </div>
        <!-- aside2 목록과붙어있는공간띄우기-->
        <div class="aside2"></div>



        <div class="faqmiddle">

            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2
                        style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        회원정보 수정</td>
                </tr>
            </table>
            <div style="padding-top: 6%;">
                <h4 style="border-bottom:1px solid black;">아이디 정보</h4>
            </div>
            <table style="width:100%;font-size: 14px;">
                <colgroup>
                    <col style="width: 25%;">
                    <col style="width: 75%;">
                </colgroup>
                <tr>
                    <td class="line">회원구분</td>
                    <td class="line">개인회원</td>
                </tr>
                <tr>
                    <td class="line">
                        이메일</td>
                    <td class="line">
                    
                    </td>
                </tr> 
                <tr>
                    <td class="line">비밀번호</td>
                    <td class="line">
                        <form action="PwModify.jsp">
                            <button
                                style="width: 150px; height: 30px; border-radius: 5px;background: rgb(235, 229, 229);color: rgb(51, 51, 51);">
                                비밀번호 수정</button>
                        </form>
                    </td>
                </tr>
            </table>
            </table>
            <div style="padding-top: 6%;">
                <h4 style="border-bottom:1px solid black;">기본정보(필수입력)</h4>
            </div>
            <table style="width:100%;font-size: 14px;">
                <colgroup>
                    <col style="width: 25%;">
                    <col style="width: 75%;">
                </colgroup>
                <tr>
                    <td class="line">이름</td>
                    <td class="line"></td>
                </tr>
               
         
            
                <tr>
                    <td class="line">       
                        닉네임</td>
                    <td class="line">
      					닉네임변경? 
                        <button
                            style="width: 150px; height: 30px; border-radius: 5px;background: rgb(235, 229, 229);color: rgb(51, 51, 51);">닉네임 변경
                            </button>
                    </td>
                </tr>
     
                <tr>
                    <td class="line">이메일 수신여부</td>
                    <td class="line">뉴스레터,상품 이벤트 안내 등의 정보를 받겠습니다
                        <input type="checkbox" value="1" checked="checked">받기
                    </td>
                </tr>
            </table>
            <div style="text-align: center; padding: 5px 0px 5px;">
                <button
                    style="width: 140px;height: 50px; border-radius: 5px;background: #313030;color: rgb(233, 233, 229);">확인</button>
                <button
                    style="width: 140px;height: 50px; border-radius: 5px;color: #313030;background: rgb(255, 254, 254);">초기화</button>

            </div>




        </div>
    </section>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js">
    </script>
    <script type="text/javascript"> 
        //이메일 입력방식 선택
        $('#selectEmail').change(function () {
            $("#selectEmail option:selected").each(function () {
                if ($(this).val() == "1") { //직접입력일 경우
                    $("#str_email02").val(''); //값 초기화
                    $("#str_email02").attr("disabled", false);//활성화
                } else { //직접입력이 아닐경우
                    $("#str_email02").val($(this).text()); //선택값 입력
                    $("#str_email02").attr("disabled", true); //비활성화
                }
            });
        });

    </script>



<%@ include file="/views/client/common/footer.jsp" %>