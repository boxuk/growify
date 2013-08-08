class PagesController < ApplicationController
  def home
  end

  def weather
  	@weather = HTTParty.get('http://api.wunderground.com/api/f7c72c9acebd77f2/geolookup/conditions/q/CWL.json')
  end

  def presentation
  end
end
