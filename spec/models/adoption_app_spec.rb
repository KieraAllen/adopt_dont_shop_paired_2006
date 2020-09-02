require 'rails_helper'

RSpec.describe AdoptionApp, type: :model do
  describe 'relationships' do
    it { should belong_to(:pet) }
  end
end
