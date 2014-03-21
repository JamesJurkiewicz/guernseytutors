require 'mongoid'
require 'csv'

class Student


 include Mongoid::Document

	field :name, 		type: String
	field :email, 		type: String
	field :category,	type: String
	field :subject,		type: String
	field :level, 		type: String


	def first_name
		@first_name=name.split.first
	end 

	def subject_operation
		@subject=subject
	end

	def level_operation
		@level=level
	end
end