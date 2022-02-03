class MoviesController < ApplicationController

  def index
    #@movies = Movie.order("average_VOTE DESC") # creates an n+1 issue
    @movies = Movie.includes(:production_company).all.order("average_VOTE DESC")
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @movies = Movie.where("title LIKE ?", wildcard_search)
  end
end
