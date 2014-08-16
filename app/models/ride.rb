class Ride < ActiveRecord::Base

	belongs_to :user
	has_many :ratings
	has_many :comments

	has_and_belongs_to_many :users

	def self.search_for(query)
		where('name LIKE :query OR description LIKE :query',
			query: "%#{query}%")
	end

end
