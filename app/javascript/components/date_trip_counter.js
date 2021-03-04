import { counter } from '../components/counter';

const dateTripCounter = () => {
  /* Adults counter */
  const plusButton = document.getElementById("plus-adult-button");
  const restButton = document.getElementById("rest-adult-button");
  const numberPlace = document.getElementById("adult-number-place");
  const hiddenNumberPlace = document.querySelector("#trip_adults");
  counter(numberPlace, plusButton, restButton, hiddenNumberPlace);
  /* Childs counter */
  const plusButton2 = document.getElementById("plus-child-button");  
  const restButton2 = document.getElementById("rest-child-button");  
  const numberPlace2 = document.getElementById("child-number-place");
  const hiddenNumberPlace2 = document.querySelector("#trip_children");
  counter(numberPlace2, plusButton2, restButton2, hiddenNumberPlace2);
};

export { dateTripCounter };
