class Hashtag < ApplicationRecord
  #[:alnum:] - алфавитные и числовые символы всех языков мира(в нашем случае вместо а-яА-яa-zA-z0-9)
  REGEXP = /#[[:alnum:]_]+/

  has_many :hashtag_questions
  #имеет много вопросов сквозь хештегивопросы
  has_many :questions, through: :hashtag_questions

  validates :name, uniqueness: true
end
