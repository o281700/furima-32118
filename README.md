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

| column             | type   | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_kana          | string | null: false               |
| first_kana         | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many items
- has_many buys

## items テーブル

| column      | type    | option                         |
| ----------- | ------- | ------------------------------ |
| name        | string  | null: false                    |
| explain     | text    | null: false                    |
| category_id | integer | null: false                    |
| status_id   | integer | null: false                    |
| fee_id      | integer | null: false                    |
| area_id     | integer | null: false                    |
| day_id      | integer | null: false                    |
| price       | integer | null: false                    |
| user_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to user
- has_one bay
- belongs_to_active_hash category
- belongs_to_active_hash status
- belongs_to_active_hash fee
- belongs_to_active_hash area
- belongs_to_active_hash days

## buys テーブル

| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to user
- belongs_to item
- has_one info


## infos テーブル

| column  | type       | option                         |
| ------  | ---------- | ------------------------------ |
| postal  | string     | null: false                    |
| area_id | integer    | null: false                    |
| city    | string     | null: false                    |
| add     | string     | null: false                    |
| bldg    | string     |                                |
| tel     | string     | null: false                    |
| buy     | references | null: false, foreign_key: true |

### Association
- belongs_to buy
- belongs_to_active_hash area
