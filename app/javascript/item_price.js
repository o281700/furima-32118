function itemPrice (){
  const inputPrice = document.getElementById("item-price");
  if(inputPrice) {
    inputPrice.addEventListener('input', () => {
      const taxPrice = parseInt(inputPrice.value * 0.1);
      const taxDisplay = document.getElementById("add-tax-price");
      const profitDisplay = document.getElementById("profit");
      taxDisplay.innerHTML = `${taxPrice}`;
      profitDisplay.innerHTML = `${inputPrice.value - taxPrice}`
    });
  };
};
window.addEventListener('load', itemPrice);