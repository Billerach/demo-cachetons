import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addCompanyForm", "addCompanyButton", "newCompanyContainer"]

  add() {
    this.addCompanyFormTarget.classList.remove("d-none");
    this.addCompanyButtonTarget.classList.add("d-none");
    this.newCompanyContainerTarget.insertAdjacentHTML(
      "beforeEnd",
      "<div class='blackout'>",
    );
  }
}
