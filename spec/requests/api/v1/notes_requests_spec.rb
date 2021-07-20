# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notes Management' do
  context :create do
    subject { post current_path, params: params }
    let(:current_path) { '/api/v1/notes' }

    context :invalid_params do
      let(:params) { { notes: { title: nil } } }

      before { subject }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(Note.all).to be_empty }
      it { expect(Note.first).to be_nil }
    end

    context :valid_params do
      let(:params) { { notes: attributes_for(:note) } }
      let(:note_keys) { %w[title body password public_keys slug] }

      before { subject }

      it { expect(response).to have_http_status(:created) }
      it { expect(parsed_response.keys).to match_array(note_keys) }
      it { expect(Note.all).to be_present }
      it { expect(Note.first.title).to eq(params[:notes][:title]) }
    end
  end

  context :show do
    subject { get current_path }
    let(:current_path) { "/api/v1/notes/#{note_slug}" }

    context :not_existent_note do
      let(:note_slug) { 'not_found' }

      before { subject }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end

    context :with_existent_note do
      let(:note) { create(:note) }
      let(:note_slug) { note.slug }

      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(parsed_response['slug']).to eq(note_slug) }
    end
  end

  context :destroy do
    pending
  end
end
