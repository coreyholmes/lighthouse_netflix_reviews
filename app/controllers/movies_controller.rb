class MoviesController < ApplicationController
  
  before_action :set_movie, except: [:index, :new, :create]

  def index # GET
    @movies = Movie.all
  end

  # --------------------------------------
  # Create
  # --------------------------------------

  def new # GET
    @category_options = Movie.categories
    @movie = Movie.new
  end

  def create # POST
    @category_options = Movie.categories
    @movie = Movie.new(movie_params)
    @movie.image = movie_params[:image]
    if @movie.save
      redirect_to movies_path, notice: "Successfully added #{@movie.title}."
    else
      render :new
    end
  end

  # --------------------------------------
  # Read
  # --------------------------------------

  def show # GET
    # GET's @movie by ID, as set in before_action
  end

  # --------------------------------------
  # Update
  # --------------------------------------
  
  def edit #GET
    # GET's @movie by ID, as set in before_action
  end

  def update # PUT / PATCH
    if @movie.update_attributes(movie_params)
      redirect_to movies_path, notice: "#{@movie.title} was updated successfully."
    else
      render :edit
    end
  end

  # --------------------------------------
  # Delete
  # --------------------------------------
  
  def destroy # DELETE
    @movie.destroy
    redirect_to movies_path, notice: "#{@movie.title} has been removed."
  end

  # --------------------------------------

   protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :category, :image, :description
    )
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end


end
