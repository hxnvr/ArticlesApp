# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 4 }

  def title_and_body
    "#{title}: #{body}"
  end
end
