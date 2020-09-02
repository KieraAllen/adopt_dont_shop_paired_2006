require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'relationships' do
    it { should belong_to(:shelter) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:rating) }
  end
end
