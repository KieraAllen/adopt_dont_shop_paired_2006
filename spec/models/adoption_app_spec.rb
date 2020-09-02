require 'rails_helper'

RSpec.describe AdoptionApp, type: :model do
  describe 'relationships' do
    it { should have_many(:pets).through(:pet_adoption_apps) }
    it { should have_many(:pet_adoption_apps) }
  end
end
