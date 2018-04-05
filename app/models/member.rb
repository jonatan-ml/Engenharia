class Member < ActiveRecord::Base

	# RatyRate Gem avaliator
	ratyrate_rater	

	# Associations
	has_many :ads
	has_one :profile_member
	accepts_nested_attributes_for :profile_member
	# model membro aceita os atributos do perfil do memebro (first_name...)

	# Validations
	validate :nested_attributes
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def nested_attributes
    	if nested_attributes_blank? #se estiver em branco
    		errors.add(:base, "Primeiro Nome e Sobrenome não podem ficar em branco")
    	end
    end
    def nested_attributes_blank? #se os dois campos do cadastrar estiver em branco, ele aciona o erro /\
    	profile_member.first_name.blank? || profile_member.second_name.blank?    	
    end
end
