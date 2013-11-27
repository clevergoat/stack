require "obscenity/active_model"

class Link < ActiveRecord::Base

	# let's link up this model with the category
	belongs_to :category

	# add some validations
	validates :name, presence: true, obscenity: { sanitize: true, replacement: :vowels }
	validates :url, presence: true, uniqueness: true

	# i've made this nice_url thing up
	def nice_url
		# lets remove http:// and lets remove www.
		url.gsub("http://", "").gsub("www.", "")
	end

end

