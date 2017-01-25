class ArticlesController < InheritedResources::Base
  def index
    @articles = Article.active
    @manuals = Manual.manual.active.ordered
  end

  def show
    @article = Article.friendly.find(params[:id])
    if @article.nil?
      @category_1 = Category.find_by(system_name: 'teplicy_volya_profil')
      @category_2 = Category.find_by(system_name: 'teplicy_volya_truba')
      @articles = Article.active.limit(5)
      render '/shared/404', :status => 404
    else
      @title = "#{@article.title.gsub('"','')}."
      @meta_keywords = "#{@article.meta_keywords.gsub('"','')}, #{APP_CONFIG['meta_keywords_tail']}"
      @meta_description = "#{@article.meta_description.gsub('"','')} #{APP_CONFIG['meta_description_tail']}"
    end
  end

  private

    def article_params
      params.require(:article).permit(:system_name, :title, :product_id)
    end
end

