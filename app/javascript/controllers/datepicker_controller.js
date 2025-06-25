// app/javascript/controllers/datepicker_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
// Importar a localização em português
import { Portuguese } from "flatpickr/dist/l10n/pt.js"

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      locale: Portuguese, // Usar a tradução
      dateFormat: "Y-m-d",
      onChange: function(selectedDates, dateStr, instance) {
        // Submete o formulário automaticamente quando uma data é escolhida
        instance.element.form.requestSubmit();
      }
    });
  }
}