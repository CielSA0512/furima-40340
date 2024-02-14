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
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchase_records



## items テーブル

| column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| item_content    | text       | null: false |
| category        | integer    | null: false |
| status          | integer    | null: false |
| Delivery_charge | integer    | null: false |
| prefecture      | integer    | null: false |
| shipping_day    | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record



## purchase_records テーブル
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item



## addresses テーブル

| column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecture     | integer    | null: false |
| city           | string     | null: false |
| house_number   | string     | null: false |
| building_name  | string     |
| phone_number   | string     | null: false |

### Association

- belongs_to :purchase_record
