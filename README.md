# README


## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, length: {minimum: 7}|
|password_conform|string|null: false|
|family_name|string|null: false, format: {with: /\A[ぁ-んァ-ン一-龥]/}|
|first_name|string|null: false, format: {with: /\A[ぁ-んァ-ン一-龥]/}|
|family_name_kana|string|null: false, format: {with: /\A[ァ-ヶー－]+\z/}|
|first_name_kana|string|null: false, format: {with: /\A[ァ-ヶー－]+\z/}|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_num|string|

### Association
- has_many :items
- has_one :address
- has_one :creditcard
- has_many :transactions
- has_many :likes
- has_many :messages
- has_many :comments


## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|string(7)|null: false, format: {with: /\A\d{3}[_]\d{4}\z/}|
|prefectures|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|apartment_name|string|

### Association
- belongs_to :user



### CreditCardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|

### Association
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|brand|string|
|condition|string|null: false|
|delivery_fee|string|null: false|
|delivery_regions|string|null: false|
|shipping_schedule|string|null: false|
|price|integer|null: false|
|user_id|references|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- has_many :transactions
- has_many :likes
- has_many :messages
- has_many :comments


### Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
has_many :items



### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
belongs_to :item



### Transactionテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item



### Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item



### Messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references, null|false, foreign_key: true|
|item_id|references, null|false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item



### Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
* ...
