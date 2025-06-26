// app/javascript/controllers/datepicker_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
// Importar a localização em português
import { Portuguese } from "flatpickr/dist/l10n/pt.js"

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      locale: Portuguese, // Tradução
      dateFormat: "Y-m-d",
      altInput: true,          // Para mostrar um input bonitinho (ex: 26/06/2025)
      altFormat: "d/m/Y",      // Formato do input alternativo
      defaultDate: this.element.value || null,  // Já carregar a data selecionada, se houver
      onChange: () => {
        this.element.form.requestSubmit();      // Faz o submit automático
      }
    });
  }
}
