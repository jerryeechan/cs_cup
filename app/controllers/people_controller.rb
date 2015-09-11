class PeopleController < ApplicationController
	def index
		@people = User.all.order('created_at DESC')
	end

	def show
		@people = User.find(params[:id])
	end
end
