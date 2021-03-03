import { counter } from '../components/counter';

const dateTripCounter = () => {
  /* Adults counter */
  const plusButton = document.getElementById("plus-adult-button");
  const restButton = document.getElementById("rest-adult-button");
  const numberPlace = document.getElementById("adult-number-place");
  counter(numberPlace, plusButton, restButton);
  /* Childs counter */
  const plusButton2 = document.getElementById("plus-child-button");  
  const restButton2 = document.getElementById("rest-child-button");  
  const numberPlace2 = document.getElementById("child-number-place");  
  counter(numberPlace2, plusButton2, restButton2);
};

export {  dateTripCounter };