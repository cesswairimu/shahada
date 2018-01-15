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
      post :create,params:{
    user: attributes_for(:user1) }
      expect(response).to render_template(:new)
    end
    it 'does not save the new @contact' do
    expect{
        post :create, params:{ user: attributes_for(:user1) }
       }.not_to change(User, :count)
    end
  end

 end


  describe "PATCH #update" do
  before :each do
    @user = create(:user)
  end

  context "with valid attributes" do

    it "locates the requested @user" do
      patch :update, params: { id: @user, user: attributes_for(:user) }
      expect(assigns(:user)).to eq(@user)
    end

    it "updates the user info" do
      patch :update, params: { 
        id: @user, user: attributes_for(:user, f_name: "Foo", l_name: "Bar")
      }
      @user.reload
      expect(@user.f_name).to eq("Foo")
      expect(@user.l_name).to eq("Bar")
    end
    it 'redirects to the user profile' do
      patch :update, params: { id: @user, user: attributes_for(:user) }
      expect(response).to redirect_to(@user)
    end
  end
  context "with invalid attributes" do

    it "does not change the user details" do
      patch :update, params: { 
        id: @user, user: attributes_for(:user, f_name: "Foo", l_name: nil)
      }
      @user.reload
      expect(@user.f_name).not_to eq("Foo")
    end

    it 're-render the edit template' do
      patch :update, params: { id: @user, user: attributes_for(:user1) }
      expect(response).to render_template(:edit)
    end
  end
  end

  describe 'destroy' do
    before :each do
      @user = create(:user)
    end

    it 'deletes the user from the database' do
      expect{ 
        delete :destroy, params: { id: @user  }
      }.to change(User, :count).by(-1)
    end

    it 'redirects to users#index' do
      delete :destroy, params: { id: @user  }
      expect(response).to redirect_to(users_path)
    end
    end
end


