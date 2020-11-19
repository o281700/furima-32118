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

# テーブル設計

## users テーブル

| column    | type   | option     |
| --------- | ------ | ---------- |
| nickname  | string | null: false|
| email     | string | null: false|
| password  | string | null: false|
| full_name | string | null: false|
| name_kana | string | null: false|
| birthday  | string | null: false|

### Association
- has_many items
- has_many buys

## items テーブル

| column   | type    | option                         |
| -------- | ------- | ------------------------------ |
| image    | text    | null: false                    |
| name     | string  | null: false                    |
| explain  | text    | null: false                    |
| category | string  | null: false                    |
| status   | string  | null: false                    |
| fee      | string  | null: false                    |
| area     | string  | null: false                    |
| days     | string  | null: false                    |
| price    | integer | null: false                    |
| user_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to user
- has_one bay

## buys テーブル

| column  | type    | option                         |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to user
- belongs_to item
- has_one info


## infos テーブル

| column | type    | option      |
| ------ | ------- | ----------- |
| card   | integer | null: false |
| exp    | integer | null: false |
| code   | integer | null: false |
| postal | integer | null: false |
| plef   | string  | null: false |
| city   | string  | null: false |
| add    | string  | null: false |
| bldg   | string  |             |
| tel    | integer | null: false |

### Association
- belongs_to buy
