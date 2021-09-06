# frozen_string_literal: true

require 'rails_helper'

describe Article, type: :model do
  describe '#title_and_body' do
    context 'when article has title and body' do
      let(:article) { Article.create!(title: 'title', body: 'body') }
      it 'returns full data about article' do
        # article = Article.create!(title: 'title', body: 'body')
        expect(
          article.title_and_body
        ).to eq('title: body')
      end
    end
  end
end
