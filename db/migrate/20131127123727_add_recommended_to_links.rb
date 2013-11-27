class AddRecommendedToLinks < ActiveRecord::Migration
  def change
  	# add a column
  	# to the links table
  	# call it is_recommend
  	# it's a boolean (true or false)
  	# and the default value is false
  	add_column :links, :is_recommended, :boolean, default: false

  	# rename_column :links, :name, :title
  	# remove_column :links, :name
  	
  	
  end
end
