import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-performance"
export default class extends Controller {
  static targets = ["editPerformanceForm", "editPerformanceButton", "editPerformanceContainer"]

  edit() {
    this.editPerformanceFormTarget.classList.remove("d-none");
    this.editPerformanceContainerTarget.insertAdjacentHTML(
      "beforeEnd",
      "<div class='blackout'>",
    );
  }
}
