require 'rails_helper'
RSpec.describe User, type: :model do
    subject {User.new(user_name: "Ahmad")}
    before {subject.save}

    it 'user_name should be present' do
        subject.user_name = nil
        expect(subject).to_not be_valid
    end
    it 'user_name should be at least 4 charachters' do
        subject.user_name = 'abc'
        expect(subject).to_not be_valid
    end
    it 'user_name should be at most 20 charachters' do
        subject.user_name = 'abc123456789123456789'
        expect(subject).to_not be_valid
    end
end