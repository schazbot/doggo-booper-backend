class UserDogsController < ApplicationController

    def index
        user_dogs = UserDog.all
        render json: user_dogs
    end

    def create 
        # byebug
        user_dog = UserDog.create(user_id:params[:user_id], dog_id:params[:dog_id])
        render json: user_dog
    end

end
