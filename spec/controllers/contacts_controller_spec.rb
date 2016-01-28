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

  describe 'GET new' do
    before { get :new }

    it 'should build a new contact' do
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe 'POST create' do
    context 'when valid attributes' do
      let(:contact) { FactoryGirl.attributes_for(:contact) }

      it 'should create a new contact' do
        expect {
          post :create, contact: contact
        }.to change(Contact, :count).by(1)
      end

      it 'should redirect to the contact page' do
        post :create, contact: contact
        expect(response).to redirect_to(Contact.last)
      end
    end

    context 'when invalid attributes' do
      let(:contact) { FactoryGirl.attributes_for(:contact, name: nil) }

      it 'should not create a new contact' do
        expect {
          post :create, contact: contact
        }.to_not change(Contact, :count)
      end

      it 'should render the new template' do
        post :create, contact: contact
        expect(response).to render_template(:new)
      end
    end
  end
end

