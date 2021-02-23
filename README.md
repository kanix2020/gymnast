# テーブル設計

## scores テーブル

| Column             | Type      | Options           |
| ------------------ | --------- | ----------------- |
| floor_score_d      | integer   | null: false       |
| floor_score_e      | integer   | null: false       |
| pommel_score_d     | integer   | null: false       |
| pommel_score_e     | integer   | null: false       |
| rings_score_d      | integer   | null: false       |
| rings_score_e      | integer   | null: false       |
| vault_score_d      | integer   | null: false       |
| vault_score_e      | integer   | null: false       |
| parallel_score_d   | integer   | null: false       |
| parallel_score_e   | integer   | null: false       |
| horizontal_score_d | integer   | null: false       |
| horizontal_score_e | integer   | null: false       |
| memo               | string                        |
| athlete            | reference | foreign_key: true |

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
