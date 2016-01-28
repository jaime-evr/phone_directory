class RemoveAddressIdFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :address_id
  end
end
