class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :adoption_apps
  
end
