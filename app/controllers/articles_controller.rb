class ArticlesController < InheritedResources::Base
  def index
    @articles = Article.active
  end

  def show
    @article = Article.from_param(params[:id])
    if @page.nil?
      @category_1 = Category.find_by(system_name: 'teplicy_volya_profil')
      @category_2 = Category.find_by(system_name: 'teplicy_volya_truba')
      @articles = Article.active
      render '/shared/404', :status => 404
    end
  end

  private

    def article_params
      params.require(:article).permit(:system_name, :title, :product_id)
    end
end

