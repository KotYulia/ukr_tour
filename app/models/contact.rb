class Contact
  ADDRESS = ["г.Киев, ул. Жилянская 107","(возле Портер паб),","3-й этаж,  17 каб. (305)"]
  PHONE_NUMBERS = ["+38 (063) 143-99-82" ,"+38 (066) 473-37-10","+38 (068) 732-16-67"]
  EMAIL_ADDRESS = "pridetravel.info@gmail.com"
  SCHEDULE = ["пн-пт : 10:00 — 18:00","сб: 12.00 — 15.00"]
  HOT_LINE = "пн-вс : 10:00 — 20.00"

  include ActiveModel::Model
  attr_accessor :email, :subject, :name, :message

  validates :name, :subject, :message, presence: true
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :format => EMAIL_REGEX
end