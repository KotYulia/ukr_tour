class Place < ApplicationRecord
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader

  validates :title, :presence => true
  validates :image, :presence => true
  validates :description, :presence => true
end
