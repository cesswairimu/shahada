# require 'support/factory_girl'
require 'rails_helper'
describe LecturersController  do

  context 'new' do
    it 'renders a template new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new lecturer to @lecturer' do
      get :new
      expect(assigns(:lecturer)).to be_a_new(lecturer)
    end
  end

  context 'show' do
    it 'renders a template show' do
      lecturer = create(:lecturer)
      get :show, params: {id: lecturer} 
      expect(response).to render_template(:show)
    end
    it 'assigns the requested lecturer to @lecturer' do
      lecturer = create(:lecturer)
      get :show, params: { id: lecturer }
      expect(assigns(:lecturer)).to eq(lecturer)
    end
  end


  context 'index' do 
 it 'renders a template index' do
    get :index
    expect(response).to render_template(:index)
  end
 it 'populates an array all lecturers' do
   bunch = create(:lecturer, f_name: "Bunch")
   buzz = create(:lecturer, f_name: "Buzz")
   get :index
   expect(assigns(:lecturers)).to match_array([bunch,buzz])
 end
  end

  context 'edit' do
    it 'assigns the requested lecturer to @lecturer' do
      lecturer = create(:lecturer)
      get :edit, params: { id: lecturer }
      expect(assigns(:lecturer)).to eq(lecturer)
    end
    it 'renders a template edit' do
      lecturer = create(:lecturer)
      get :edit, params: { id: lecturer }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before :each do
      @lecturers = [attributes_for(:lecturer)]
    end
    context 'with valid data' do
      it 'saves the new lecturer in the DB' do
       expect{
        post :create, params:{ lecturer: attributes_for(:lecturer) }
       }.to change(lecturer, :count).by(1) 
      end


      it 'redirects to lecturer #show upon save' do
        post :create, params:{ lecturer: attributes_for(:lecturer) }
        expect(response).to redirect_to lecturer_path(assigns[:lecturer])
      end
    end

  context 'with invalid data' do
    it 're-renders the template new' do
      post :create,
      lecturer: attributes_for(:lecturer_invalid)
      expect(response).to render_template(:new)
    end
    it 'does not save the new @contact' do
    expect{
        post :create, params:{ lecturer: attributes_for(:lecturer1) }
       }.not_to change(lecturer, :count)
o
    end
  end

 end
 end


describe "PATCH #update" do
  skip
  context "with valid attributes" do
    it "updates the lecturer info and redirects" do
    end
    it 'redirects to the lecturer profile' do
    end
  end
  context "with invalid attributes" do
    it "does not change the lecturer details" do
    end
    it 're-render the edit template' do
    end
  end

  describe 'destroy' do
    it 'deletes the lecturer from the database' do
    end
    it 'redirects to lecturers#index' do
    end
    end
end


