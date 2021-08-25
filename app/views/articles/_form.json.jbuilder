# frozen_string_literal: true

json.extract! article, :title, :body, :created_at, :updated_at, :comments
json.url article_url(article, format: :json)
