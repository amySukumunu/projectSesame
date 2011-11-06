class UsersController < ApplicationController
	before_filter :authenticate, :except => [:new, :create]
  	before_filter :correct_user, :only => [:edit, :update]
   	before_filter :signed_in_again, :only => [:new,:create]
  	
	
	def new
  		@title = "Sign Up"
  		@user= User.new
  	end
  	
  	def create 
  		@user = User.new(params[:user])
  		
  		if @user.save 
  			flash[:success] = "Welcome to the Sample App!"
  			sign_in(@user)
  			redirect_to @user
  		else
  			@user.password = nil 
			@user.password_confirmation = nil 
			@title ="Sign Up"
			render 'new'
  		end
  	end
  	
  	def show
		@user = User.find(params[:id])
		@title = @user.name
	end
	
	
	
  	private 
  		def signed_in_again
  			redirect_to root_path if signed_in?
  		end
  		
  		def correct_user
  			@user =User.find(params[:id])
  			redirect_to root_path unless current_user?(@user)
  		end
	
end
