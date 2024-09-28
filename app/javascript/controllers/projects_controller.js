import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "status" ]

  connect() {
    console.log("Connected to projects controller!")
  }

  updateStatus(event) {
    event.preventDefault()

    let newStatus = this.statusTarget.value

    fetch(`/projects/${this.element.dataset.projectId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ status: newStatus }),
    })
    .then(response => response.json())
    .then(data => {
      console.log('Success:', data)
    })
    .catch((error) => {
      console.error('Error:', error)
    })
  }
}
