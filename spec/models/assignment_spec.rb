require 'rails_helper'
describe Assignment do

it 'must have a lecturer id' do 
  assignment = build(:assignment, lecturer_id: nil)
  expect(assignment.errors[:lecturer]).to include('Lecturer must exist')
end

it 'has a valid factory' do
  expect(build(:assignment)).to be_valid
end
end
