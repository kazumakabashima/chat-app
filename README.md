# テーブル設計
## user table

| Column                | Type   | Option      |
| --------------------- | ------ | ----------- |
| name                  | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
## room table

| Column      | Type   | Option      |
| ----------- | ------ | ----------- |
| name        | string | null: false |
### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
## room_user table

| Column      | Type      | Option                         |
| ----------- | --------- | ------------------------------ |
| user        | reference | null: false, foreign_key: true |
| room        | reference | null: false, foreign_key: true |
### Association

- belongs_to :room
- belongs_to :user
## message table

| Column      | Type      | Option                         |
| ----------- | --------- | ------------------------------ |
| content     | string    |                                |
| user        | reference | null: false, foreign_key: true |
| room        | reference | null: false, foreign_key: true |
### Association

- belongs_to :room
- belongs_to :user