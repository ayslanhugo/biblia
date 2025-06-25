// app/javascript/controllers/autosubmit_controller.js
import { Controller } from "@hotwired/stimulus"

// Este controlador submete o formulário a que pertence sempre que um evento acontece
export default class extends Controller {
  submit() {
    this.element.form.requestSubmit();
  }
}