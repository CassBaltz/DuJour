module StoreSessionsHelper

	def sign_in(store)
		remember_token_store = Store.new_remember_token
		cookies.permanent[:remember_token] = remember_token_store
		store.update_attribute(:remember_token, Digest::SHA1.hexdigest(remember_token_store).to_s)
		self.current_store = store
	end

	def current_store=(store)
		@current_store = store
	end

	def current_store
		remember_token_store = Digest::SHA1.hexdigest(cookies[:remember_token].to_s)
		@current_store ||= Store.find_by(remember_token: remember_token_store)
	end

	def current_store?(store)
    store == current_store
	end

    def signed_in_store
      redirect_to store_signin_url, notice: "Please sign in." unless store_signed_in?
    end
		
	def store_signed_in?
		!current_store.nil?
	end

	def store_sign_out
		current_store.update_attribute(:remember_token, 
			Digest::SHA1.hexdigest(Store.new_remember_token.to_s))
		cookies.delete(:remember_token)
		self.current_store = nil
	end
end
