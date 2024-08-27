require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/mixtapes' do
  # This should return the minimal set of attributes required to create a valid
  # Mixtape. As you add validations to Mixtape, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Mixtape.create! valid_attributes
      get mixtapes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      mixtape = Mixtape.create! valid_attributes
      get mixtape_url(mixtape)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_mixtape_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      mixtape = Mixtape.create! valid_attributes
      get edit_mixtape_url(mixtape)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Mixtape' do
        expect do
          post mixtapes_url, params: { mixtape: valid_attributes }
        end.to change(Mixtape, :count).by(1)
      end

      it 'redirects to the created mixtape' do
        post mixtapes_url, params: { mixtape: valid_attributes }
        expect(response).to redirect_to(mixtape_url(Mixtape.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Mixtape' do
        expect do
          post mixtapes_url, params: { mixtape: invalid_attributes }
        end.not_to change(Mixtape, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post mixtapes_url, params: { mixtape: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested mixtape' do
        mixtape = Mixtape.create! valid_attributes
        patch mixtape_url(mixtape), params: { mixtape: new_attributes }
        mixtape.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the mixtape' do
        mixtape = Mixtape.create! valid_attributes
        patch mixtape_url(mixtape), params: { mixtape: new_attributes }
        mixtape.reload
        expect(response).to redirect_to(mixtape_url(mixtape))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        mixtape = Mixtape.create! valid_attributes
        patch mixtape_url(mixtape), params: { mixtape: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested mixtape' do
      mixtape = Mixtape.create! valid_attributes
      expect do
        delete mixtape_url(mixtape)
      end.to change(Mixtape, :count).by(-1)
    end

    it 'redirects to the mixtapes list' do
      mixtape = Mixtape.create! valid_attributes
      delete mixtape_url(mixtape)
      expect(response).to redirect_to(mixtapes_url)
    end
  end
end