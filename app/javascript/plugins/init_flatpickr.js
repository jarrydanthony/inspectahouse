import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker.js-flatpickr-dateTime", {
    dateTime: true,
    altInput: true,
    inline:true,
    altFormat: 'd/m/Y',
    dateFormat: 'Y-m-d',
  });
  flatpickr(".timepicker", {
    enableTime:true,
    noCalendar:true,
    inline:true,
    });
}
export { initFlatpickr };
