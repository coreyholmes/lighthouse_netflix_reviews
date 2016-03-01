class MoviesController < ApplicationController
  
  before_action :set_movie, except: [:index, :new, :create]

  def index # GET
    @movies = Movie.all
  end

  # --------------------------------------
  # Create
  # --------------------------------------

  def new # GET
    @movie = Movie.new
  end

  def create # POST
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  # --------------------------------------
  # Read
  # --------------------------------------

  def show # GET

  end

  # --------------------------------------
  # Update
  # --------------------------------------
  
  def edit #GET

  end

  def update # PUT / PATCH
    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  # --------------------------------------
  # Delete
  # --------------------------------------
  
  def destroy # DELETE
    @movie.destroy
    redirect_to movies_path
  end

  # --------------------------------------

   protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
    )
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end


end
