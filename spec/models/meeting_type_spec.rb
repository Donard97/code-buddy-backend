require 'rails_helper'
RSpec.describe MeetingType, type: :model do
  subject { MeetingType.new(name: 'New Meeting', color: 'red') }
  before { subject.save }

  it 'MeetingType name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'MeetingType title should be at least 4 charachters' do
    subject.name = 'abc'
    expect(subject).to_not be_valid
  end
  it 'MeetingType title should be at most 20 charachters' do
    subject.name = 'abc123456789123456789'
    expect(subject).to_not be_valid
  end
end
