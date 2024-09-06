import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notice"
export default class extends Controller {
  static targets = ["closeNoticeButton"]

  close() {
    this.closeNoticeButtonTarget.remove();
    document.querySelector(".blackout").remove();
  }
}
