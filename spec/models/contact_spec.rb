require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "validates required attributes" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  context 'validates relations' do
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to have_many(:phones).dependent(:destroy) }
  end
end
