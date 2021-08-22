## usersテーブル
|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_furigana      | string | null: false               |
| first_furigana     | string | null: false               |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |

### Association
has_many: :items
has_many: :purchases

## itemsテーブル
|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| product_name    | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
has_one: :purchase
belongs_to: :user

## purchasesテーブル
|Column|Type        |Options                         |
|------|------------|--------------------------------|
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
has_one: :delivery
belongs_to: :user
belongs_to: :item

## deliveriesテーブル
|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| manicipality  | string     | null: false                    |
| address       | string     | null: false                    |
| telephone     | string     | null: false                    |
| building_name | string     |                                |
| purchase      | references | null: false, foreign_key: true |

### Association
belongs_to: :purchase
