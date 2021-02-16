require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Association' do
    it 'has_many posts' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq :has_many
      expect(association.ooptions[:dependent]).to eq :destroy
    end
  end
end