# == Schema Information
#
# Table name: parniks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  system_name :string(255)
#  brand_type  :string(255)
#  price       :integer
#  image       :string(255)
#  image_2     :string(255)
#  width       :string(255)
#  length      :string(255)
#  height      :string(255)
#  small_desc  :text
#  desc        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Parnik < ActiveRecord::Base
  def to_param
    "#{system_name.parameterize}"
  end

  def self.from_param(param)
    find_by_system_name!(param)
  end
end
