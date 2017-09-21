# require 'support/factory_girl'
require 'rails_helper'
describe UsersController  do
  it 'renders a template new' do
    get :new
    expect(response).to render_template(:new)
  end
 # it 'renders a template show' do
 #    get :show, params:{ id:user.id }
 #    expect(response).to render_template(:show)
 #  end
 it 'renders a template index' do
    get :index
    expect(response).to render_template(:index)
  end
 # it 'renders a template edit' do
 #    get :edit
 #    expect(response).to render_template(:edit)
 #  end

 # describe "PATCH #update" do
 #   context "with good data" do
 #     stub = build_stubbed(:user)
 #     it "updates the user info and redirects" do
 #       patch :update, id: @user.id, user: { name: "xyz", email: "xyz@gmail.com" }
 #       expect(response).to be_redirect
 #     end
 #   end
   # context "with bad data" do
   #   it "does not change the wallet, and re-renders the form" do
   #     patch :update, id: @wallet.id, wallet: { name: "xyz", balance: "two" }
   #     expect(response).not_to be_redirect
   #   end
   # end
 end
require 'rail_helper'
describe UsersController do
  it 'renders a new template'do
    get :new
    expect(response).to render_template(:new)
  end

  it 'renders an index template' do
    get :index
    expect(:response).to render_template(:index)
end
end

