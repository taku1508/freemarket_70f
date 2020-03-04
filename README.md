# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|mailaddress|string|null: false|
|password|string|null: false|
|firstname|string|null: false|
|secondname|string|null: false|
|hurigana_first|string|null: false|
|hurigana_second|string|null: false|
|Birthday|integer|null: false|
|addressname|string|null: false|
|addresshurigana|string|null: false|
|postalcode|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|housenumber|string|null: false|
|roomnumber|string||
|phonenumber|integer||

### Association
- has_many :items



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|category|string|null: false|
|brand|string|null: false|
|status|string|null: false|
|shippingcharges|string|null: false|
|area|string|null: false|
|days|string|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_many :images
- has_many :item_categories
- has_many :categories,through::item_categories



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string||


### Association
- has_many :item_categories
- has_many :items,through::item_categories


## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false,foreign_key: true|
|categories_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :categorie