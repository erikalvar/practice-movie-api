class Api::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    # shows movie details by calling API with imdb_id
    imdb_id = params[:id]

    saved_movie = Movie.find_by(imdb_id: imdb_id)

    if saved_movie
      @movie = saved_movie
    else
      response = HTTP
        .headers(
          "x-rapidapi-key" => Rails.application.credentials.movie_api[:api_key],
          "x-rapidapi-host" => "movies-tvshows-data-imdb.p.rapidapi.com",
        )
        .get("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movie-details&imdb=#{imdb_id}")

      @movie_response = response.parse

      new_movie = Movie.new(
        title: @movie_response["title"],
        release_year: @movie_response["year"],
        imdb_id: @movie_response["imdb_id"],
        director: @movie_response["directors"],
        description: @movie_response["description"],
        thumbs_up: 0,
        thumbs_down: 0,
      )
      new_movie.save
      @movie = new_movie
    end

    render "show.json.jb"
  end
end
