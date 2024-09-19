import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cancel"
export default class extends Controller {
  static targets = ["cancelButton"]

  cancel() {
    location.reload();
  }
}
