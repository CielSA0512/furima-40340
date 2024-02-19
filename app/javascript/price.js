function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => { 
    const itemValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(itemValue/10);
    const taxPrice = addTaxPrice.innerHTML;
    Profit.innerHTML = Math.floor(itemValue - taxPrice);
  });
};


window.addEventListener('turbo:load', price);