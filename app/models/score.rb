class Score < ApplicationRecord

  validates :floor_d, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

  belongs_to :game
  belongs_to :athlete
end
