// const paymentInput = document.querySelectorAll(".payment-input");
// const deliveryInput = document.querySelectorAll(".delivery-input")
// console.log(paymentInput);
// console.log(deliveryInput.length);

function chk(input) {
  for (var i = 0; i < document.form1.payment.length; i++) {
    document.form1.payment[i].checked = false;
  }
  console.log(input)
  input.checked = true;
  return true;
}

// paymentInput.addEventListener("click", () => {
//   for (let i = 0; i < paymentInput.length; i++) {
//     paymentInput.children[i].checked = false;
//   }
//   paymentInput.children[i].checked = true;
//   return true;
// });