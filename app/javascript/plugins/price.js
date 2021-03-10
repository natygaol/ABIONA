

const price = () => {
  /* Adults price */
  const priceTag = document.querySelector("#total-invoice")
  const totalPrice = document.querySelector("#total-price")
  const children = document.querySelector("#trip_children")
  const adults = document.querySelector("#trip_adults")
  
  if (priceTag) {
    const childrenPrice = priceTag.dataset.childrenPrice
    const adultPrice = priceTag.dataset.adultPrice
    const dateRange = document.querySelector("#range_start")
    let totalDays = 0    
    dateRange.addEventListener("change", () => {     
      setPrice()
    })
    children.addEventListener("change", () => {
      setPrice() 
    })
    adults.addEventListener("change", () => {
      setPrice()  
    })
    const setPrice = () => {
      const dates = dateRange.value.split(" to ")
      if (children.value !== null && adults.value !== null && dates.length === 2) {
        totalDays = (Date.parse(dates[1]) - Date.parse(dates[0])) / (3600*24*1000)   
        totalPrice.innerText = totalDays * (childrenPrice * children.value + adultPrice * adults.value)
      }
    }
  }
};

 /* Total Invoice */


export { price };
