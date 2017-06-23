require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post "/results" do
    @intensity = params["intensity"]
    @length = params["length"]
    @type = params["type"]
    @location = params["location"]
    @topic = params["topic"]
    @workout = Workout.new(@intensity,@length,@type,@location,@topic)
    @workout.wodmaker
    if @topic == "I hate working out"
      redirect "https://meme-machine-2017.herokuapp.com"
    else
      return erb :results
    end
  end
end
