class UsersController < ApplicationController
  def signin
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      # here I know the user is valid!
      render json: { username: user.username, token: issue_token({ id: user.id }) }
    else
      # here I know the user OR password are NOT valid!
      render json: { error: "Username/password combination is invalid." }, status: 401
    end
  end

  def validate
    user = get_current_user
    if user
      render json: { username: user.username, token: issue_token({ id: user.id }) }
    else
      render json: { error: "Unable to validate user." }, status: 401
    end
  end

  # def my_dogs
  #   user = get_current_user
  #   if user
  #     render json: user.dogs
  #   else
  #     render json: { error: "Error fetching your dogs" }
  #   end
  # end

  def create
    user = User.new(user_params)
    if user.save
      data = { user_id: user.id }
      token = issue_token(data)
      render json: { jwt: token }
    else
      render json: { error: "Signup not successful !" }
    end
  end

  def index
    @users = User.all 
    render :json => @users, :include => {:dogs => {:only => :name}}, :except => [:created_at, :updated_at]
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
