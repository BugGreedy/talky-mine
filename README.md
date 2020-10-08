README

# Talky-Mine

## アプリケーション概要
このアプリケーションは音源を投稿し、公開する事ができるサウンドメディアです。公開する事ができます。ユーザーはパーソナリティにもリスナーにもなる事ができます。
サウンドは動画メディアやゲームと違い何かをしながら楽しむ事が可能です。
また、投稿者として他者に語りかける事により自身の発信する内容に対して深い理解を得る事ができます。

## アプリケーションURL
https://talky-mine-29213.herokuapp.com/

## テスト用アカウント

| 適用         | id(Email)         | password   |
| ----------- | ----------------- | ---------- |
| Basic認証    | admin             | 2222       |
| 投稿ユーザー   | toukou@gmail.com  | sample6    |
| 試聴ユーザー   | shichou@gmail.com | sample6    |

## 利用方法

1. ユーザーログインをした後、ページ右上の「投稿する」をクリック
2. MP3ファイル等の音源ファイルをアップロード
3. トップページから投稿した内容のサムネイルをクリック
4. 詳細ページに遷移するので、そこでサウンドプレイヤーを再生

## 目指した課題解決
このアプリケーションは下記のような人達の課題を解決するために開発しました。

* ペルソナ
ランニングや筋トレ、または家事などの何か作業をしながら学習したい20~40代の男女

* 課題
多くの社会人は在宅勤務など就業環境の変化により、家で使える時間が増えた。その中で自己研鑽になるような活動を求める人には、動画や読書など時間を専有するものでなく、家事や筋トレ等をしながら学べるような、時間を併用できるメディアが必要とされていた。

## 洗い出した要件
 
| 優先順位(高:3,中:2,低:1) | 機能          | 詳細                                                                       |
| ---------------------- | ------------ ｜ ------------------------------------------------------------------------- |
| 3                      | コメント機能    | トップページの投稿一覧から投稿音源のサムネールをクリックする事で再生ページに遷移する。   |
|                        |               | 再生ページのオーディオプレイヤーを再生する事で投稿されたオーディオファイルを試聴できる。  |
<!-- | ---------------------- | ------------- | -------------------------------------------------------------------------- | -->









## 実装した機能

1. ユーザーがパーソナリティーとなり、MP3などのオーディオファイルをアップロードし、投稿一覧に公開される機能。
2. ユーザーはアップロードされたオーディオファイルを投稿一覧から選択し、試聴できる機能。
3. 再生ページにコメントを記述でき、リスナー側のユーザーとパーソナリティー側のユーザーがコミュニケーションを取れる機能。
4. ユーザーは投稿された音源に対して"いいね"ボタンが押せ、その"いいね"のカウント数が再生ページと投稿一覧ページに表示される機能。


## 挙動確認

## データベース設計
![ページ遷移図](./app/assets/images/TalkyMine_Moving.png)

![ER図](./app/assets/images/TalkyMine_ERMAP.png)
