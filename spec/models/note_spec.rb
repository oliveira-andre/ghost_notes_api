# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { build(:note) }

  context 'validate presence of' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keys) }
  end

  context 'validate uniqueness of' do
    it { should validate_uniqueness_of(:slug) }
  end
end
