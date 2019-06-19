class DogsController < ApplicationController

    def index
        dogs = Dog.all
        render json: dogs
    end

    def create 
        dog = Dog.create(url:params[:url])
        render json: dog
    end 

end
