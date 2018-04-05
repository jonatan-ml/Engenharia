module ApplicationHelper
	def current_user
		current_member
	end

	def devise_sign_in? #se eu estiver logando no devise
		params[:controller] == 'members/sessions' ? '' : 'display:none;' #se for sessions mostrar/se não apaga
	end

		def devise_sign_up? #se eu estiver cadastrando no devise
		params[:controller] == 'members/registrations' ? '' : 'display:none;' #se for registration mostra/se não apaga
	end

end
