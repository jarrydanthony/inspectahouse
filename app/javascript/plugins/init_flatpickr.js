import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker.js-flatpickr-dateTime", {
    enableTime:true,
    dateTime: true,
    altInput: true,
    altFormat: 'd/m/Y H:i',
    dateFormat: 'Y-m-d H:i',
  });
}
export { initFlatpickr };
