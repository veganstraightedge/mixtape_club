require 'rails_helper'

RSpec.describe HomeHelper do
  describe '#random_heart' do
    let(:hearts) { %w[💙 🖤 💜 💖 🧡 🩵 💚 💛] }

    it 'returns a random heart emoji' do
      expect(random_heart).to be_in hearts
    end
  end
end
