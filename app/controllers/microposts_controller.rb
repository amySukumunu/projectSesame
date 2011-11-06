class MicropostsController < ApplicationController
	before_filter :authenticate, :only => [:edit, :create, :destroy]
	
	
	
	def index
		@title = "Blog"
		@posts = Micropost.paginate(:page => params[:page], :per_page => 3)
	end
	
	def show 
		
		@micropost = Micropost.find(params[:id])
		@title = "Sesame #{@micropost.title}"
	end
	
	def new
		@title = "Post New Article"
		@micropost = Micropost.new
	end
	
	def create
		@micropost = current_user.microposts.build(params[:micropost])
  		if @micropost.save 
  			flash[:success] = "Post created!"
  			redirect_to @micropost
   		else
  			flash[:error] = "Please sign up again."
  			@micropost= []
  			render 'pages/home'
  		end
	end
	
	def destroy
  		Micropost.find(params[:id]).destroy
  		redirect_to root_path
  	end
  	
  	def edit
  		@title ="Edit Post"
  		@micropost = Micropost.find(params[:id])
  	end
  	
  	def update 
  		@micropost = Micropost.find(params[:id])
  		if @micropost.update_attributes(params[:micropost])
  			flash[:success] = "Profile updated."
  			redirect_to @micropost
  		else
  			@title = 'Edit post'
  			render 'edit'
  		end
  	end
  	
  	
	
end
