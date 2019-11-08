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

  #   def create
  #     user = User.new(username: params[:username], password: params[:password])
  #     if user.save
  #       payload = { user_id: user.id }
  #       token = issue_token(payload)
  #       render json: { jwt: token }
  #     else
  #       render json: { error: "Signup not successful !" }
  #     end
  #   end
end
