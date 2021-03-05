import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
import 'flatpickr/dist/flatpickr.min.css'

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    altInputClass: "invisible",
    inline: true,
    minDate: new Date(),
    plugins: [new rangePlugin({ input: "#range_end" })]
  });
}

export { initFlatpickr };