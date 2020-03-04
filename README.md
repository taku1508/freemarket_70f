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
|huriganaf|string|null: false|
|huriganas|string|null: false|
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
|image1|string|null: false|
|image2|string||
|image3|string||
|image4|string||
|image5|string||
|image6|string||
|image7|string||
|image8|string||
|image9|string||
|image10|string||
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :items



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category1|string||
|category2|string||
|category3|string||
|category4|string||
|category5|string||
|category6|string||
|category7|string||
|category8|string||
|category9|string||
|category10|string||

### Association
- has_many :item_categories
- has_many :items,through::item_categories


## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false,foreign_key: true|
|categories_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :items
- belongs_to :categories