class Api::MoviesController < ApplicationController
  def show
    # shows movie details by calling API with imdb_id
    # imdb_id = params[:imdb_id]

    response = HTTP
      .headers(
        "x-rapidapi-key" => Rails.application.credentials.movie_api[:api_key],
        "x-rapidapi-host" => "movies-tvshows-data-imdb.p.rapidapi.com",
      )
      .get("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movie-details&imdb=tt1830577")

    @movie = response.parse

    render "show.json.jb"
  end
end
