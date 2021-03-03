const counter = (numberPlace, plusButton, restButton, hiddenInput) => {
  if (numberPlace != null) {
    let counter = 0;
    numberPlace.innerText = 0;
    hiddenInput.value = counter;
    plusButton.addEventListener("click", () => {
        counter += 1;
        numberPlace.innerText = counter;
        hiddenInput.value = counter;
    });
    restButton.addEventListener("click", () => {
        if (counter > 0) {
            counter -= 1;
            numberPlace.innerText = counter;
            hiddenInput.value = counter;
        } else {
            numberPlace.innerText = 0;
            hiddenInput.value = 0;
        };
    });
  };
} 

export { counter };