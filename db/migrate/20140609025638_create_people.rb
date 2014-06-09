class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :ip_address
      t.string :name
      t.string :credit_card
      t.text :bio
      t.string :phone
      t.string :avatar

      t.timestamps
    end
  end
end
