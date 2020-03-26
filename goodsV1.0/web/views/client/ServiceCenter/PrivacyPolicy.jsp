<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>

<style>

        /* =================================================================================================== */

        /*CONTACT US 고객센터 번호 및 이메일 휴일안내 */
        .goto {
            position: relative;
            bottom: 382px;
            left: 600px;
        }


        /*고객센터Home , 공지사항 등 */
        .aside {
            /* border: 1px solid hotpink; */
            width: 30%;
            height: 100%;
            line-height: 130%;
        }

        .aside2 {
            /* border: 1px solid hotpink; */
            width: 5%;
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

        /*개인보호정책 이용약관 설명*/
        .terms_wrap .terms_box {
            padding: 30px 35px;
            max-height: 760px;
            line-height: 14px;
            font-size: 12px;
            color: #6f6f6f;
            font-weight: 400;
            border: 1px solid #e4e3e3;
            background: #f5f7fa;
            overflow: hidden;
            overflow-y: auto;

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
            <h5 style='line-height:400%'>&nbsp&nbsp HOME // CONTACT US</h5>
            <h2 style='line-height:300%'>&nbsp&nbsp고객센터</h2>

            <ul class="lnb_list">
                <li><a href="<%=request.getContextPath() %>/schome">고객센터 Home</a></li><br />
                <li><a href="">공지사항</a></li><br />
                <li><a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_1">FAQ</a></li><br />
                <li><a href="">이벤트</a></li><br />
                <li><a href="">이용안내</a></li><br />
                <li><a href="">제작 가이드</a></li><br />
                <li><a href="<%=request.getContextPath() %>/privacy" style="color: rgb(23, 7, 248); font-weight: bold;">개인정보 보호정책</a></li><br />
                <li><a href="<%=request.getContextPath() %>/tou">이용약관</a></li><br />
                <li><a href="">회사소개</a></li><br />
            </ul>
        </div>
        <!-- aside2 목록과붙어있는공간띄우기-->
        <div class="aside2"></div>



        <div class="faqmiddle">
            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2
                        style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        개인정보 보호정책<span style="font-size: 12px;color: #6f6f6f;margin-left: 10px;">고객의 정보를 소중히
                            생각하겠습니다.</span></td>
                </tr>
            </table>
            <div class="terms_wrap" style="margin: 20px 0px;">
                <div class="terms_box">
                    <pre style="color:#6f6f6f; border:0px;background-color:#f5f7fa;">개인정보처리방침<br />
                    <br />
                    <br />
    '(주)베러웨이시스템즈' (이하 '회사')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게<br>
     처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br />
                    <br />
    회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br />
                    <br />
    ○ 본 방침은부터 2015년 7월 1일부터 시행됩니다.		<br />
    <br />
    1. 수집하는 개인정보 항목<br />
    회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br />
     <br />
    1.1. 수집항목<br />
    <br />
    <개인회원><br />
    -필수항목: 이름, 로그인ID, 비밀번호, 생일, 소속, 주소, 휴대폰번호, 이메일<br />
    -선택항목: 생일<br />
    -서비스 이용과정에서 IP주소, 쿠키, 방문일시, 서비스이용기록과 같은 정보가 자동으로 생성되어 수집될 수 있습니다. <br />
    <br />
    <기업 회원><br />
    -필수항목:  회사명, 대표자명, 사업자번호, 업태, 업종, 회사주소, 아이디, 비밀번호,이메일, 휴대전화, 주소, 담당자명, 담당자연락처(일반전화, 휴대전화)<br>
    , 회계담당자명, 회계담당 연락처(일반전화, 휴대전화), 회계담당 이메일,담당자 FAX, 담당자 이메일<br />
    -선택항목: 담당자 생일<br />
    <br />
    1.2. 수집방법<br />
     홈페이지 회원가입<br />
    <br />
    2. 개인정보의 수집 및 이용목적<br />
    회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br />
     <br />
    2.1. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br />
     콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스, 요금추심 <br />
     <br />
    2.2. 회원 관리<br />
     회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달 <br />
     <br />
    2.3. 마케팅 및 광고에 활용<br />
     신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br />
    <br />
    3. 개인정보의 보유 및 이용기간 <br />
    원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br />
     <br />
    3.1. 회사 내부 방침에 의한 보존<br />
     불량 이용자의 재가입 방지, 명예훼손 등 권리침해 분쟁 및 수사협조 : 1년 <br />
     <br />
    3.2. 관련법령에 의한 보존<br />
     상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를<br>
      보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br />
    <br />
    -계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래 등에서의 소비자보호에 관한 법률) <br />
    -대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래 등에서의 소비자보호에 관한 법률) <br />
    -소비자의 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래 등에서의 소비자보호에 관한 법률) <br />
      <br />
    <br />
    4. 개인정보의 파기절차 및 방법 <br />
    회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. <br />
     <br />
    4.1. 파기절차<br />
     회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에<br>
      의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기 됩니다. 별도 DB로 옮겨진 개인정보는 법률에<br>
       의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. <br />
     <br />
    4.2. 파기방법<br />
    -전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. <br />
    -종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br />
    <br />
    5. 개인정보의 제공 <br />
    회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. <br />
     <br />
    -이용자들이 사전에 동의한 경우<br />
    -법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br />
    <br />
    6. 수집한 개인정보의 위탁<br />
    회사는 결제처리 등 서비스 제공을 위해 필요한 최소한의 업무를 전문업체에 위탁하고 있으며, 관계법령에 따라 위탁계약 시 개인정보가 안전하게<br>
     관리될 수 있도록 필요한 사항들을 규정하고 있습니다. <br />
    <br />
    ***************<br />
    <br />
    7. 이용자 및 법정대리인의 권리와 그 행사방법<br />
    -이용자 및 법정대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다. <br />
    -이용자 혹은 만 14세 미만 아동의 개인정보를 조회/수정 하기 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’ 등)을, 가입해지(동의철회)를 위해서는 '회원탈퇴'를<br>
     클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. <br />
    -혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. <br />
    -이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전 까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를<br>
     제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다. <br />
    -회사는 이용자 혹은 법정대리인의 요청에 의해 해지 또는 삭제된 개인정보는 회사가 수집하는 '개인정보의 보유 및 이용기간'에 명시된 바에 따라<br>
     처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다<br />
    <br />
    8. 개인정보의 안정성 확보 조치<br />
    개인정보 보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다. <br />
     <br />
    8.1. 개인정보의 암호화<br />
     이용자의 개인정보 중 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를<br>
      암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다. <br />
     <br />
    8.2. 해킹 등에 대비한 기술적 대책<br />
     해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신/점검을 하며 외부로부터<br>
      접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다. <br />
     <br />
    8.3. 개인정보 취급 직원의 최소화 및 교육<br />
     개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br />
    <br />
    9. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 <br />
    회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 회사의 웹사이트를 운영하는데<br>
     이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다 <br />
     <br />
    9.1. 쿠키 등 사용목적<br />
    -PC 인증 (모바일 디바이스 인증 포함) <br />
    -회원과 비회원의 접속빈도나 방문시간 등을 분석, 이용자의 취향과 관심분야를 파악, 각종 이벤트 참여정도 및 방문회수<br>
     파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공 <br />
     <br />
    9.2. 쿠키 설정 거부 방법<br />
     귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나,<br>
      쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 단, 귀하께서 쿠키 설치를 거부하였을<br>
       경우 서비스 제공에 어려움이 있을 수 있습니다. <br />
     <br />
    9.3. 쿠키 설정 거부 방법 예시<br />
     인터넷 익스플로어의 경우 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보> 고급에서 설정<br />
    <br />
    10. 권익침해 구제방법 <br />
    개인정보 주체는 개인정보 침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원의 개인정보침해신고센터 등에<br>
     분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 개인정보 침해의 신고 및 상담에 대하여는 아래기관에 문의하시기 바랍니다. <br />
     <br />
    -개인정보분쟁조정위원회: 118(ARS 내선 3)<br />
    -정보보호마크인증위원회 (http://www.eprivacy.or.kr/02-580-0533~4) <br />
    -대검찰청 첨단범죄수사과 (http://www.spo.go.kr/02-3480-2000) <br />
    -경찰청 사이버테러대응센터 (http://www.ctrc.go.kr/02-392-0330)<br />
    <br />
    11. 개인정보 관리 책임자 및 담당자의 연락처<br />
    귀하께서는 회사의 서비스를 이용하시면서 발생하는 모든 개인정보 보호 관련 민원을 개인정보 관리 담당자 혹은<br>
     개인정보 관리 책임자에게 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 답변을 드릴 것입니다. <br />
     <br />
    11.1. 개인정보관리 책임자<br />
    ▶ 개인정보 보호책임자				<br />
    성명 :김기석				<br />
    직책 :과장				<br />
    직급 :과장				<br />
    연락처 :02-1544-6689, admin@redprinting.co.kr<br />
    <br />
    12. 고지의 의무<br />
    개인정보 취급/처리 방침에 대한 내용의 변경이 있을 시에는 시행 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다. <br />
     <br />
    <br />
    </pre>

                </div>
            </div>
        </div>





    </section>



<%@ include file="/views/client/common/footer.jsp" %>