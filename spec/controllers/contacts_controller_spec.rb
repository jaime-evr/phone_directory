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

    it 'should find the requested contact' do
      expect(assigns(:contact)).to eq(contact)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    let(:contact) { FactoryGirl.create(:contact) }

    before { get :edit, id: contact }

    it 'should find the requested contact' do
      expect(assigns(:contact)).to eq(contact)
    end

    it 'should render the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'should build a new contact' do
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'should render the new template' do
      expect(response).to render_template(:new)
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

  describe 'POST update' do
    let(:contact) { FactoryGirl.create(:contact, name: 'Jhon', last_name: 'Doe') }

    context 'with valid attributes' do
      before do
        put :update, id: contact, contact: FactoryGirl.attributes_for(:contact)
        contact.reload
      end

      it 'should locate the requested contact' do
        expect(assigns(:contact)).to eq(contact)
      end

      context 'should update the contact attributes' do
        it { expect(contact.name).to eq('Contact') }
        it { expect(contact.last_name).to eq('User') }
      end
    end

    context 'with invalid attributes' do
      let(:contact) { FactoryGirl.create(:contact, name: 'Jhon', last_name: 'Doe') }

      before do
        put :update, id: contact, contact: FactoryGirl.attributes_for(:contact, name: nil, last_name: nil)
        contact.reload
      end

      it 'should locate the requested contact' do
        expect(assigns(:contact)).to eq(contact)
      end

      context 'should not change the contact attributes' do
        it { expect(contact.name).to eq('Jhon') }
        it { expect(contact.last_name).to eq('Doe') }
      end
    end
  end
end

