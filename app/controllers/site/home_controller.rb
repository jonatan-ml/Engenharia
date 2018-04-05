class Site::HomeController < SiteController

  def index
  	@categories = Category.order_by_description #puxa o scopo category.rb
  	@ads = Ad.descending_order(params[:page]) #puxa scopo do ad.rb/pegando 6 anúncios informados
  	@carousel = Ad.random(3) #pega 3 elementos aleatórios e coloca no carousel/scope do ad.rb
	end
end