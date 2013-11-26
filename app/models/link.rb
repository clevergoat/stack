class Link < ActiveRecord::Base

	# let's link up this model with the category
	belongs_to :category

	# add some validations
	validates :name, presence: true
	validates :url, presence: true, uniqueness: true

end

