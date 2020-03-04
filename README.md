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
|mailaddress|string|null: false, unique: true|
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
|roomnumber|string|null: false|
|phonenumber|integer|null: false|

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

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image1|string|null: false|
|image2|string|null: false|
|image3|string|null: false|
|image4|string|null: false|
|image5|string|null: false|
|image6|string|null: false|
|image7|string|null: false|
|image8|string|null: false|
|image9|string|null: false|
|image10|string|null: false|
|item_id|integer|null: false, foreign_key: true|


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category1|string|null: false|
|category2|string|null: false|
|category3|string|null: false|
|category4|string|null: false|
|category5|string|null: false|
|category6|string|null: false|
|category7|string|null: false|
|category8|string|null: false|
|category9|string|null: false|
|category10|string|null: false|


## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false,foreign_key: true|
|categories_id|integer|null: false, foreign_key: true|
