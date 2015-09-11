class TalentsController < ApplicationController
	def index
		@talents = Talent.all
	end
	def new
		@talent = Talent.new
	end
	def create
		@talent = Talent.new(talent_params)

		if @talent.save
			redirect_to :back
		else
			@talents = Talent.all
			render 'index'
		end
	end

	private
	def talent_params
		params.require(:talent).permit(:name)
	end
end
