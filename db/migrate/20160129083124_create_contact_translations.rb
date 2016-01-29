class CreateContactTranslations < ActiveRecord::Migration
  def self.up
    Contact.create_translation_table!({
      bio: :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    Contact.drop_translation_table! migrate_data: true
  end
end
