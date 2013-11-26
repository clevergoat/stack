class CategoriesController < ApplicationController

	# i want to run get_category before the show, edit, update, destroy
	# and i don't want to keep having to repeat the same code over and over
	# we can use before_action to do things before any method (a.k.a. action)
	before_action :get_category, only: [:show, :edit, :update, :destroy]

	# Step 2 is to add in an index page
	# we want to define the index of our controller

	def index
		# this is where all of our code for the index page lives
		
		# quotes denote a string 
		# a string is some data
		@username = "cleverGoat"

		# age is only a number so it does not need quotes around it
		@age = 31

		# to do a list, we use an array
		# @categories = ["Design", "Rails", "Javascript", "Site tools"]

		# now lets talk to the model
		@categories = Category.all.order("rank asc, name asc")
	end


	# individual page for the category
	def show		
		# @category is in get_category
	end


	# the new form for a category
	def new
		@category = Category.new
	end


	# actually add the category using the data the form has in it
	def create
		@category = Category.new(category_params)

		if @category.save
			
			# tell the user they've added this category
			flash[:success] = @category.name + " Added"

			# go back to the homepage
			redirect_to root_path

		else
			
			# if the category does NOT save
			# i want to show the form again but with some errors

			# we've already got the view that we want to show to the user
			# this is the new.html.erb
			render "new"


		end

	end


	# get a form to edit this category
	def edit
		# @category is in get_category
	end


	# actually update the row in the database
	def update

		# update based on the secure form data from below

		if @category.update(category_params)
		
			# tell the user they've updated this category
			flash[:success] = @category.name + " Updated"
		
			# redirect to the homepage
			redirect_to root_path

		else
		
			# show the edit form again if it doesn't update
			# edit.html.erb in our views
			render "edit"

		end

	end
	

	# actually delete the category in the database
	def destroy

		# destroy that row
		@category.destroy

		# tell the user they've deleted this category
		flash[:success] = @category.name + " Deleted"
		
		# go back to the home page
		redirect_to root_path
	
	end


	# to not repeat ourselves, let's create a brand new method
	# to simplify things
	# i can call a method whatever i like
	def get_category
		@category = Category.find(params[:id])
	end


	# whitelist all of the form data
	# make sure we are secure from hackers
	def category_params
		params.require(:category).permit(:name, :rank)
	end

end
