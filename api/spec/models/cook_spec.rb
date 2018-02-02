require 'rails_helper'

describe Cook do
  context 'validations' do
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { should allow_value('marco@marco.com').for(:email) }
    it { should_not allow_value('adsflk').for(:email) }
    it { should have_one(:image) }
  end
end
