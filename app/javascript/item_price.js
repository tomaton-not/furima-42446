// app/javascript/item_price.js
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const value = priceInput.value;
    const tax = Math.floor(value * 0.1);
    const profit = value - tax;
    document.getElementById("add-tax-price").innerHTML = tax;
    document.getElementById("profit").innerHTML = profit;
  });
});
