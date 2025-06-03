// app/javascript/item_price.js
const price = () => {
  const priceInput = document.getElementById("item-price");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const value = priceInput.value;
    const tax = Math.floor(value * 0.1);
    const profit = value - tax;
    document.getElementById("add-tax-price").innerHTML = tax;
    document.getElementById("profit").innerHTML = profit;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);