class Contact < ActiveRecord::Base
  has_one :address, dependent: :destroy
  has_many :phones, dependent: :destroy

  validates :name, :last_name, presence: true

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones

  translates :bio

  def to_s
    "#{name} #{last_name}"
  end
end

