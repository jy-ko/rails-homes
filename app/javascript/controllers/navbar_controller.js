import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mainmenu", "usermenu"]

  toggleMainMenu() {
    this.mainmenuTarget.classList.toggle("hidden");
  }
  toggleUserMenu() {
    this.usermenuTarget.classList.toggle("hidden");
  }
}
