class User < ApplicationRecord
  has_many :tours

  attr_accessor :full_name

  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader

  has_secure_password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  enum role: [:standard, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

  def full_name
    [self.first_name, self.last_name].join(" ") if !self.first_name.blank? && !self.last_name.blank?
  end

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
    user.email = auth['info']['email']
    user.password = auth['uid']
    if User.exists?(user.id)
      user
    else
      user.save!
      user
    end
  end
end
