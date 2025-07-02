// app/javascript/controllers/datepicker_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import { Portuguese } from "flatpickr/dist/l10n/pt.js"

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      locale: Portuguese,
      dateFormat: "Y-m-d",    // Formato enviado ao servidor: AAAA-MM-DD
      altInput: true,         // Mostra um campo de texto amigável
      altFormat: "d/m/Y",     // Formato que o usuário vê: DD/MM/AAAA
      defaultDate: this.element.value,
      onChange: (selectedDates, dateStr, instance) => {
        // Submete o formulário automaticamente ao escolher uma data
        instance.element.form.submit();
      }
    });
  }
}