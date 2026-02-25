<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 | YEOWUN COFFEE</title>

    <!-- 외부 폰트 및 라이브러리 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<iframe name="cartHiddenFrame" id="cartHiddenFrame" style="display:none;"></iframe>
<body>

<!-- 상단 네비게이션 -->
<%--모바일 사이드바--%>
<jsp:include page="/common/header.jsp"></jsp:include>

<!-- 페이지 헤더 (타이틀 배너) -->
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?w=1200'); background-position: center;">
    <div class="page-header-content">
        <h1 data-aos="fade-up">CONTACT US</h1>
        <p data-aos="fade-up" data-aos-delay="100">궁금하신 사항을 문의해주세요</p>
        <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
            <a href="/index">HOME</a> <i class="fas fa-chevron-right"></i>
            <a href="#">고객지원</a> <i class="fas fa-chevron-right"></i>
            <span>1:1 문의</span>
        </div>
    </div>
</header>

<!-- 문의 섹션 -->
<section class="section">
    <div class="container" style="max-width: 1100px;">

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 60px; margin-bottom: 80px;">

            <!-- 문의 폼 -->
            <div data-aos="fade-up">
                <h3 style="font-size: 2rem; margin-bottom: 15px; color: var(--text-dark);">1:1 문의하기</h3>
                <p style="color: #999; margin-bottom: 40px;">영업일 기준 1-2일 내로 답변드립니다.</p>

                <form id="contactForm" style="display: flex; flex-direction: column; gap: 20px;">
                    <div>
                        <label style="display: block; margin-bottom: 8px; font-weight: 600; color: var(--text-dark);">
                            <i class="fas fa-user" style="color: var(--accent-gold); margin-right: 5px;"></i> 이름
                        </label>
                        <input type="text" id="contact-name" placeholder="이름을 입력하세요" style="width: 100%; padding: 15px; border: 1px solid #ddd; border-radius: 10px; font-size: 1rem;">
                    </div>

                    <div>
                        <label style="display: block; margin-bottom: 8px; font-weight: 600; color: var(--text-dark);">
                            <i class="fas fa-envelope" style="color: var(--accent-gold); margin-right: 5px;"></i> 이메일(선택)
                        </label>
                        <input type="email" id="contact-email" placeholder="example@email.com" style="width: 100%; padding: 15px; border: 1px solid #ddd; border-radius: 10px; font-size: 1rem;">
                    </div>

                    <input type="hidden" name="cuNumber" value="${sessionScope.cuNumber}">

                    <p style="color: #999; font-size: 0.9rem; margin-bottom: 20px;">
                        <i class="fas fa-info-circle" style="color: var(--accent-gold);"></i>
                        입장 시 입력하신 <strong>${sessionScope.cuNumber}</strong> 번호로 문의가 등록됩니다.
                    </p>

                    <div>
                        <label style="display: block; margin-bottom: 8px; font-weight: 600; color: var(--text-dark);">
                            <i class="fas fa-list" style="color: var(--accent-gold); margin-right: 5px;"></i> 문의 유형
                        </label>
                        <select id="contact-type" name="title" style="width: 100%; padding: 15px; border: 1px solid #ddd; border-radius: 10px; font-size: 1rem;">
                            <option value="">문의 유형을 선택하세요</option>
                            <option value="상품 문의">상품 문의</option>
                            <option value="배송 문의">배송 문의</option>
                            <option value="주문/결제 문의">주문/결제 문의</option>
                            <option value="매장 문의">매장 문의</option>
                            <option value="제휴/제안">제휴/제안</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>

                    <div>
                        <label style="display: block; margin-bottom: 8px; font-weight: 600; color: var(--text-dark);">
                            <i class="fas fa-comment-dots" style="color: var(--accent-gold); margin-right: 5px;"></i> 문의 내용
                        </label>
                        <textarea id="contact-content" name="cont" placeholder="문의 내용을 상세히 입력해주세요" rows="8" style="width: 100%; padding: 15px; border: 1px solid #ddd; border-radius: 10px; font-size: 1rem; resize: vertical;"></textarea>
                    </div>

                    <button type="submit" style="width: 100%; padding: 18px; background: var(--accent-gold); color: white; border: none; border-radius: 10px; font-size: 1.1rem; font-weight: 700; cursor: pointer; margin-top: 10px;">
                        <i class="fas fa-paper-plane"></i> 문의하기
                    </button>
                </form>
            </div>

            <!-- 연락처 & FAQ -->
            <div>
                <!-- 연락처 정보 -->
                <div style="background: #f8f5f0; padding: 40px; border-radius: 15px; margin-bottom: 30px;" data-aos="fade-up">
                    <h4 style="font-size: 1.5rem; margin-bottom: 25px; color: var(--text-dark);">
                        <i class="fas fa-phone-alt" style="color: var(--accent-gold);"></i> 연락처
                    </h4>

                    <div style="margin-bottom: 25px;">
                        <p style="color: #999; font-size: 0.9rem; margin-bottom: 8px;">고객센터</p>
                        <p style="font-size: 1.8rem; font-weight: 700; color: var(--text-dark);">02-123-4567</p>
                    </div>

                    <div style="margin-bottom: 25px;">
                        <p style="color: #999; font-size: 0.9rem; margin-bottom: 8px;">운영시간</p>
                        <p style="color: #666; line-height: 1.7;">
                            평일 09:00 - 18:00<br>
                            주말 및 공휴일 휴무
                        </p>
                    </div>

                    <div style="margin-bottom: 25px;">
                        <p style="color: #999; font-size: 0.9rem; margin-bottom: 8px;">이메일</p>
                        <p style="color: var(--accent-gold); font-weight: 600;"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="a9dadcd9d9c6dbdde9d0ccc6dedcc787cac687c2db">[email&#160;protected]</a></p>
                    </div>

                    <div>
                        <p style="color: #999; font-size: 0.9rem; margin-bottom: 8px;">주소</p>
                        <p style="color: #666; line-height: 1.7;">
                            서울특별시 강남구 테헤란로 123<br>
                            여운빌딩 12층
                        </p>
                    </div>
                </div>

                <!-- FAQ -->
                <div data-aos="fade-up" data-aos-delay="100">
                    <h4 style="font-size: 1.5rem; margin-bottom: 25px; color: var(--text-dark);">
                        <i class="fas fa-question-circle" style="color: var(--accent-gold);"></i> 자주 묻는 질문
                    </h4>

                    <div style="background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 15px rgba(0,0,0,0.05);">
                        <div style="border-bottom: 1px solid #f0f0f0; padding: 20px; cursor: pointer;" onclick="toggleFaq(this)">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <p style="font-weight: 600; color: var(--text-dark);">배송은 얼마나 걸리나요?</p>
                                <i class="fas fa-chevron-down" style="color: #999;"></i>
                            </div>
                            <div class="faq-content" style="display: none; margin-top: 15px; padding-top: 15px; border-top: 1px solid #f5f5f5; color: #666; line-height: 1.7;">
                                주문 확인 후 2-3일 이내에 배송됩니다. 제주도 및 도서산간 지역은 추가 1-2일이 소요될 수 있습니다.
                            </div>
                        </div>

                        <div style="border-bottom: 1px solid #f0f0f0; padding: 20px; cursor: pointer;" onclick="toggleFaq(this)">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <p style="font-weight: 600; color: var(--text-dark);">원두 보관 방법은 어떻게 되나요?</p>
                                <i class="fas fa-chevron-down" style="color: #999;"></i>
                            </div>
                            <div class="faq-content" style="display: none; margin-top: 15px; padding-top: 15px; border-top: 1px solid #f5f5f5; color: #666; line-height: 1.7;">
                                직사광선을 피하고 서늘한 곳에 밀폐 보관하시면 됩니다. 개봉 후에는 1개월 이내 소진을 권장합니다.
                            </div>
                        </div>

                        <div style="border-bottom: 1px solid #f0f0f0; padding: 20px; cursor: pointer;" onclick="toggleFaq(this)">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <p style="font-weight: 600; color: var(--text-dark);">반품/교환은 어떻게 하나요?</p>
                                <i class="fas fa-chevron-down" style="color: #999;"></i>
                            </div>
                            <div class="faq-content" style="display: none; margin-top: 15px; padding-top: 15px; border-top: 1px solid #f5f5f5; color: #666; line-height: 1.7;">
                                수령 후 7일 이내 고객센터로 문의 주시면 됩니다. 단, 개봉한 상품은 교환/반품이 어려울 수 있습니다.
                            </div>
                        </div>

                        <div style="border-bottom: 1px solid #f0f0f0; padding: 20px; cursor: pointer;" onclick="toggleFaq(this)">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <p style="font-weight: 600; color: var(--text-dark);">멤버십 혜택은 무엇인가요?</p>
                                <i class="fas fa-chevron-down" style="color: #999;"></i>
                            </div>
                            <div class="faq-content" style="display: none; margin-top: 15px; padding-top: 15px; border-top: 1px solid #f5f5f5; color: #666; line-height: 1.7;">
                                구매 금액의 5% 적립, 생일 쿠폰, 신제품 우선 구매 등 다양한 혜택을 제공합니다.
                            </div>
                        </div>

                        <div style="padding: 20px; cursor: pointer;" onclick="toggleFaq(this)">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <p style="font-weight: 600; color: var(--text-dark);">대량 구매 할인이 있나요?</p>
                                <i class="fas fa-chevron-down" style="color: #999;"></i>
                            </div>
                            <div class="faq-content" style="display: none; margin-top: 15px; padding-top: 15px; border-top: 1px solid #f5f5f5; color: #666; line-height: 1.7;">
                                10kg 이상 구매 시 할인 혜택이 있습니다. 자세한 사항은 고객센터로 문의해주세요.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>

<!-- 푸터 -->
<jsp:include page="/common/footer.jsp"></jsp:include>
<!-- 플로팅 버튼 (장바구니 & TOP) -->
<form id="addForm" name="addForm" method="post" target="cartHiddenFrame">
<div id="floating-btns">
    <div class="cart-dashboard" id="cart-dashboard">
        <div style="background:var(--text-dark); color:#fff; padding:15px; text-align:center; font-weight:700;">SHOPPING BAG</div>
        <div id="cart-items-list"></div>
        <div style="padding:20px; border-top:1px solid #eee;">
            <div style="display:flex; justify-content:space-between; margin-bottom:15px; font-weight:700;"><span>최종 합계</span><span id="total-price-display" style="color:var(--accent-gold);">0원</span></div>
            <button type="button" class="btn-order-now" onclick="processOrder()">주문하기</button>
        </div>
    </div>
    <div class="float-item cart-btn" onclick="toggleDashboard()"><i class="fas fa-shopping-bag"></i><span class="cart-count" id="cart-count">0</span></div>
    <div class="float-item top-btn" id="top-btn" onclick="window.scrollTo({top:0, behavior:'smooth'})"><i class="fas fa-arrow-up"></i></div>
</div>
</form>
<!-- 주문서 모달 -->
<div class="order-modal" id="orderModal">
    <div class="order-paper">
        <h3>ORDER SHEET</h3>

        <!-- 주문 메뉴 리스트 추가 -->
        <div class="order-form-group">
            <label><i class="fas fa-shopping-cart"></i> 주문 메뉴</label>
            <div id="order-menu-list" style="background: #f8f5f0; padding: 15px; border-radius: 10px; max-height: 150px; overflow-y: auto; font-size: 0.9rem;"></div>
        </div>

        <div class="order-form-group">
            <label><i class="fas fa-phone"></i> 연락처</label>
            <input type="text"
                   class="order-input"
                   id="order-phone"
                   name="cuNumber"
                   value="${sessionScope.cuNumber}"
                   placeholder="010-0000-0000 (숫자만 입력)">
        </div>
        <div class="order-form-group">
            <label><i class="fas fa-clock"></i> 픽업 예정 시간</label>
            <select class="order-select" id="order-time">
                <option value="10분 후">10분 후</option>
                <option value="20분 후">20분 후</option>
                <option value="30분 후">30분 후</option>
            </select>
        </div>
        <div class="order-form-group">
            <label><i class="fas fa-pen"></i> 추가 요청사항</label>
            <textarea class="order-textarea" id="order-memo" placeholder="예: 이 번호로 적립해주세요 / 시럽 빼주세요"></textarea>
        </div>
        <div class="order-summary">
            <div class="order-row"><span>주문 내역</span><span id="final-item-count">0건</span></div>
            <div class="order-row" style="font-weight: 700; color: var(--accent-gold); border-top: 1px solid #ddd; margin-top: 10px; padding-top: 10px;">
                <span>최종 결제 금액</span><span id="final-order-price">0원</span>
            </div>
        </div>
        <button class="btn-final-order" onclick="confirmFinalOrder()">주문 확정하기</button>
        <p onclick="closeOrderModal()" style="text-align:center; margin-top:15px; font-size:0.8rem; color:#aaa; cursor:pointer; text-decoration:underline;">취소하고 돌아가기</p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 문의 완료 모달 -->
<div class="order-modal" id="contactModal">
    <div class="order-paper" style="text-align: center;">
        <div style="width: 80px; height: 80px; background: var(--accent-gold); border-radius: 50%; margin: 0 auto 25px; display: flex; align-items: center; justify-content: center;">
            <i class="fas fa-check" style="font-size: 3rem; color: white;"></i>
        </div>
        <h3 style="font-size: 1.8rem; margin-bottom: 20px;">문의가 완료되었습니다!</h3>
        <p style="color: #666; line-height: 1.8; margin-bottom: 30px;">
            담당자 확인 후 영업일 기준<br>
            <strong style="color: var(--accent-gold);">1-2일 내로 답변</strong> 드리겠습니다.
        </p>
        <p style="color: #999; font-size: 0.9rem; margin-bottom: 30px;">
            여운 커피를 이용해주셔서 감사합니다.
        </p>
        <button class="btn-final-order" onclick="closeContactModal()">확인</button>
    </div>
</div>

<!-- 외부 스크립트 -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/js/script.js"></script>

<!-- FAQ 토글 스크립트 -->
<script>
    $(document).ready(function() {
        // [1] 문의하기 버튼 클릭 시 실행 (AJAX 전송)
        $('#contactForm').on('submit', function(e) {
            e.preventDefault(); // 페이지 새로고침 방지

            // 서버로 보낼 데이터 묶기
            const formData = {
                title: $('#contact-type').val(),    // 문의 유형 (name="title"과 매칭)
                cont: $('#contact-content').val()  // 문의 내용 (name="cont"과 매칭)
            };

            // 유효성 검사
            if(!formData.title) { alert('문의 유형을 선택해주세요.'); return; }
            if(!formData.cont) { alert('문의 내용을 입력해주세요.'); return; }

            // 서버와 통신 (배달 시작)
            $.ajax({
                url: '/inquiry/submit', // 컨트롤러의 @PostMapping("/submit") 경로
                type: 'POST',
                data: formData,
                success: function(res) {
                    // 성공 시 "문의 완료" 모달 띄우기
                    $('#contactModal').css('display', 'flex');
                    // 입력창 초기화
                    $('#contactForm')[0].reset();
                },
                error: function() {
                    alert('서버 전송 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
                }
            });
        });
    });

    // [2] FAQ 토글 기능 (열고 닫기 개선)
    function toggleFaq(element) {
        const content = element.querySelector('.faq-content');
        const isVisible = content.style.display === 'block';

        // 클릭할 때마다 반대로 (보이면 숨기고, 안보이면 보이고)
        content.style.display = isVisible ? 'none' : 'block';
    }

    // [3] 문의 완료 모달 닫기 버튼 함수
    function closeContactModal() {
        $('#contactModal').css('display', 'none');
        // 선택사항: 확인 누르면 목록 페이지로 이동하고 싶을 때 아래 주석 해제
         location.href = "/inquiry";
    }
</script>
