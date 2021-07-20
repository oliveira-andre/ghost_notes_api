# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keys) }
    it { should validate_presence_of(:slug) }
  end
end
