const counter = (numberPlace, plusButton, restButton) => {
    let counter = 0;
    numberPlace.innerText = 0;
    plusButton.addEventListener("click", () => {
        counter += 1;
        numberPlace.innerText = counter;
    });
    restButton.addEventListener("click", () => {
        if (counter > 0) {
            counter -= 1;
            numberPlace.innerText = counter;
        } else {
            numberPlace.innerText = 0;
        };
    });
} 

export { counter };