class Api::SongsController < ApplicationController

	def index
    @songs = Song.all
    render json: @songs
	end

	def search
    s_songs = RSpotify::Track.search(params[:q])
    @songs = s_songs.map do |s_song|
      Song.new_from_spotify_track(s_song)
    end
		render json: @songs
	end

end
