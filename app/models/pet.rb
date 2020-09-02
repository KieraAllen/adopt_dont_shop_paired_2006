class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :adoption_apps, through: :pet_adoption_apps
  has_many :pet_adoption_apps
end
