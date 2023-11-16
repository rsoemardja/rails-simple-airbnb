class MoviesController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @movie = movie.new(movie_params)
    @list = List.find(params[:list_id])
    @movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @movie = movie.find(params[:id])
    @movie.destroy
    redirect_to list_path(@movie.list)
  end

  private

  def movie_params
    params.require(:movie).permit(:comment, :rating)
  end
end
