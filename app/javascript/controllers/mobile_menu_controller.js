import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["toggleable"]

  toggle() {
    this.toggleableTarget.classList.toggle("hidden")
  }
}
