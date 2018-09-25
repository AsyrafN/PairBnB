class UsersController < ApplicationController

	def index
		@user = User.all
  end

  def create 
  	@user = User.create(user_params)

  	redirect_to '/'
  end

  def edit
    #bring up the form --- have field for upload
  end

  def update
    byebug
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save!
      

      redirect_to '/'
    end 
    
  end

  def show
    @user = User.find(params[:id])
   
  end


  def user_params
  	# params.require(:user).permit(:first_name, :last_name, :avatar)
        params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end  
end