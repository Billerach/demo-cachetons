import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-company"
export default class extends Controller {
  static targets = ["editCompanyForm", "editCompanyLink", "storedCompanyData"]
  edit(event) {
    event.preventDefault();
    this.editCompanyFormTarget.classList.remove("d-none");
    this.editCompanyLinkTarget.classList.add("d-none");
    this.storedCompanyDataTarget.classList.add("d-none");
  }
}
