require 'rails_helper'

RSpec.describe 'Avatars' do
  describe 'DELETE /avatar' do
    it 'returns http success' do
      delete '/avatar'
      expect(response).to have_http_status(:success)
    end
  end
end
