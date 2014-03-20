
class Student

	include Mongoid::Document

	field :name, 		type: String
	field :email, 		type: String
	field :category,	type: String
	field :subject,		type:String
	field :level, 		type:String

	def first_name
		@first_name = @tutee[:name].split.first
	end 


end