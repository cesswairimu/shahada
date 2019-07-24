require 'rails_helper'

RSpec.describe Assignment do
  it { should belong_to(:lecturer) }

  it 'has a valid factory' do
    expect(build(:assignment)).to be_valid
  end
end
