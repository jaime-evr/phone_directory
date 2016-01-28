require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "it's invalid without a name" do
    let(:contact) { FactoryGirl.build(:contact, name: nil) }

    it { expect(contact).to_not be_valid }
  end

  context "it's invalid without a last name" do
    let(:contact) { FactoryGirl.build(:contact, last_name: nil) }

    it { expect(contact).to_not be_valid }
  end
end
