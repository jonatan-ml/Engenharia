class Backoffice::SendMailController < ApplicationController
		
		def edit
			@admin = Admin.find(params[:id])
			respond_to do |format| #procura uma view com ext js
     	 	format.js 
		end

		def create
		#	
		end
	end
end
		