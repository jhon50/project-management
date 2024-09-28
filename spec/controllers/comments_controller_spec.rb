require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:comment) { create(:comment, user: user, project: project) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    it 'creates a new comment' do
      expect {
        post :create, params: { comment: { description: 'New comment', project_id: project.id } }
      }.to change(Comment, :count).by(1)
    end
  end

  describe 'PUT #update' do
    it 'updates the comment' do
      put :update, params: { id: comment.id, comment: { description: 'Updated comment' } }
      comment.reload
      expect(comment.description).to eq('Updated comment')
    end

    describe 'when the user is not the owner of the comment' do
      let(:another_user) { create(:user) }
      let(:another_comment) { create(:comment, user: another_user, project: project) }

      it 'raises an exception' do
        expect {
          put :update, params: { id: another_comment.id, comment: { description: 'Updated comment' } }
        }.to raise_error(CommentsController::NotAuthorizedError)
      end
    end
  end
end
