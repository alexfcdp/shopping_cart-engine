# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all

  def cover
    { url: 'no_cover.jpg', name: 'no_cover' }
  end
end
