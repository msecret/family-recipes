require 'rails_helper'

describe Category, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:display_name) }
    it { should validate_uniqueness_of(:order) }
  end
end
