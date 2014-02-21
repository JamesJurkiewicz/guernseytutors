require 'sinatra'
require 'pony'

#if settings.environment == :production
  # if we're on heroku, use the sendgrid settings
#  require './production_pony_options'
#else
  # otherwise, use our normal email account
#  require './development_pony_options'
#end

get '/'  do
  erb :index
end

get '/tutors' do
	erb:tutors
end

get '/parents' do
	erb:parents
end

get '/register' do
	erb:register
end

get '/index' do
	erb:index
end

	
post '/' do

	#@name = params[:first_name]
	#@email = params[:email]
	
	erb:thankyou
	end
	