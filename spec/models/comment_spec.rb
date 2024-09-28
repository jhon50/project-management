require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:user_id) }
end
