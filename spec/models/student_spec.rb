require 'rails_helper'
describe Student do
  it 'has a valid factory' do
    expect(build(:student)).to be_valid
  end

  it 'is valid with a f_name, l_name, phone, reg_no and email' do
    student = create(:student)
    expect(student).to be_valid
  end

  it 'is invalid without an email' do
    student = build(:student, email: nil)
    student.valid?
    expect(student.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without f_name'do
    student = build(:student, f_name: nil)
    student.valid?
    expect(student.errors[:f_name]).to include("can't be blank")
  end

  it 'is invalid without l_name' do
    student = build(:student, l_name: nil)
    student.valid? 
    expect(student.errors[:l_name]).to include("can't be blank")
  end 

  it 'is invalid without reg_no' do
    student = build(:student, reg_no: nil)
    student.valid?
    expect(student.errors[:reg_no]).to include("can't be blank") 
  end

  it 'is invalid without phone' do
    student = build(:student, phone: nil)
    student.valid?
    expect(student.errors[:phone]).to include("can't be blank")
  end

  it 'returns phone as numeric'
  it 'returns full name as a string' do
    student = Student.new(f_name: "Joe", l_name: "Doe")
    expect(student.name).to eq('Joe Doe')
  end

  it 'is invalid with a duplicate email' do
    FactoryBot.create(:student, email: "bunch@fav.com")
    student = FactoryBot.build(:student,  email: "bunch@fav.com")
    student.valid?
    expect(student.errors[:email]).to include("has already been taken")
  end

  it 'is invalid if password is not more than 6 characters' do
    student = Student.new(password: "e")
    student.valid?
    expect(student.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end

