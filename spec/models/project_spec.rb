require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:comments) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:status) }
end
