class CommentsController < ApplicationController
=begin
	
	def create
		@post = Post.find(params[:commentable_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
	end
	
=end	

	def create
		puts(params[:comment])
		@commentable = params[:comment][:commentable]
		@commentable_model = @commentable.classify.constantize.find(params[:comment][:id])
		@commentable_model.comments.create(params[:comment].permit(:name, :body))
		redirect_to @commentable_model
		#@commentable_class = @commentable.capitalize.constantize
		#@commentable_class.find()
	end


=begin
	def create(@commenta)
	  @commentable = find_commentable
	  @comment = @commentable.comments.build(params[:comment])
	  if @comment.save
	    flash[:notice] = "Successfully created comment."
	    redirect_to :id => nil
	  else
	    render :action => 'new'
	  end
	end
=end

	private

	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
end