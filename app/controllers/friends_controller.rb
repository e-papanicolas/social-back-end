class FriendsController < ApplicationController
  before_action :render_not_found_response, only: [:show]
  before_action :render_unprocessable_entity_response, only: [:create]

  def index 
    render json: Friend.all
  end

  def show
    friend = Friend.find(params[:id])
    render json: friend
  end

  def create 

  end
end
