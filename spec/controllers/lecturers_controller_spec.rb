require 'rails_helper'

RSpec.describe LecturersController, :type => :controller  do

  context 'new' do
    it 'renders a template new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new lecturer to @lecturer' do
      get :new
      expect(assigns(:lecturer)).to be_a_new(Lecturer)
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
      it 'saves the new lecturer in the DB and displays success flash message' do
        expect{
          post :create, params:{ lecturer: attributes_for(:lecturer) }
        }.to change(Lecturer, :count).by(1)
        expect(flash[:info]).to eq("Check mail to activate account")
      end


      it 'redirects to lecturer #show upon save' do
        post :create, params:{ lecturer: attributes_for(:lecturer) }
        expect(response).to redirect_to root_url
      end
    end

    context 'with invalid data' do
      it 're-renders the template new' do
        post :create, params: {
          lecturer: attributes_for(:lecturer_invalid)}
        expect(response).to render_template(:new)
        expect(flash[:nasty]).to eq("OOPS!! Check your input and try again")
      end
      it 'does not save the new @contact' do
        expect{
          post :create, params:{ lecturer: attributes_for(:lecturer_invalid) }
        }.not_to change(Lecturer, :count)
      end
    end
  end

  describe "PATCH #update" do

    before :each do 
      @lecturer = create(:lecturer)
    end

    context "with valid attributes" do

      it "should update lecturer info" do
        patch :update, params:{
          id: @lecturer, lecturer: attributes_for(:lecturer, f_name: "Cess", l_name: "Terrence"  )
        }
        @lecturer.reload
        expect(@lecturer.f_name).to eq("Cess")
        expect(@lecturer.l_name).to eq("Terrence")
        expect(flash[:success]).to eq("Profile updated!!")
      end

      it 'locates the requested @lecturer' do
        patch :update, params:{
          id: @lecturer, lecturer: attributes_for(:lecturer)
        }
        expect(assigns[:lecturer]).to eq(@lecturer)
      end

      it 'redirects to the lecturer profile' do
        patch :update, params:{
          id: @lecturer, lecturer: attributes_for(:lecturer)
        }
        expect(response).to redirect_to(@lecturer)
      end
    end
    context "with invalid attributes" do
      it "does not change the lecturer details" do
        patch :update, params:{
          id: @lecturer, lecturer: attributes_for(:lecturer, f_name: nil, l_name: "Terrence"  )
        }
        @lecturer.reload
        expect(@lecturer.f_name).to eq("Cortana")
        expect(@lecturer.l_name).not_to eq("Terrence")
      end
      it 're-render the edit template' do
        patch :update, params:{
          id: @lecturer, lecturer: attributes_for(:lecturer_invalid)
        }
        expect(response).to render_template(:edit)
        expect(flash[:nasty]).to eq("Please check your information")
      end
    end
  end

  describe 'destroy' do
    before :each do
      @lecturer = create(:lecturer)
    end
    it 'deletes the lecturer from the database' do
      expect{ delete :destroy, params: { id: @lecturer }
      }.to change(Lecturer, :count).by(-1)
    end
    it 'redirects to lecturers#index' do
      delete :destroy, params: { id: @lecturer  }
      expect(response).to redirect_to(lecturers_path)
      expect(flash[:success]).to eq("Lecturer Deleted")
    end
  end
end
