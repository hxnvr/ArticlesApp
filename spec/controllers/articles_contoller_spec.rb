# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController, type: :controller do
  describe '#index' do
    context 'when articles exists' do
    end
    context 'when articles doesnt exists' do
      it 'assigns @articles to empty array' do
        get :index
        expect(assigns(:articles)).to eq([])
        expect(response).to render_template('index')
      end
    end
  end
end
