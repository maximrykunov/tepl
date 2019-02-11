class App < ApplicationRecord
  has_many :categories, inverse_of: :app
  has_many :articles, inverse_of: :app
  has_many :pages, inverse_of: :app

  def teplicy?
    self.sub_domain == 'teplicy'
  end

  def teplo?
    self.sub_domain == 'teplo'
  end

  def drenaj?
    self.sub_domain == 'drenaj'
  end
end
