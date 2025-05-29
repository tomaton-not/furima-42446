# README

## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| id                  | integer    |                                |
| nickname            | string     | null: false                    |
| email               | string     | null: false                    |
| password            | string     | null: false                    |
| encrypted_password  | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| birth_date          | date       | null: false                    |
| timestamps          | datetime   |                                |

### Association
- has_many :items
- has_many :orders



## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| id                  | integer    |                                |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | references | null: false, foreign_key: true |
| condition_id        | references | null: false, foreign_key: true |
| shipping_costs_id   | references | null: false, foreign_key: true |
| shipped_from_id     | references | null: false, foreign_key: true |
| delivery_time_id    | references | null: false, foreign_key: true |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| timestamps          | datetime   |                                |

※ 画像は ActiveStorage で管理するため、カラムとしては記載しません。

### Association
- belongs_to :user
- has_one :order



## ordersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| id                  | integer    |                                |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |
| timestamps          | datetime   |                                |

### Association
- belongs_to :user
- belongs_to :item
- has_one :adress


## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| id                  | integer    |                                |
| post_code           | text       | null: false                    |
| prefecture          | text       | null: false                    |
| city                | text       | null: false                    |
| house_number        | text       | null: false                    |
| building_name       | text       |                                |
| telephone_number    | integer    | null: false                    |
| order_id            | references | null: false, foreign_key: true |
| timestamps          | datetime   |                                |

### Association
- belongs_to :order
