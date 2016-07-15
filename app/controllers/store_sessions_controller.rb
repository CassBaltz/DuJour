class StoreSessionsController < ApplicationController
	def new
	end

	def create
    store = Store.find_by(email: params[:store_session][:email].downcase)
    if store && store.authenticate(params[:store_session][:password])
      sign_in(store)
      redirect_to root_url
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

	def destroy
    store_sign_out
    redirect_to root_url
	end
end
