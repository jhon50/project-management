require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all projects to @projects' do
      get :index

      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested project to @project' do
      get :show, params: { id: project.id }

      expect(response.status).to eq(200)
    end
  end

  describe 'PUT #update' do
    let(:new_status) { 'ready_to_dev' }

    it 'updates the project' do
      put :update, params: { id: project.id, project: { status: new_status } }
      project.reload
      expect(project.status).to eq(new_status)
    end

    it 'creates a comment' do
      expect {
        put :update, params: { id: project.id, project: { status: new_status } }
      }.to change(Comment, :count).by(1)
    end
  end
end
