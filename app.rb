require 'sinatra'
require 'pony'
require './student'
require 'mongoid'
require 'json'

if settings.environment == :production
  # if we're on heroku, use the sendgrid settings
  require './production_pony_options'
else
  # otherwise, use our normal email account
  require './development_pony_options'
end

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

	@tutee=Student.new

	@tutee.name= params[:name]
	@tutee.email=params[:email]
	@tutee.category=params[:category]
	@tutee.subject=params[:subject]
	@tutee.level=params[:level]

	@tutee.save

	@first_name=@tutee.first_name
	@subject=@tutee.subject
	@level=@tutee.level

puts "Student: #{@tutee.email}"

	if @tutee.category == "Parent"
		erb :thankyou_parent
	else 	
		erb :thankyou
	end

end


get '/signups' do 
	puts @tutee[:name]
end
