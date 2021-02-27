class Score < ApplicationRecord
  with_options presence: true do
    with_options numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' } do
      validates :floor_d
      validates :floor_e
      validates :floor_nd
      validates :pommel_d
      validates :pommel_e
      validates :pommel_nd
      validates :rings_d
      validates :rings_e
      validates :rings_nd
      validates :vault_d
      validates :vault_e
      validates :vault_nd
      validates :parallel_d
      validates :parallel_e
      validates :parallel_nd
      validates :horizontal_d
      validates :horizontal_e
      validates :horizontal_nd
    end
    validates :game_id
    validates :athlete_id
  end
  validates :athlete_id, uniqueness: { scope: :game }

  belongs_to :game
  belongs_to :athlete
end
