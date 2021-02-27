# テーブル設計

## scores テーブル

| Column              | Type      | Options           |
| ------------------- | --------- | ----------------- |
| floor_score_d       | float     | null: false       |
| floor_score_e       | float     | null: false       |
| floor_score_nd      | float     | null: false       |
| pommel_score_d      | float     | null: false       |
| pommel_score_e      | float     | null: false       |
| pommel_score_nd     | float     | null: false       |
| rings_score_d       | float     | null: false       |
| rings_score_e       | float     | null: false       |
| rings_score_nd      | float     | null: false       |
| vault_score_d       | float     | null: false       |
| vault_score_e       | float     | null: false       |
| vault_score_nd      | float     | null: false       |
| parallel_score_d    | float     | null: false       |
| parallel_score_e    | float     | null: false       |
| parallel_score_nd   | float     | null: false       |
| horizontal_score_d  | float     | null: false       |
| horizontal_score_e  | float     | null: false       |
| horizontal_score_nd | float     | null: false       |
| athlete             | reference                     |
| game                | reference | foreign_key: true |

### Association
- belongs_to :game
- belongs_to :athlete


## games テーブル

| Column             | Type      | Options                        |
| ------------------ | ------    | ------------------------------ |
| name               | string    | null: false                    |
| event_day          | date      | null: false                    |
| venue              | string    | null: false                    |
| prefecture_id      | integer   | null: false                    |
| score              | reference | null: false, foreign_key: true |

### Association
- has_many :scores

## athletes テーブル

| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| name          | string    | null: false       |
| birthday      | integer   | null: false       |
| prefecture_id | integer   | null: false       |
| affiliation   | integer   | null: false       |

### Association
- has_many :scores

## affiliations テーブル

| Column          | Type      | Options     |
| --------------- | --------- | ------------|
| name            | string    | null: false |

### Association
- belongs_to :athlete
