# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | -------| ----------- |
| nickname           | string |             |
| lastname           | string | null: false |
| firstname          | string | null: false |
| birthday           | date   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :sns_credentials

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
| athlete             | reference |                   |
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

### Association
- has_many :scores

### unique
- add_index :games, :event_day        unique: true

## athletes テーブル

| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| name          | string    | null: false       |
| birthday      | date      | null: false       |
| prefecture_id | integer   | null: false       |
| affiliation   | integer   | null: false       |

### Association
- has_many :scores

### unique
- add_index :athletes, :name,        unique: true

## sns_credentials テーブル

| Column          | Type        | Options     |
| --------------- | ----------- | ------------|
| provider        | string      | null: false |
| uid             | string      | null: false |
| user            | references  | null: false |

### Association
- belongs_to :user, optional: true
