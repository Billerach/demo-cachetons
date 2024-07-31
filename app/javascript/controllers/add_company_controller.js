import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addCompanyForm", "addCompanyButton", "newCompanyContainer"]

  connect() {
  }

  add() {
    this.addCompanyFormTarget.classList.remove("display_none");
    this.addCompanyButtonTarget.classList.add("display_none");
    this.newCompanyContainerTarget.insertAdjacentHTML(
      "beforeEnd",
      "<div class='blackout'>",
    );
  }
}
