class PagesController < ApplicationController
  def index
    @parniks_1 = Parnik.all.where(brand_type: 'volya_1')
    @parniks_2 = Parnik.all.where(brand_type: 'volya_2')
  end
end
