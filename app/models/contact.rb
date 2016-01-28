class Contact < ActiveRecord::Base
  validates :name, :last_name, presence: true
end
