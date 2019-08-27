
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello World"
  end
  
  get '/articles/new' do
    erb :new
  end
 
 post '/articles' do
   Article.create(params)
   redirect "/articles/#{Article.last.id}"
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = params[:id]
    erb :show
  end
end
