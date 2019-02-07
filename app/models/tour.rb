class Tour < ApplicationRecord
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end
