import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "form", "list", "comment", "submitButton" ]

  connect() {
    console.log("Connected to comments controller!")
  }

  editComment(event) {
    this.currentComment = event.target
    this.currentCommentId = event.target.dataset.commentId
    this.formTarget.value = this.currentComment.textContent
    this.submitButtonTarget.value = "Update Comment"
  }

  upsertComment(event) {
    event.preventDefault()

    // Comment update
    if (this.currentComment) {
      this.updateComment();

      return
    }

    this.addComment();
  }

  addComment() {
    let comment = this.formTarget.value

    let newComment = document.createElement("div")
    newComment.classList.add("card", "card-body", "mt-2")
    newComment.textContent = comment
    newComment.setAttribute("data-action", "click->comments#editComment")

    let newCommentId = Date.now().toString()
    newComment.setAttribute("data-comment-id", newCommentId)

    this.listTarget.appendChild(newComment)

    this.formTarget.value = ""

    fetch(`/comments`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ comment: { description: comment, project_id: this.listTarget.dataset.projectId } }),
    })
    .then(response => response.json())
    .then(data => {
      console.log('Success:', data)
    })
    .catch((error) => {
      console.error('Error:', error)
    })
  }

  updateComment(comment) {
    let updatedComment = this.formTarget.value
    this.currentComment.textContent = updatedComment
    this.currentComment = null
    this.formTarget.value = ""
    this.submitButtonTarget.value = "Add Comment"

    fetch(`/comments/${this.currentCommentId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ description: updatedComment }),
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
