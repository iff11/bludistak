class ApplicationController < ActionController::Base 
  layout :determine_layout
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  
  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    #if current_user && !current_user.email_verified?
    #  redirect_to finish_signup_path(current_user)
    #end
  end
  
  def force_login
    if user_signed_in?
      return true
    else 
      redirect_to controller: 'pages', action: 'login'
    end 
  end
  
  private
  def determine_layout
    current_user ? "private" : "public"
  end
  
  
end
