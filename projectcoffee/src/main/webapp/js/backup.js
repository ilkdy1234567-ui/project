// ==================== AOS 애니메이션 초기화 ====================
AOS.init();

// ==================== 장바구니 전역 변수 ====================
let cart = JSON.parse(localStorage.getItem('yeowun_cart')) || [];

// ==================== 모바일 사이드바 토글 ====================
function toggleSidebar() {
    document.getElementById('mobileSidebar').classList.toggle('active');
}

// ==================== 장바구니에 상품 추가 (담기 버튼 클릭 시 장바구니 바로 열기) ====================
function addToCart(pUuid, name, price) {

    const found = cart.find(item => item.pUuid === pUuid);

    if (found) {
        found.qty++;
    } else {
        cart.push({ pUuid, name, price, qty: 1 });
    }

    localStorage.setItem('yeowun_cart', JSON.stringify(cart));
    updateCartUI();

    const dashboard = document.getElementById('cart-dashboard');
    dashboard.classList.add('active');
}

// ==================== 장바구니 수량 변경 ====================
function changeQty(name, delta) {
    const item = cart.find(i => i.name === name);
    if (item) {
        item.qty += delta;
        if (item.qty <= 0) {
            removeFromCart(name);
        } else {
            localStorage.setItem('yeowun_cart', JSON.stringify(cart));
            updateCartUI();
        }
    }
}

// ==================== 장바구니에서 상품 제거 ====================
function removeFromCart(name) {
    cart = cart.filter(item => item.name !== name);
    localStorage.setItem('yeowun_cart', JSON.stringify(cart));
    updateCartUI();
}

// ==================== 장바구니 UI 업데이트 ====================
function updateCartUI() {
    const list = document.getElementById('cart-items-list');
    const totalDisplay = document.getElementById('total-price-display');
    const countBadge = document.getElementById('cart-count');

    let total = 0;
    let totalQty = 0;
    let html = '';

    cart.forEach(item => {
        total += item.price * item.qty;
        totalQty += item.qty;
        html += `<div class="cart-item">
            <div class="cart-item-info">
                <strong>${item.name}</strong><br>
                <small>${(item.price * item.qty).toLocaleString()}원</small>
            </div>
            <div class="dash-ctrl">
<!--            event.stopPropagation(): 외부클릭으로 인식되는것을 막아서 삭제하거나 수량 변경을 해도 장바구니가 닫히지 않음-->
                <button onclick="event.stopPropagation(); changeQty('${item.name}', -1)">-</button>
                <span>${item.qty}</span>
                <button onclick="event.stopPropagation(); changeQty('${item.name}', 1)">+</button>
            </div>
            <i class="fas fa-trash-alt"
               style="cursor:pointer; color:#ccc;"
               onclick="event.stopPropagation(); removeFromCart('${item.name}')"></i>
        </div>`;
    });

    if (cart.length === 0) {
        html = '<div style="text-align:center; padding:30px 0; color:#ccc;">비어있습니다.</div>';
    }

    list.innerHTML = html;
    totalDisplay.innerText = total.toLocaleString() + '원';
    countBadge.innerText = totalQty;
}

// ==================== 주문서 모달 열기 ====================
function processOrder() {

    if (!cart || cart.length === 0) {
        alert("장바구니가 비어있습니다.");
        return;
    }

    // 주문 메뉴 리스트 그리기
    const menuList = document.getElementById('order-menu-list');
    let html = '';

    cart.forEach(item => {
        html += `
            <div style="display:flex; justify-content:space-between; margin-bottom:8px;">
                <span>${item.name}</span>
                <span>${item.qty}개</span>
            </div>
        `;
    });

    menuList.innerHTML = html;

    // 모달 열기
    $("#orderModal").addClass("active");
}

// ==================== 주문서 모달 닫기 ====================
function closeOrderModal() {
    document.getElementById('orderModal').classList.remove('active');
}

