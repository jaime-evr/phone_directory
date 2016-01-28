class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string  :name
      t.string  :last_name
      t.text    :bio
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
