import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["closeAlertButton"]

  close() {
    this.closeAlertButtonTarget.remove();
    document.querySelector(".blackout").remove();
  }
}
