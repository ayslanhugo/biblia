// app/javascript/controllers/password_visibility_controller.js
import { Controller } from "@hotwired/stimulus"

// Conecta-se a um <div data-controller="password-visibility">
export default class extends Controller {
  // Define os "alvos" que o nosso controlador vai procurar dentro da div
  static targets = [ "input", "iconShow", "iconHide" ]

  toggle() {
    // Verifica o tipo atual do campo de input
    if (this.inputTarget.type === "password") {
      // Se for 'password', muda para 'text' para o mostrar
      this.inputTarget.type = "text"
      // Esconde o ícone de "olho aberto" e mostra o de "olho fechado"
      this.iconShowTarget.classList.add("hidden")
      this.iconHideTarget.classList.remove("hidden")
    } else {
      // Se for 'text', muda de volta para 'password' para o esconder
      this.inputTarget.type = "password"
      // Esconde o ícone de "olho fechado" e mostra o de "olho aberto"
      this.iconShowTarget.classList.remove("hidden")
      this.iconHideTarget.classList.add("hidden")
    }
  }
}