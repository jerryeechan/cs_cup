class AdminController < ApplicationController
	def print
		@users = User.all
		#1073719775978420
	end
	def insurance
		@users = User.where(:has_insurance => true)
	end
end
