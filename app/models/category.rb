class Category < ActiveRecord::Base

	# Associations
	has_many :ads
	# Validations
	validates_presence_of :description

	# Scopes
	scope :order_by_description, -> { order(:description) }

	#serve para trocar nome da url


end
