require 'rails_helper'
describe Lecturer do

  it 'has a valid factory' do
    expect(build(:lecturer)).to be_valid
  end

  it 'is valid with a f_name, l_name, phone, id_no and email' do
    lecturer = create(:lecturer)
    expect(lecturer).to be_valid
  end

  it 'is invalid without an email' do
    lecturer = build(:lecturer, email: nil)
    lecturer.valid?
    expect(lecturer.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without f_name'do
    lecturer = build(:lecturer, f_name: nil)
    lecturer.valid?
    expect(lecturer.errors[:f_name]).to include("can't be blank")
  end

  it 'is invalid without l_name' do
    lecturer = build(:lecturer, l_name: nil)
    lecturer.valid? 
    expect(lecturer.errors[:l_name]).to include("can't be blank")
  end 

  it 'is invalid without id_no' do
    lecturer = build(:lecturer, id_no: nil)
    lecturer.valid?
    expect(lecturer.errors[:id_no]).to include("can't be blank") 
  end

  it 'is invalid without phone' do
    lecturer = build(:lecturer, phone: nil)
    lecturer.valid?
    expect(lecturer.errors[:phone]).to include("can't be blank")
  end
  it 'returns full name as a string' do
    lecturer = Lecturer.new(f_name: "Joe", l_name: "Doe")
    expect(lecturer.name).to eq('Joe Doe')
  end

  it 'is invalid with a duplicate email' do
    FactoryBot.create(:lecturer, email: "bunch@fav.com")
    lecturer = FactoryBot.build(:lecturer,  email: "bunch@fav.com")
    lecturer.valid?
    expect(lecturer.errors[:email]).to include("has already been taken")
  end

  it 'validate length of password' do
    lecturer = build(:lecturer, password: "1235")
    lecturer.valid?
    expect(lecturer.errors[:password]).to include('is too short (minimum is 6 characters)')
  end

  it {should have_many(:assignments)}
end
