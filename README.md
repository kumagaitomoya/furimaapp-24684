# テーブル設計

## user テーブル

| Column             | Type     |Options                   |
| ---------------    | -------- |-----------------------   |
| nickname           | string   | null: false              |
| encrypted_password | string   | null: false              |
| email              | string   | null: false unique: true |
| last_name          | string   | null: false              |
| first_name         | string   | null: false              |
| last_name_kana     | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |
　　
## Association

- has_many :products
- has_many :buyers


## product テーブル
| Column              | Type       | Options                       |
| ----------------    | ---------- | ----------------------------- |
| user                | references | null: false,foreign_key: true |
| name                | string     | null: false                   |
| status              | text       | null: false                   |
| price               | integer    | null: false                   |
| category_id         | integer    | null: false                   |
| shipping_charges_id | integer    | null: false                   |
| shipping_days_id    | integer    | null: false                   |
| shipping_area_id    | integer    | null: false                   |
| condition_id        | integer    | null: false                   |

# Association
- belongs_to :user
- has_one :buyer

## buyer テーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------  |
| user                | references | null: false,foreign_key: true |
| product             | references | null: false,foreign_key: true |

# Association
- belongs_to :user 
- belongs_to :product
- has_one :address

## addresses テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | -----------                   |
| postal_code      | string     | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| buiding_name     | string     |                               |
| phone_namber     | string     | null: false                   |
| shipping_area_id | integer    | null: false                   |
| buyer            | references | null: false,foreign_key: true |

# Association
- belongs_to :buyer