require 'spec_helper'

RSpec.describe PhonesController do
  describe 'GET edit' do
    let(:phone) { FactoryGirl.create(:phone) }

    before { get :edit, id: phone }

    it 'should find the requested phone' do
      expect(assigns(:phone)).to eq(phone)
    end

    it 'should render the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE destroy' do
    let!(:phone) { FactoryGirl.create(:phone) }
    let(:contact) { phone.contact }

    it 'should delete the phone' do
      expect{
        delete :destroy, id: phone
      }.to change(Phone,:count).by(-1)
    end

    it 'should redirect to the contacts page' do
      delete :destroy, id: phone
      expect(response).to redirect_to(contact)
    end
  end

  describe 'POST update' do
    let(:phone) { FactoryGirl.create(:phone, number: '000000') }

    it 'should locate the requested phone' do
      put :update, id: phone, phone: FactoryGirl.attributes_for(:phone)
      expect(assigns(:phone)).to eq(phone)
    end

    context 'with valid attributes' do
      before do
        put :update, id: phone, phone: FactoryGirl.attributes_for(:phone)
        phone.reload
      end

      context 'should update the phone attributes' do
        it { expect(phone.number).to eq('5555511000') }
      end
    end

    context 'with invalid attributes' do
      before do
        put :update, id: phone, phone: FactoryGirl.attributes_for(:phone, number: nil)
        phone.reload
      end

      context 'should not change the phone attributes' do
        it { expect(phone.number).to eq('000000') }
      end
    end
  end
end
