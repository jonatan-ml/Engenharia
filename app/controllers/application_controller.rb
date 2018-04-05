class ApplicationController < ActionController::Base
  before_filter :store_current_location, :unless => :devise_controller?


  # Pundit
  include Pundit

  # Manage Pundit Errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  # Set Layout
  layout :layout_by_resource

 protected

 def layout_by_resource
 	if devise_controller? && resource_name == :admin #se um admin logar pegar o as config do backoffice_devise
 		"backoffice_devise"
  elsif devise_controller? && resource_name == :member #se um membro logar pegar o as config do site_devise
    "site_devise"
 	else
 		"application"
 	end
 end

 def user_not_authorized
    flash[:alert] = "Você não está autorizado a executar essa ação."
    redirect_to(request.referrer || root_path)
  end

  private

  def store_current_location  #volta para a página que estava antes do login
    store_location_for(:member, request.url)
    
  end

end
