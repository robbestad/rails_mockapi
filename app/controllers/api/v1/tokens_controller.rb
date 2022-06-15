class Api::V1::TokensController < ApplicationController
  def index
    tokens = Token.all
    render json: tokens, status: 200
  end

  def create
    token = Token.new(
      name: token_params[:name],
      volume: token_params[:volume],
      change: token_params[:change],
      image_url: token_params[:image_url],
      price: token_params[:price]      
    )
    if token.save
      render json: token, status: 200
    else
      render json: {error: "Error storing token"}
    end
  end

  def show
    token = Token.find_by(id: params[:id])
    if token
      render json: token, status:200
    else
      render json: {error: "No such token"}
    end
  end
end

private 
  def token_params
    params.require(:token).permit([
      :name,
      :volume,
      :change,
      :image_url,
      :price
    ])
end
