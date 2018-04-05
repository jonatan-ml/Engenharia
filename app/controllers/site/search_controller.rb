class Site::SearchController < SiteController
	def ads
		@ads = Ad.search(params[:q], params[:page])#titulo seja o parametro pesquisado
		@categories = Category.all
	end
end
