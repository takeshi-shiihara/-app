class English < ApplicationRecord

  validates :word, presence: true
  validates :meaning, presence: true

end
