require 'rails_helper'

RSpec.describe ContactsController do
  describe 'GET index' do
    let!(:contact) { FactoryGirl.create(:contact) }

    before { get :index }

    it 'should populate an array of contacts' do
      expect(assigns(:contacts)).to eq([contact])
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:contact) { FactoryGirl.create(:contact) }

    before { get :show, id: contact }

    it 'should return the requested contact' do
      expect(assigns(:contact)).to eq(contact)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end
  end
end

