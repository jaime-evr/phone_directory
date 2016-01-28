require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validates required attributes' do
    it { is_expected.to validate_presence_of(:address1) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:zip_code) }
  end


  context 'validates relations' do
    it { is_expected.to belong_to(:contact) }
  end

end
