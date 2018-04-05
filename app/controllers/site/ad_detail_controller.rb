class Site::AdDetailController < SiteController
	def show
		@categories = Category.order_by_description #puxa o scopo category.rb/carrego as categorias
		#aqui para poderem carregar quando colado link do anúncio
		@ad = Ad.find(params[:id])
	end
end
