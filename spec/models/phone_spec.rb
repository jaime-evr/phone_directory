require 'rails_helper'

RSpec.describe Phone, type: :model do
  context 'validates required attributes' do
    it { is_expected.to validate_presence_of(:number) }
  end

  context 'validates relations' do
    it { is_expected.to belong_to(:contact) }
  end
end
