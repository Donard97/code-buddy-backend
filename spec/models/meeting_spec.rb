require 'rails_helper'
RSpec.describe Meeting, type: :model do
  subject { Meeting.new(title: 'New Meeting', description: 'new meeting for practising rails') }
  before { subject.save }

  it 'Meeting title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'Meeting title should be at least 4 charachters' do
    subject.title = 'abc'
    expect(subject).to_not be_valid
  end
  it 'Meeting title should be at most 20 charachters' do
    subject.title = 'abc123456789123456789'
    expect(subject).to_not be_valid
  end
end
