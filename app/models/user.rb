require 'openssl'

class User < ApplicationRecord

  #парамерты работы модуля шифрования паролей
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :username, format: {with: /\A\w{5,40}\z/,
  	message: "Можно использовать только латинские буквы, цифры от 5 до 40 символов и знак подчеркивания '_'"}

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-zа-я]{2,})\z/i

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password

  before_validation { |user| user.username = user.username.downcase }

  def encrypt_password
    if self.password.present?
	  #создаем т.н. "соль" - рандомная строка усложняющая задачу хакерам
	  self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

	  #создаем хэш пароля - длинная уникальная строка, из которой невозможно восстановить
	  #исходный пароль
	  self.password_hash = User.hash_to_string(
	  	OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
	  	)
	end
  end

  #служебный метод, преобразующий бинарную строку в 16-ричный формат, для удобства хранения
  def self.hash_to_string(password_hash)
  	password_hash.unpack('H*')[0]
  end

  def self.authenticale(email, password)
  	user = find_by(email: email) # сперва находим кандидата на email

  	# обратите внимание: сравнивается password_hash, а оригинальный пароль так никогда
  	# и не сохраняется нигде
  	if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
  		user
  	else
  		nil
    end
  end
end
