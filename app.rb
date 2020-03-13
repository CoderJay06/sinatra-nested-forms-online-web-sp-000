require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do 
      erb :root
    end 

    get '/new' do 
      erb :'pirates/new'
    end 
    
    post '/pirates' do 
      
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |pirate_details|
        Ship.new(pirate_details)
      end 

      @ships = Ship.all
      #binding.pry
      
      erb :'pirates/show'
    end 
    
    
    post '/pirates' do 
      status 200 
    end 


  end
end
