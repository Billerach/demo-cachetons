import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addPayslipForm", "addPayslipButton", "newPayslipContainer"]

  add() {
    this.addPayslipFormTarget.classList.remove("d-none");
    this.addPayslipButtonTarget.classList.add("d-none");
    this.newPayslipContainerTarget.insertAdjacentHTML(
      "beforeEnd",
      "<div class='blackout'>",
    );
  }
}