// ==================== 최종 주문 확정 ====================
    function confirmFinalOrder() {
        // 1) 주문서 입력값 가져오기
        const phone = document.getElementById('order-phone').value.trim();
        const time = document.getElementById('order-time').value;
        const memo = document.getElementById('order-memo').value.trim();

        // 2) 유효성 검사
        if (!phone) {
            alert('연락처를 입력해주세요.');
            return;
        }

        // (선택) 숫자만 남기기
        const onlyDigits = phone.replace(/[^0-9]/g, "");
        if (onlyDigits.length < 10 || onlyDigits.length > 11) {
            alert("연락처를 정확히 입력해주세요. (예: 01012345678)");
            document.getElementById('order-phone').focus();
            return;
        }

        // 3) 장바구니 비었으면 막기
        if (!cart || cart.length === 0) {
            alert("장바구니가 비어있습니다.");
            return;
        }

        // 4) form 가져오기 (jQuery 사용)
        const $form = $("#addForm");

        // 5) submit 결과를 현재 화면이 아니라 iframe이 받도록 target 설정
        $form.attr("target", "cartHiddenFrame");

        // 6) action/method 설정 (컨트롤러 URL)
        $form.attr("action", window.CTX + "/cart/insert");
        $form.attr("method", "post");

        // 7) 기존 hidden input 제거 (중복 방지)
        $form.find(".cart-hidden").remove();

        // 8) cart 배열 -> hidden input으로 삽입 (pUuid[], quantity[])
        $.each(cart, function(index, item) {

            // pUuid가 없으면 서버 insert가 어려움 (FK 에러 가능)
            if (!item.pUuid) {
                console.error("cart item에 pUuid가 없습니다:", item);
                alert("상품 식별자(pUuid)가 없어 주문할 수 없습니다. addToCart에 pUuid를 저장하도록 수정해주세요.");
                return false; // each 중단
            }

            // pUuid
            $("<input>")
                .attr({ type: "hidden", name: "pUuid", value: item.pUuid })
                .addClass("cart-hidden")
                .appendTo($form);

            // quantity
            $("<input>")
                .attr({ type: "hidden", name: "quantity", value: item.qty })
                .addClass("cart-hidden")
                .appendTo($form);
        });

        // 9) (선택) 연락처/시간/메모도 같이 전송 (서버에서 받을 준비가 되어있어야 의미 있음)
        $("<input>")
            .attr({ type: "hidden", name: "phone", value: onlyDigits })
            .addClass("cart-hidden")
            .appendTo($form);

        $("<input>")
            .attr({ type: "hidden", name: "pickupTime", value: time })
            .addClass("cart-hidden")
            .appendTo($form);

        $("<input>")
            .attr({ type: "hidden", name: "memo", value: memo })
            .addClass("cart-hidden")
            .appendTo($form);

        // 10) iframe 로드 이벤트에서 성공처리할 수 있게, 한 번만 이벤트 바인딩
        $("#cartHiddenFrame").off("load").on("load", function () {
            // 서버 응답 텍스트 읽기 (컨트롤러가 "ok"를 반환하니까)
            let txt = "";
            try {
                txt = $(this).contents().text().trim();
            } catch (e) {
                // 보통 같은 도메인이면 문제 없음
            }

            // 성공 판단 (응답이 ok 포함이면 성공 처리)
            if (txt.toLowerCase().includes("ok")) {

                alert(`주문이 정상적으로 접수되었습니다!\n\n연락처: ${phone}\n픽업 시간: ${time}\n\n여운 커피를 이용해주셔서 감사합니다.`);

                // 장바구니 비우기
                cart = [];
                localStorage.setItem('yeowun_cart', JSON.stringify(cart));
                updateCartUI();

                // 모달 닫기 + 입력 초기화
                closeOrderModal();
                document.getElementById('order-phone').value = '';
                document.getElementById('order-memo').value = '';

            } else {
                // 실패/예외 응답이 있을 때
                alert("주문 저장에 실패했습니다. 서버 응답: " + (txt || "응답 없음"));
            }
        });

        // 11) 제출 (페이지 이동 없음 — iframe이 대신 받음)
        $form.submit();
    }

// ==================== 장바구니 대시보드 토글 ====================
function toggleDashboard() {
    document.getElementById('cart-dashboard').classList.toggle('active');
}

// ==================== 장바구니 외부 클릭시 닫기 (담기 버튼은 제외!) ====================
document.addEventListener('click', function(e) {
    const dashboard = document.getElementById('cart-dashboard');
    const cartBtn = document.querySelector('.cart-btn');
    const addButtons = document.querySelectorAll('.btn-add-cart');

    // 담기 버튼 클릭은 제외
    let isAddButton = false;
    addButtons.forEach(btn => {
        if (btn.contains(e.target)) {
            isAddButton = true;
        }
    });

    if (dashboard.classList.contains('active') &&
        !dashboard.contains(e.target) &&
        !cartBtn.contains(e.target) &&
        !isAddButton) {
        dashboard.classList.remove('active');
    }
});

// ==================== 화면 크기 변경시 모바일 사이드바 자동 닫기 ====================
window.addEventListener('resize', function() {
    if (window.innerWidth > 1024) {
        document.getElementById('mobileSidebar').classList.remove('active');
    }
});

// ==================== Swiper 슬라이더 초기화 ====================
const swiperElement = document.querySelector('.mainSwiper');
if (swiperElement) {
    new Swiper('.mainSwiper', {
        effect: 'fade',
        loop: true,
        autoplay: { delay: 3500 },
        pagination: { el: '.mainSwiper .swiper-pagination', clickable: true }
    });
}

// ==================== 스크롤시 네비바 & TOP 버튼 처리 ====================
window.addEventListener('scroll', () => {
    const nav = document.getElementById('navbar');
    const topBtn = document.getElementById('top-btn');

    if (window.scrollY > 150) {
        nav.classList.add('scrolled');
        topBtn.classList.add('show');
    } else {
        nav.classList.remove('scrolled');
        topBtn.classList.remove('show');
    }
});

// ==================== 문의 폼 제출 처리 ====================
document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 장바구니 UI 업데이트
    updateCartUI();

    const contactForm = document.getElementById('contactForm');

    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const name = document.getElementById('contact-name').value.trim();
            const email = document.getElementById('contact-email').value.trim();
            const phone = document.getElementById('contact-phone').value.trim();
            const type = document.getElementById('contact-type').value;
            const content = document.getElementById('contact-content').value.trim();

            // 입력값 검증
            if (!name) {
                alert('이름을 입력해주세요.');
                return;
            }
            if (!email) {
                alert('이메일을 입력해주세요.');
                return;
            }
            if (!phone) {
                alert('연락처를 입력해주세요.');
                return;
            }
            if (!type) {
                alert('문의 유형을 선택해주세요.');
                return;
            }
            if (!content) {
                alert('문의 내용을 입력해주세요.');
                return;
            }

            // 문의 완료 모달 열기
            document.getElementById('contactModal').classList.add('active');
        });
    }
});

// ==================== 문의 완료 모달 닫기 ====================
function closeContactModal() {
    document.getElementById('contactModal').classList.remove('active');

    // 폼 초기화
    document.getElementById('contact-name').value = '';
    document.getElementById('contact-email').value = '';
    document.getElementById('contact-phone').value = '';
    document.getElementById('contact-type').value = '';
    document.getElementById('contact-content').value = '';
}