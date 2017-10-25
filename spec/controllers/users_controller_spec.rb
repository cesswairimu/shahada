# require 'support/factory_girl'
require 'rails_helper'
describe UsersController  do

  context 'new' do
    it 'renders a template new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context 'show' do
    it 'renders a template show' do
      user = create(:user)
      get :show, params: {id: user} 
      expect(response).to render_template(:show)
    end
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq(user)
    end
  end


  context 'index' do 
 it 'renders a template index' do
    get :index
    expect(response).to render_template(:index)
  end
 it 'populates an array all users' do
   bunch = create(:user, f_name: "Bunch")
   buzz = create(:user, f_name: "Buzz")
   get :index
   expect(assigns(:users)).to match_array([bunch,buzz])
 end
  end

  context 'edit' do
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq(user)
    end
    it 'renders a template edit' do
      user = create(:user)
      get :edit, params: { id: user }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before :each do
      @users = [attributes_for(:user)]
    end
    context 'with valid data' do
      it 'saves the new user in the DB' do
       expect{
        post :create, params:{ user: attributes_for(:user) }
       }.to change(User, :count).by(1) 
      end


      it 'redirects to user #show upon save' do
        post :create, params:{ user: attributes_for(:user) }
        expect(response).to redirect_to user_path(assigns[:user])
      end
    end

  context 'with invalid data' do
    it 're-renders the template new' do
      post :create,
      user: attributes_for(:user_invalid)
      expect(response).to render_template(:new)
    end
    it 'does not save the new @contact' do
    expect{
        post :create, params:{ user: attributes_for(:user1) }
       }.not_to change(User, :count)
o
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


