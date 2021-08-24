# frozen_string_literal: true
# encoding: utf-8
require "prawn"
class ArticlesController < ApplicationController
  skip_forgery_protection
  # http_basic_authenticate_with name: "dima", password: "123", except: [:index, :show]
  before_action :set_params, only: %i[show edit update destroy]
  around_action :around
  # rescue_from
  def index
    @articles = Article.all
  end

  def show; 
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: generate_pdf(@article) 
      end
    end
  end

  def new
    @article = Article.new
  end

  # def name_of_article

  # end
  def around
    yield
    puts response.code
  end

  def set_params
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
      # flash[:error] = "Article cannot be saved"
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  def download_pdf
    article = Article.find(params[:id])
    send_data generate_pdf(article),
              filename: "#{article.name}.pdf",
              type: "application/pdf"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def generate_pdf(article)
    Prawn::Document.new do
      text "Title: #{article.title}"
      text "Body: #{article.body}"
    end.render
  end

end

# pdf/ wicked_pdf/ prawn
# xml
# notice for unsuccessful
