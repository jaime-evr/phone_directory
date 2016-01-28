class Address < ActiveRecord::Base
  belongs_to :contact

  validates :address1, :city, :state, :country, :zip_code, presence: true
end
