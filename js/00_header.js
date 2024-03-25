// hamburgur animation
let forEach = function (t, o, r) {
  if ("[object Object]" === Object.prototype.toString.call(t))
    for (let c in t)
      Object.prototype.hasOwnProperty.call(t, c) && o.call(r, t[c], c, t);
  else for (let e = 0, l = t.length; l > e; e++) o.call(r, t[e], e, t);
};

const hamburgers = document.querySelectorAll(".hamburger");
const hamList = document.querySelector(".hamburger-list");

if (hamburgers.length > 0) {
  forEach(hamburgers, function (hamburgers) {
    hamburgers.addEventListener(
      "click",
      function () {
        if (hamburgers.classList.contains("is-active") === true) {
          hamList.classList.add("share-animation-back");
          hamList.classList.remove("share-animation");
          this.classList.remove("is-active");
          setTimeout('hamList.classList.remove("share-animation-back")', 2000);
        } else {
          this.classList.add("is-active");
          hamList.classList.add("share-animation");
          hamList.classList.remove("share-animation-back");
        }
        // this.classList.toggle("is-active");
        // hamList.classList.toggle("is-active");
      }
      // , false
    );
  });
}

// cart animation
const cart = document.querySelector(".cart-btn");
const cartList = document.querySelector(".cart-list");
const closeBtn = document.querySelector(".btn-close");

cart.addEventListener("click", function () {
  cartList.classList.add("cart-animation");
  cartList.classList.remove("cart-animation-back");
});

closeBtn.addEventListener("click", function () {
  cartList.classList.add("cart-animation-back");
  cartList.classList.remove("cart-animation");
});

// logo hover到變色

//
const product = document.querySelector(".products-list");
productHTML = "";

function productList(product) {
  productHTML += `
  <div class="carts-product">
    <img src="./images/00_header/cart01.jpg" alt="">
    <div class="product-details">
    <p>霧光感透肌高領長版上衣</p>
    <p>尺寸 <span>M</span></p>
    <p>顏色 <span>白</span></p>
    <p>數量 <span>1</span></p>
    </div>
  </div>
  `;
  return productHTML;
}

product.innerHTML = productList(product);

// 搜尋框動畫
(() => {
  const btnSearch = document.querySelector(".btn-search");
  const searchInput = document.querySelector(".search-input");
  const searchContainer = document.querySelector(".search-container");

  const handleBtnClick = () => {
    searchContainer.classList.add("active");
    searchInput.focus();
  };

  const handleBlur = () => {
    searchContainer.classList.remove("active");
  };

  const bindEvent = () => {
    btnSearch.addEventListener("click", handleBtnClick);
    searchInput.addEventListener("blur", handleBlur);
  };

  const init = () => {
    bindEvent();
  };
  init()
}) ()

// function toggleSearch() {
//   const container = document.querySelector('.search-container')
//   container.classList.toggle('active')
// }