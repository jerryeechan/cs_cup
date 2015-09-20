class AdminController < ApplicationController
	def print
		@users = User.all
		#1073719775978420
	end
end
