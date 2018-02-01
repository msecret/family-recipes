require 'rails_helper'

describe Image do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { should validate_length_of(:url). is_at_least(3). on(:create) }
  end
end
