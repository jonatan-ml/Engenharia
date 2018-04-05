class Site::CategoriesController < SiteController

	def show
	@categories = Category.order_by_description #puxa o scopo category.rb
  	@ads = Ad.where(category: params[:id]) #faz mostrar todos os ads daquela categoria
  	@ads = Ad.by_category(@categories, params[:pages])
	end
end
