class Athlete < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: true }
  
  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :birthday
  end

  has_many :scores

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :affiliation

  with_options numericality: { other_than: 1 } do
    validates :affiliation_id
    validates :prefecture_id
  end
end
