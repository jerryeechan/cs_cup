class TeamsController < ApplicationController
	def index
		@teams = Team.all.order('created_at DESC'); 	
	end 
	
	def edit
	end
	def new
		@team = Team.new
	end

	def show
		@team = Team.find(params[:id])
	end

	def create
		@team = Team.new(team_params)

		if @team.save
			redirect_to @team
		else
			render 'new'
		end
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])

		if @team.update(params[:team].permit(:name, :intro,:situation, :needs))
			redirect_to @team
		else
			render 'edit'
		end
	end

	private
	def team_params
		params.require(:team).permit(:name, :intro,:situation, :needs,:logo)
	end
end
