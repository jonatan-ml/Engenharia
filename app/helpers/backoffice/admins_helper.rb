module Backoffice::AdminsHelper
	OptionsForRoles = Struct.new(:id, :description)

	def options_for_roles
	  

	  Admin.roles_i18n.map do |key, value| #com o map eu pego os elementos e mapeio/coleto cada um deles
	  	OptionsForRoles.new(key, value) #crio uma nova struct que retorna um array
	  end
	  
	end
end
