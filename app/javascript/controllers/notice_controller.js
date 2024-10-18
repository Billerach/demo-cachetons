import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notice"
export default class extends Controller {
  static targets = ["closeNoticeButton"]

  close() {

    if (this.hasCloseNoticeButtonTarget) {
      this.closeNoticeButtonTarget.remove();
    }

    const blackoutElement = document.querySelector(".blackout");
    if (blackoutElement) {
      blackoutElement.remove();
    }

  }
}
