require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validates required attributes' do
    let(:address) do
      FactoryGirl.build(:address,
        address1: nil,
        city: nil,
        state: nil,
        country: nil,
        zip_code: nil
      )
    end

    it { expect(address).to_not be_valid }
  end
end
