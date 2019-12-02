require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it 'expected validate uniqueness of email' do
      user = create(:user)
      user1 = build(:user, email: user.email)
      expect validate_uniqueness_of(:email).ignoring_case_sensitivity
      expect(user1).not_to be_valid
      expect(user1.errors[:email]).to be_present
    end
   it {is_expected.to validate_uniqueness_of(:user_name).ignoring_case_sensitivity}
  end


  
end
