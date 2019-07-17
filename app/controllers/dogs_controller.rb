class DogsController < ApplicationController

    def index
        dogs = Dog.all
        render json: dogs
    end

    def create 
        dog = Dog.create(url:params[:url], name:params[:name])
        render json: dog
    end 

    def update
        dog = Dog.find(params[:id])
        dog.update(boops: params[:boops])
    end 


    def destroy
        dog = Dog.find(params[:id])
        dog.destroy
    end

    def my_dogs
        if logged_in
          render json: User.find(current_user[:id]).dogs
        else
          render json: {error: "Error fetching your dogs"}
        end
      end

end
