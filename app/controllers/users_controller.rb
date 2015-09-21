class UsersController < ApplicationController
	def index
		#@users = User.all.order('created_at DESC')
		
		if params[:searchbar]==nil
			puts 'nil search'
			@users = User.all.order('created_at DESC')
		else
  			@users = search
  		end
	end
	def show
		@user = User.find(params[:id])
	end
	def update
	    @user = User.find(params[:id])
	    respond_to do |format|
		    if @user.update_attributes(user_params)
		      format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
		      format.json { respond_with_bip(@user) }
		    else
		      format.html { render :action => "edit" }
		      format.json { respond_with_bip(@user) }
		    end
	  	end
	    #
	    #if @user.update_attributes(user_params)
	    #	respond_with @user
		#end
  	end
  	
  	def send_email
		 UserMailer.confirm(params[:email])
	end
  	def search
  			@users = User.search(params[:searchbar])
  	end
  	def user_params
		params.require(:user).permit(:name, :school, :sport, :department, :transfercode)
	end


end
