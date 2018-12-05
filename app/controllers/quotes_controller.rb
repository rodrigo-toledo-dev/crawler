class QuotesController < ApplicationController
  def show
    render json: Quote.crawler(params[:id])
  end
end
