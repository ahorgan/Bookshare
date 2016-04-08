class Book < ActiveRecord::Base
	has_many :shares
	has_many :notes

	def last_name
		author.split.last
	end

end
