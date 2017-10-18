require 'rails_helper'
describe User do
  it 'is valid with a f_name, l_name, phone, reg_no and email' do
  user = User.new(
    f_name: 'Joe',
    l_name: 'Doe',
    phone: '0120778637',
    email: "joe@doe.com",
    reg_no: "mat/34/2017",
    password: "cecilia",
    school: "Computing"
  )
  expect(user).to be_valid
  end
  it 'is invalid without an email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without f_name'do
    user = User.new(f_name: nil)
    user.valid?
    expect(user.errors[:f_name]).to include("can't be blank")
  end

  it 'is invalid without l_name' do
    user = User.new(l_name: nil) 
    user.valid? 
    expect(user.errors[:l_name]).to include("can't be blank")
  end 

  it 'is invalid without reg_no' do
    user = User.new(reg_no: nil)
    user.valid?
    expect(user.errors[:reg_no]).to include("can't be blank") 
  end

  it 'is invalid without phone' do
    user = User.new(phone: nil)
    user.valid?
    expect(user.errors[:phone]).to include("can't be blank")
    end

  it 'returns phone as numeric'
  it 'returns full name as a string' do
user = User.new(f_name: "Joe", l_name: "Doe")
expect(user.name).to eq('Joe Doe')
  end
  it 'is invalid with a duplicate email' do
    User.create(f_name: "Bunch", l_name: "Fav", email: "bunch@fav.com", phone:"0754689546", password: "wierdowierdo", reg_no: "MAT/45/2017")
    user = User.new(f_name: "Cess", l_name: "Fav", email: "bunch@fav.com",  phone: "0754689546", password: "wierdowierdo", reg_no: "MAT/435/2017")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  it 'is invalid if password is not more than 6 characters' do
    skip
    user = User.new(password: "e")
    user.valid?
    expect(user.errors[:password]).to include("is too short")
  end
end

