class DogsController < ApplicationController
  def index
    user = get_current_user
    if user
      render json: user.dogs
    else
      render json: { error: "Error fetching your dogs" }
    end
  end

  def create
    dog = Dog.create(url: params[:url], name: params[:name])
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
