# frozen_string_literal: true

class ApplicationSerializer
  attr_accessor :data

  def initialize(data)
    @data = data
  end
end
