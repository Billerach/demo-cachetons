import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-employee"
export default class extends Controller {
  static targets = [
    "editEmployeeContainer",
    "editEmployeeButton",
    "editEmployeeForm",
    "storedEmployeeData"
  ]

  edit(event) {
    event.preventDefault();
    this.editEmployeeFormTarget.classList.remove("d-none");
    this.storedEmployeeDataTarget.classList.add("d-none");
    this.editEmployeeButtonTarget.classList.add("d-none");
    this.editEmployeeContainerTarget.insertAdjacentHTML(
      "beforeEnd",
      "<div class='blackout'>",
    );
  }
}
