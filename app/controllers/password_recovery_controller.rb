class PasswordRecoveryController < ApplicationController

  def new
  end

  def create
  	@user = User.find_by_email(params[:email])

  	if @user.present? 
    @user.send_password_recovery 
   	redirect_to root_url, :notice => "Email sent with password reset instructions"
  	else
  	render :new, :notice => "This email is not in the system, please try a different email."
  	end
  end

  def edit
  	@user = User.find_by_password_recovery_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_recovery_token!(params[:id])
  	
	  	if @user.password_recovery_sent_at < 2.hours.ago
	  	redirect_to new_password_recovery_path, :alert => "Password reset has expired."
	  	
	  	elsif @user.update_attributes(user_parameters)
	  	redirect_to root_url, :notice => "Password has been reset!"

	  	else render :edit, :notice => "Please try again."
 		
 		end
 end

def user_parameters
      params.require(:user).permit(:name, :zip, :email, :password,
                           :password_confirmation)
end

end
