class AddDescriptionAndAdoptionStatusToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :description, :string
    add_column :pets, :adoption_status, :string, default: 'Adoptable'
  end
end
