require 'sinatra'
require 'sinatra/activerecord'

require_relative 'models/movie'
require 'csv'

class DataManager
  def self.load_movie(filename)

    CSV.foreach(filename, headers: true) do |row|
      movie = Movie.create(
        title: row[1],
        release_year: row[2],
        genres: row[5],
        rating: row[6],
        overview: row[7],
        director: row[9]
      )
    end
  end
end

DataManager.load_movie('public/imdb_top_1000.csv')
