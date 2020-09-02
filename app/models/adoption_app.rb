class AdoptionApp < ApplicationRecord
  has_many :pets, through: :pet_adoption_apps
  has_many :pet_adoption_apps
end
