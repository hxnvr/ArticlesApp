# frozen_string_literal: true

require "prawn"
class ArticlesController < ApplicationController
  skip_forgery_protection
  # http_basic_authenticate_with name: "dima", password: "123", except: [:index, :show]
  before_action :set_params, only: %i[show edit update destroy]
  around_action :around
  # rescue_from

  def index
    cookies[:some_cookie] = {value: "some value"}
    cookies.permanent[:perm_cookie] = {
      value: "some perm cookie"
    }
    cookies.signed[:password] = {
      value: "secured password", httponly: true
    }
    @articles = Article.all
  end

  def show; 
    respond_to do |format|
      format.html
      format.json { render :show, status: :ok, location: @article }
      format.xml {render :show, status: :ok, location: @article}
      format.pdf do
        pdf = Prawn::Document.new 
        pdf.text "Title: #{@article.title}"
        pdf.text "Body: #{@article.body}"
        send_data pdf.render,
          filename: "#{@article.title}.pdf",
          type: "application/pdf"
      end
    end
  end

  def new
    @article = Article.new
  end


  def around
    yield
    puts "HTTP CODE: #{response.code}"
  end

  def set_params
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @article.errors, status: :unprocessable_entity }
         # flash[:error] = "Article cannot be saved"
      end
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      format.json { render :show, status: :created, location: @article }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to article_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end


# xml
# notice for unsuccessful
