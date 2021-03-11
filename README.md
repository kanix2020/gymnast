　　　　　　　　　　　　![olympic07_gymnastics](https://user-images.githubusercontent.com/77039946/109603660-75035c80-7b65-11eb-89fa-0bdeac5b83a6.png)`
## 更新
- 2021/3/10 スコア入力「Total欄」について　（計算機能実装中）           

# アプリケーション名	
- Gymnast

# アプリケーション概要	
- 体操競技における採点結果集計アプリ。

# 目指した課題解決	
以前所属のチームではスコア集計作業を「集計用紙」にて行っていました。
<br>これに不便さを感じており、今回のアプリ開発では、

- 誤記入時における訂正（誤記入箇所の訂正を横線で行っていたため、紙が汚くなり見辛い）
- トータルスコアの計算（電卓で計算）
- 二重作業（試合終了後、紙で記載していた内容をExcel等に再度データ入力）

以上の煩雑な手順の簡略化を目標とし、課題解決を目指した。

# 実装した機能
基本機能として、以下の５つの機能を実装しました。
- ログイン機能（SNS認証）
- 大会登録機能
- 選手登録機能
- 集計結果取り込み・表示機能
- 集計結果CSV出力機能

### ログイン機能（SNS認証）<br>
![SNS認証](https://user-images.githubusercontent.com/77039946/109589987-8d1bb180-7b4e-11eb-9617-cee387e762bd.gif)

### 大会登録機能<br>
![サイドバーに大会表示](https://user-images.githubusercontent.com/77039946/109597182-120cc800-7b5b-11eb-92e9-d88c4e3f91d3.gif)

### 選手登録機能<br>
![選手登録](https://user-images.githubusercontent.com/77039946/109598079-e3432180-7b5b-11eb-9a8e-5f6790754eee.gif)

### 集計結果取り込み・表示機能<br>
![スコア取り込み](https://user-images.githubusercontent.com/77039946/109595533-0d92e000-7b58-11eb-9a11-f240aaf5c2c3.gif)

### 集計結果CSV出力機能<br>
![集計結果CSV化](https://user-images.githubusercontent.com/77039946/109598558-cfe48600-7b5c-11eb-9d8f-bb68305ea7f4.gif)

# URL
- http://54.95.203.169/

# テスト用アカウント	
- Basic認証ID    :admin
- Basic認証PW    :2222
- ログインEメール:test@test.com
- ログインPW     :123456 

# 利用について	
- ゲストユーザー  :閲覧機能のみ使用可能です。
<br>（大会毎の採点結果閲覧及びCSV出力、スコアの計算）
- ログインユーザー :閲覧機能＋登録機能が使用可能です。
<br>（大会毎の採点結果閲覧及びCSV出力、スコアの計算、選手登録、大会登録、入力スコアの取り込み）

# 使用技術
### バックエンド
- Ruby(ver 2.6.5)
- Ruby on rails(ver 6.0.3.5)
### フロントエンド
- HTML 
- CSS 
- BootStrap(ver 4.1.1) 
- JavaScript
### データベース
- MySQL(ver 5.6) 
- SeaquelPro
### 外部API
- GoogleCloudPlatform
### インフラ
- AWS(EC2) 
- Capistrano
### Webサーバー(本番環境) 
- nginx
### アプリケーションサーバー(本番環境) 
- unicorn(ver 5.4.1)
### ソース管理
- GitHub
- GitHubDesktop
### テスト
- RSpec
### エディタ
- VScode

# 要件	
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
- ログインしていないユーザーには機能制限がかかる（登録作業は行わせない）。
### SNS認証
- ユーザーのログイン・新規登録時における負担を減らすため。
## 保守管理
- Rspecを用いたテストコードの実装

# 今後の課題	
- スコアデータ取り込み時、取り込みに失敗した場合はデータを保持した状態を保つようにする。
- スコアデータ登録時、「登録しました」という画面を表示させる。
- ~~スコア入力画面において、計算結果が即時に計算され、結果がわかるようにする~~(2021/03/10　実装)
https://gyazo.com/c5f361376edb08fcbd9e39c69621f86c
- EC2上でSNS認証機能を実装（現在ローカル環境のみ）。


# ローカルでの動作方法	
### 動作環境
- Ruby(ver 2.6.5)
- Ruby on rails(ver 6.0.3.5)
- MySQL(ver 5.6) 

### ローカルサーバー起動までの手順
- 任意のフォルダへGit cloneを行う
- エディタを開き、上記の任意フォルダに格納したGymnastフォルダを開く。
- ターミナルで「cd」コマンドを使用し、Gymnastフォルダにディレクトリを移動。
- ターミナルで「rails s」コマンドを使用し、ローカルサーバーの起動
- GoogleChrome（ブラウザ）を開き、URLに「localhost:3000」を開く。
- 上記記載の「テスト用アカウント」を参考に、Basic認証ID・パスワードを入力。　以上

# データベース設計
## ER図	
![ER図](https://user-images.githubusercontent.com/77039946/109584984-f6e38d80-7b45-11eb-8afb-da021920841e.png)

## テーブル設計
### users テーブル

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
