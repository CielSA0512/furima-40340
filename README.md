#テーブル設計

## users テーブル

| column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| year               | integer | null: false |
| month              | integer | null: false |
| day                | integer | null: false |

### Association

- has_many :items

## items テーブル

| column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| item_content    | text       | null: false |
| category        | integer    | null: false |
| status          | integer    | null: false |
| Delivery_charge | integer    | null: false |
| shipping_area   | integer    | null: false |
| shipping_days   | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## purchase テーブル

### Association

- belongs_to :address

## address テーブル

| column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecture     | integer    | null: false |
| city           | string     | null: false |
| house_number   | string     | null: false |
| building_name  | string     | null: false |
| phone_number   | string     | null: false |

### Association

- has_one :purchase