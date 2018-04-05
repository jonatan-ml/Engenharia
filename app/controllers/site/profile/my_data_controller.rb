class Site::Profile::MyDataController < Site::ProfileController
	before_action :set_profile_member, only: [:edit, :update]

	def edit
	end

	def update
		if @profile_member.update(params_profile_member)
			redirect_to edit_site_profile_my_datum_path(current_member.id), notice: "Perfil atualizado com sucesso!"
		else
			render :edit #se não salvou continua na página de edição	
		end
	end

	private

	def set_profile_member
		@profile_member = ProfileMember.find_or_create_by(member_id: current_member.id) #vai na tabela profile_member 
																																										#encontra ou cria um id novo
	end

	def params_profile_member
		params.require(:profile_member).permit(:id, :first_name, :second_name, :birthdate)
		end
	
end
