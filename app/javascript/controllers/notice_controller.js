import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notice"
export default class extends Controller {
  static targets = ["closeNoticeButton"]

  connect() {
  }

  close() {
    this.closeNoticeButtonTarget.remove();
    document.querySelector(".blackout").remove();
  }
}
