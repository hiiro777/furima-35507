## usersテーブル

|Column              |Type    |Options      |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| real_name          | string | null: false |
| furigana           | string | null: false |
| birthday           | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |


### Association
has_many: :items
has_many: :purchases


## itemsテーブル

|Column        |Type    |Options      |
|--------------|--------|-------------|
| content      | string | null: false |
| product_name | string | null: false |
| explanation  | string | null: false |
| category     | string | null: false |
| status       | string | null: false |
| delivery_fee | string | null: false |
| shipper      | string | null: false |
| days         | string | null: false |
| price        | string | null: false |

### Association
has_many: :purchases
belongs_to: :user


## purchasesテーブル

|Column|Type        |Options|
|------|------------|-------|
| user | references |-------|
| item | references |-------|

### Association
has_one: :delivery
belongs_to: :user
belongs_to: :item


## deliveryテーブル

|Column        |Type     |Options      |
|--------------|---------|-------------|
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| manicipality | string  | null: false |
| address      | integer | null: false |
| telephone    | integer | null: false |

### Association
belongs_to: :purchase