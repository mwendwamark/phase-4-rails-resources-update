class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  #adding an update action
  def update
    #We first find the bird by Id 
    bird = Bird.find_by(id: params[:id])
    if bird
      #Then we update it using the .update() method
      bird.update(bird_params)
      render json: bird
    else
      render json: { error: "Bird not found " }, status: :not_found
    end
  end

  def increment_likes 
    bird = Bird.find_by(id: params[:id])
    if bird 
      brid.update(likes: bird.likes + 1)
      render json: bird 
    else 
      render json: { error: "Bird not found"},status: :not_found
  end 

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end
end
