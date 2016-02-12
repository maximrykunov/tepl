class ParniksController < ApplicationController
  def show
    @parnik = Parnik.from_param(params[:id])
  end
end
