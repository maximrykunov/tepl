# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  imageable_id   :integer
#  imageable_type :string
#  image          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string
#

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  mount_uploader :image, ImageUploader
end
