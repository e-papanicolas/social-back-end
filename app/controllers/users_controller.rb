class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  # before_action :render_not_found_response, only: [:me, :update, :destroy]

  def index 
    render json: User.all
  end
  
  def create 
    
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def me
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def update 
    
    user = User.find_by(id: params[:id])
    user.update!(user_params)
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def bio_edit
    user = find_user 
    user.update!(update_bio)
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def add_friend
    user = find_user 
    user.update!(user_params)
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def destroy
    user = find_user 
    user.destroy 
    head :no_content
  end

  private

  def find_user
    User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio, :avatar, :friends)
  end

  def update_bio
    params.permit(:id, :bio) 
  end
    
end