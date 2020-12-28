class Api::SearchesController < ApplicationController
  def index
    # search movies api by title
    title = params[:title]
    # adds space if multiple words input
    title = title.gsub(" ", "%20")

    response = HTTP
      .headers(
        "x-rapidapi-key" => Rails.application.credentials.movie_api[:api_key],
        "x-rapidapi-host" => "movies-tvshows-data-imdb.p.rapidapi.com",
      )
      .get("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movies-by-title&title=#{title}")

    @movies = response.parse["movie_results"]

    render "index.json.jb"
  end
end
