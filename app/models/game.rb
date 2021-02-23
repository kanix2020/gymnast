class Game < ApplicationRecord

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :event_day
    validates :venue
  end

  has_many :scores

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

end
