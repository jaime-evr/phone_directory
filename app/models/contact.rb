class Contact < ActiveRecord::Base
  has_one :address, dependent: :destroy

  validates :name, :last_name, presence: true
end

