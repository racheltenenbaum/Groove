import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["mapButton"]

  fire() {
    this.mapButtonTarget.classList.toggle("d-none")
  }

  connect() {
    console.log("hello from toggle")
  }
}
