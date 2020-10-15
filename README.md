## アプリケーション名
# 「warehouse」
![image](https://user-images.githubusercontent.com/66520239/93739357-0c619c80-fc23-11ea-85d8-5fe868eefb9c.png)

## 概要
私の前職での課題をテーマにしたアプリケーションになります
倉庫内の商品がどこにあるか検索して場所を特定するアプリケーションになります。
ここでの商品とは前職で扱っていた「プラスチック段ボールのプレート」になります。
イメージしにくいと思うので以下の画像をご覧いただきイメージを掴んでみてください

![image](https://user-images.githubusercontent.com/66520239/93739187-a412bb00-fc22-11ea-8547-ab75c278a584.png)
![image](https://user-images.githubusercontent.com/66520239/93739244-d0c6d280-fc22-11ea-9398-0956b01e2fe1.png)

## 機能一覧
・ログイン（device)
・商品登録、編集、削除
・倉庫への商品の登録


## URL
https://warehouse-28332.herokuapp.com/

AWSのEC2にもデプロイする予定です



## テスト用アカウント
閲覧者様ログイン用アカウント
ゲストログインをご利用ください


## 利用方法
まずはユーザー登録（社員番号、氏名）を入力し、ログインをします。
登録しないと倉庫の情報は参照はできません。

倉庫の登録者は在庫としてある商品を登録しておき、
その商品を倉庫の住所（倉庫名、列、番地、段数）を決め保管し登録します。

検索者は探したい商品の情報（型、厚み、硬さ、色、幅、長さ、枚数）の情報を選び、倉庫のどこにあるか特定します。


## 目指した課題解決
登録者は何処に商品が保存されているかある程度把握していますが
検索者は把握していません。
検索者は登録者が登録した情報を商品の情報を元に探し出し商品の場所を特定することができるようにキーワードを用いて検索することができます

## テーブル設計

### usersテーブル

| Column           | Type   | Options    |
| ---------        | ------ | ---------- |
| name             | string | null:false |
| employee_number  | string | null:false |
| password         | string | null:false |

#### Association

- has_many :plates
- has_many :warehouses


### platesテーブル

| Column            | Type       | Options                       |
| --------------    | ---------- | ----------------------------- |
| mold_id           | integer    | null:false                    |
| thickness_id      | integer    | null:false                    |
| hardness_id       | integer    | null:false                    |
| plate_color_id    | integer    | null:false                    |
| plate_width_id    | integer    | null:false                    |
| plate_length_id   | integer    | null:false                    |
| Number_of_sheets  | integer    | null:false                    |
| user              | references | null:false, foreign_key: true |

#### Association

- belongs_to :user
- has_many :warehouse


### warehouseテーブル

| Column            | Type       | Options                       |
| --------------    | ---------- | ----------------------------- |
| warehouse_number  | string     | null:false                    |
| warehouse_colum   | string     | null:false                    |
| house_number      | integer    | null:false                    |
| number_of_stage   | integer    | null:false                    |
| user              | references | null:false, foreign_key: true |
| plate             | references | null:false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :plate