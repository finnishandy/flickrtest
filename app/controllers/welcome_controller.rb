require 'flickraw'

class WelcomeController < ApplicationController
  def index
  	@foo = params[:search]

  	# search for pictures taken within 60 miles of new brunswick, between 1890-1920

	FlickRaw.api_key="c856bf1e9a4b0addadc16353cb862ed4"
	FlickRaw.shared_secret="3559c8e7cdb5b9d4"

	new_b = flickr.places.find :query => "new brunswick"
	latitude = new_b[0]['latitude'].to_f
	longitude = new_b[0]['longitude'].to_f

	# within 60 miles of new brunswick, let's use a bbox
	radius = 1
	args = {}
	#args[:bbox] = "#{longitude - radius},#{latitude - radius},#{longitude + radius},#{latitude + radius}"
	args[:text] = params[:search]

	# requires a limiting factor, so let's give it one
	args[:min_taken_date] = '1890-01-01 00:00:00'
	args[:max_taken_date] = '1920-01-01 00:00:00'
	args[:accuracy] = 1 # the default is street only granularity [16], which most images aren't...
	@pics = flickr.photos.search args
  end
end
