# アプリケーション名	
- Gymnast

# アプリケーション概要	
- 体操競技における採点結果集計アプリ。

# 使用技術
### バックエンド
- Ruby, Ruby on rails
### フロントエンド
- HTML, CSS, BootStrap, JavaScript
### データベース
- MySQL, SeaquelPro
### 外部API
- GoogleCloudPlatform
## インフラ
- AWS(EC2), Capistrano
### Webサーバー(本番環境) 
- nginx
### アプリケーションサーバー(本番環境) 
- unicorn
### ソース管理
- GitHub,GitHubDesktop
### テスト
- RSpec
### エディタ
- VScode

# URL
- http://54.95.203.169/

# テスト用アカウント	
- Basic認証ID    :admin
- Basic認証PW    :2222
- ログインEメール:test@test.com
- ログインPW     :123456 

# 利用方法	
- ゲストユーザー  :閲覧機能のみ使用可能です。（大会毎の採点結果閲覧及びCSV出力、スコアの計算）
- ログインユーザー:閲覧機能＋登録機能が使用可能です。（大会毎の採点結果閲覧及びCSV出力、スコアの計算、選手登録、大会登録、入力スコアの取り込み）

# 目指した課題解決	
- 以前所属していた大学の大会スコア集計作業を”紙”で行っていた事に以下の課題を感じておりました。
　誤記入時における訂正（誤記入箇所の訂正を横線で行っていたため、紙が汚くなり見辛い）
　トータルスコアの計算（電卓で計算）
　２重作業（試合終了後、紙で記載していた内容をExcel等に再度データ入力）
  以上の煩雑な手順を簡略化し課題解決を目指しました。

# 洗い出した要件	
## 情報入力機能
### 得点入力機能
- 集計結果の元となる得点を入力、及びDBに保存できるようにする。
### 選手登録機能
- 得点入力時に必要となる「どの選手の得点を入力するか」の部分で使用するデータを登録するため。
### 大会登録機能
- 得点入力時に必要となる「どの大会の得点を入力するか」の部分で使用するデータを登録するため。
## 集計結果表示
### 大会毎の結果表示画面
- どの大会でどの選手が何点取れたかを確認できる様にする。
### 大会毎の結果表示画面（CSV）
- 集計データCSVで出力する事により、ユーザーが自由に使用できる様にする。
## ログイン機能
- 当アプリを使用するにあたり、ログインしていないユーザーはある程度の機能制限を儲けさせるため。
### SNS認証
- ユーザーのログイン・新規登録時における負担を減らすため。
## 保守管理
- Rspecを用いたテストコードの実装

# 実装予定の機能	
- 選手情報・大会情報・所属チームの詳細画面を作成する。
- スコアデータ取り込み時、取り込みに失敗した場合はデータを保持した状態を保つようにする。
- スコアデータ登録時、「登録しました」という画面を表示させる。
- スコア入力画面において、計算結果が即時に計算され、結果がわかるようにする
- サイドバーをハンバーガーメニューにする。
- EC2上でSNS認証機能を使用できる様にする。

# データベース設計	
 ![ER図](/Users/yussan/Desktop/myapp/gymnast/gymnast.png)
 
# ローカルでの動作方法	
- git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

# DBテーブル設計

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
