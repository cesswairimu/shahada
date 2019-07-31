require 'rails_helper'
describe StudentsController  do

  context 'new' do
    it 'renders a template new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new student to @student' do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  context 'show' do
    it 'renders a template show' do
      student = create(:student)
      get :show, params: {id: student} 
      expect(response).to render_template(:show)
    end
    it 'assigns the requested student to @student' do
      student = create(:student)
      get :show, params: { id: student }
      expect(assigns(:student)).to eq(student)
    end
  end

  context 'index' do 
    it 'renders a template index' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'populates an array all students' do
      bunch = create(:student, f_name: "Bunch")
      buzz = create(:student, f_name: "Buzz")
      get :index
      expect(assigns(:students)).to match_array([bunch,buzz])
    end
  end

  context 'edit' do
    it 'assigns the requested student to @student' do
      student = create(:student)
      get :edit, params: { id: student }
      expect(assigns(:student)).to eq(student)
    end
    it 'renders a template edit' do
      student = create(:student)
      get :edit, params: { id: student }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before :each do
      @students = [attributes_for(:student)]
    end
    context 'with valid data' do
      it 'saves the new student in the DB' do
        expect{
          post :create, params:{ student: attributes_for(:student) }
        }.to change(Student, :count).by(1) 
      end

      it 'redirects to student #show upon save' do
        post :create, params:{ student: attributes_for(:student) }
        expect(response).to redirect_to root_url
        expect(flash[:info]).to eq("Check mail to activate account")
      end
    end

    context 'with invalid data' do
      it 're-renders the template new' do
        post :create,params:{
          student: attributes_for(:student1) }
        expect(response).to render_template(:new)
        expect(flash[:nasty]).to eq("OOPSSS !!Check your input and try again")
      end
      it 'does not save the new @contact' do
        expect{
          post :create, params:{ student: attributes_for(:student1) }
        }.not_to change(Student, :count)
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @student = create(:student)
    end

    context "with valid attributes" do

      it "locates the requested @student" do
        patch :update, params: { id: @student, student: attributes_for(:student) }
        expect(assigns(:student)).to eq(@student)
      end

      it "updates the student info" do
        patch :update, params: { 
          id: @student, student: attributes_for(:student, f_name: "Foo", l_name: "Bar")
        }
        @student.reload
        expect(@student.f_name).to eq("Foo")
        expect(@student.l_name).to eq("Bar")
      end
      it 'redirects to the student profile' do
        patch :update, params: { id: @student, student: attributes_for(:student) }
        expect(response).to redirect_to(@student)
        expect(flash[:success]).to eq("Successful profile edit")
      end
    end
    context "with invalid attributes" do

      it "does not change the student details" do
        patch :update, params: { 
          id: @student, student: attributes_for(:student, f_name: "Foo", l_name: nil)
        }
        @student.reload
        expect(@student.f_name).not_to eq("Foo")
      end

      it 're-render the edit template' do
        patch :update, params: { id: @student, student: attributes_for(:student1) }
        expect(response).to render_template(:edit)
        expect(flash[:nasty]).to eq("Check your input and try again")
      end
    end
  end

  describe 'destroy' do
    before :each do
      @student = create(:student)
    end

    it 'deletes the student from the database' do
      expect{ 
        delete :destroy, params: { id: @student  }
      }.to change(Student, :count).by(-1)
    end

    it 'redirects to students#index' do
      delete :destroy, params: { id: @student  }
      expect(response).to redirect_to(students_path)
      expect(flash[:success]).to eq("Student has been deleted")
    end
  end
end
