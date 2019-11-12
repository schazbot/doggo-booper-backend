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
        # byebug
        dog = Dog.find(params[:id])
        dog.update(boops: params[:boops])
        render json: dog
    end 


    def destroy
        dog = Dog.find(params[:id])
        dog.destroy
    end
    # private
    
    # def dog_params
    #     params.require(:dog).permit(:name, :url, :boops)
    # end

end
