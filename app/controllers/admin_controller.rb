class AdminController < ApplicationController
	def print
		@users = User.all
		#1073719775978420
	end
	def insurance
		@users = User.where(:confirm_state => 'mailed',:has_insurance => true)
	end

	def talented
		@users = User.where(:confirm_state => 'mailed',:has_insurance => true)
	end
end
