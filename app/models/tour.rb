class Tour < ApplicationRecord
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader

  validates :title, :presence => true
  validates :category, :presence => true

  DURATION = Tour.pluck(:duration).uniq.sort

  scope :by_duration, -> (duration) do
    where(duration: duration) if duration.present?
  end

  scope :by_title, -> (title) do
    where("title LIKE ?", "%#{title}%") if title.present?
  end

  scope :by_price, -> (min_price, max_price) do
    where( price: min_price..max_price ) if min_price.present? && max_price.present?
  end

  scope :by_ukrainian_tours, -> do
    where(category: "Туры по Украине")
  end

  scope :by_european_tours, -> do
    where(category: "Туры по Европе")
  end
end
