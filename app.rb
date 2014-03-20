require 'sinatra'
require 'pony'
require './subject'
require 'mongoid'
require 'json'
#if settings.environment == :production
  # if we're on heroku, use the sendgrid settings
require './production_pony_options'
#else
  # otherwise, use our normal email account
#  require './development_pony_options'
#end

Mongoid.load!("mongoid.yml")

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


post '/register' do

	@category = params[:category]
	@tutee = params[:tutee]
	@subject = Subject.new(params[:subject])
	@exam = params[:exam]

	@tut_name = @tutee[:name]
	@first_name = @tutee[:name].split.first
	@tut_email = @tutee[:email]

	if @category == "Parent"
		erb :thankyou_parent
	else 	
		erb :thankyou
	end
end
