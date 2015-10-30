class AdminController < ApplicationController
	def print
		if params[:sport]
			@users = User.where(:confirm_state => 'mailed',:sport =>params[:sport])
		else
			@users = User.all
		end

		#1073719775978420
	end
	def insurance
		@users = User.where(:confirm_state => 'mailed',:has_insurance => true)
	end

	def talented
		@users = User.where(:confirm_state => 'mailed',:has_insurance => true)
	end
	def sendmail
  		@users = User.where(:confirm_state => 'mailed')
  		@users.each do |user|
  			NotifyAll.confirm(user.email).deliver_later!
  		end
  	end
end
