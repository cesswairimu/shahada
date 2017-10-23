# require 'support/factory_girl'
require 'rails_helper'
describe UsersController  do

  context 'new' do
    it 'renders a template new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new User to @user' do
    end
  end

  context 'show' do
    it 'renders a template show' do
      skip
      get :show, params: { user: FactoryGirl.attributes_for(:user) }
      expect(response).to render_template(:show)
    end
    it 'assigns the requested user to @user' do
    end
  end


  context 'index' do 
 it 'renders a template index' do
    get :index
    expect(response).to render_template(:index)
  end
 it 'populates an array all users' do
 end
  end

context 'edit' do
 it 'renders a template edit' do
   skip
    get :edit, params: { user: FactoryGirl.attributes_for(:user) }
    expect(response).to render_template(:edit)
  end
 it 'assigns the requested user to @user' do
 end
end

describe 'POST #create' do
  context 'with valid data' do
    it 'saves the new contact in the DB' do

    end
    it 'redirects to root_url upon save' do
      post :create, params:{ user: FactoryGirl.attributes_for(:user) }
      expect(response).to redirect_to root_url
    end
  end

  context 'with invalid data' do
    it 're-renders the template new' do
    end
    it 'does not save the new @contact' do
    end
  end

 end
 end


describe "PATCH #update" do
  skip
  context "with valid attributes" do
    it "updates the user info and redirects" do
    end
    it 'redirects to the user profile' do
    end
  end
  context "with invalid attributes" do
    it "does not change the user details" do
    end
    it 're-render the edit template' do
    end
  end

  describe 'destroy' do
    it 'deletes the user from the database' do
    end
    it 'redirects to users#index' do
    end
    end
end


