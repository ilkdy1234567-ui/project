// ==================== AOS 애니메이션 초기화 ====================
AOS.init();

// ==================== 장바구니 전역 변수 ====================
let cart = [];

// ==================== 모바일 사이드바 토글 ====================
function toggleSidebar() {
    document.getElementById('mobileSidebar').classList.toggle('active');
}

// ==================== 장바구니에 상품 추가 (담기 버튼 클릭 시 장바구니 바로 열기) ====================
function addToCart(name, price) {
    const found = cart.find(item => item.name === name);
    if (found) {
        found.qty++;
    } else {
        cart.push({ name, price, qty: 1 });
    }
    updateCartUI();
    
    // 장바구니 대시보드를 바로 열기 (확실하게!)
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
            updateCartUI();
        }
    }
}

// ==================== 장바구니에서 상품 제거 ====================
function removeFromCart(name) {
    cart = cart.filter(item => item.name !== name);
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
                <button onclick="changeQty('${item.name}', -1)">-</button>
                <span>${item.qty}</span>
                <button onclick="changeQty('${item.name}', 1)">+</button>
            </div>
            <i class="fas fa-trash-alt" style="cursor:pointer; color:#ccc;" onclick="removeFromCart('${item.name}')"></i>
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
    if (cart.length === 0) return;
    
    const modal = document.getElementById('orderModal');
    const finalPrice = document.getElementById('total-price-display').innerText;
    const finalCount = cart.reduce((acc, item) => acc + item.qty, 0);
    
    // 주문 메뉴 리스트 생성
    const menuList = document.getElementById('order-menu-list');
    let menuHtml = '';
    cart.forEach(item => {
        menuHtml += `<div style="display: flex; justify-content: space-between; margin-bottom: 8px; padding-bottom: 8px; border-bottom: 1px solid #e5e5e5;">
            <span><strong>${item.name}</strong></span>
            <span style="color: #666;">${item.qty}개 / ${(item.price * item.qty).toLocaleString()}원</span>
        </div>`;
    });
    menuList.innerHTML = menuHtml;
    
    document.getElementById('final-order-price').innerText = finalPrice;
    document.getElementById('final-item-count').innerText = finalCount + '건';
    
    modal.classList.add('active');
    document.getElementById('cart-dashboard').classList.remove('active');
}

// ==================== 주문서 모달 닫기 ====================
function closeOrderModal() {
    document.getElementById('orderModal').classList.remove('active');
}

// ==================== 최종 주문 확정 ====================
function confirmFinalOrder() {
    const phone = document.getElementById('order-phone').value;
    const time = document.getElementById('order-time').value;
    
    if (!phone) {
        alert('연락처를 입력해주세요.');
        return;
    }
    
    alert(`주문이 정상적으로 접수되었습니다!\n\n연락처: ${phone}\n픽업 시간: ${time}\n\n여운 커피를 이용해주셔서 감사합니다.`);
    
    cart = [];
    updateCartUI();
    closeOrderModal();
    document.getElementById('order-phone').value = '';
    document.getElementById('order-memo').value = '';
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