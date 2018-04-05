class BackofficeController < ApplicationController
	before_action :authenticate_admin!
	layout "backoffice"

	def pundit_user #autorizações para quem estiver logado no momento
		current_admin		
	end
end
