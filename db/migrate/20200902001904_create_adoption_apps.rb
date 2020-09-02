class CreateAdoptionApps < ActiveRecord::Migration[5.2]
  def change
    create_table :adoption_apps do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :description
      t.string :creep_status

      t.timestamps
    end
  end
end
