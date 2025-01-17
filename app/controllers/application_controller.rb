require 'sinatra/base'
require 'pry'


class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    
  get '/' do
    erb :index
  end

  post '/teams' do

    @team = Team.new(params[:team])

    params[:team][:members].each do |hero|
      Hero.new(hero)
    end
    
  @heroes = Hero.all
    erb :teams
  end
  
end
