README

# Talky-Mine

## アプリケーション概要
このアプリケーションは音源を投稿し、公開する事ができるサウンドメディアです。ユーザーはパーソナリティにもリスナーにもなる事ができます。
サウンドは動画メディアやゲームと違い何かをしながら楽しむ事が可能です。
また、投稿者として他者に語りかける事により自身の発信する内容に対して深い理解を得る事ができます。

## アプリケーションURL
EC2導入版 : http://18.176.188.148/</br>
または</br>
heroku版 ： https://talky-mine-29213.herokuapp.com/</br>

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

* **ペルソナ**</br>
ランニングや筋トレ、または家事などの何か作業をしながら学習したい20~40代の男女

* **課題**</br>
多くの社会人は在宅勤務など就業環境の変化により、家で使える時間が増えた。その中で自己研鑽になるような活動を求める人には、動画や読書など時間を専有するものでなく、家事や筋トレ等をしながら学べるような、時間を併用できるメディアが必要とされていた。

## 洗い出した要件

![要件定義](./app/assets/images/yokenteigi.csv)

### 1, 投稿機能

**【優先順位:高】**</br>

**目的：**</br>
オーディオファイルを投稿する</br>
</br>
**詳細：**</br>
ログインしたユーザーは、新規投稿画面から自身の持つオーディオファイルを投稿し、公開する</br>
</br>
**ストーリー(ユースケース)：**</br>
・あるユーザーは日々の生活の中から画期的な学びを得た。</br>
・その学びを誰かに共有する事と共に、自身の理解を深めるために誰かに話したかった。</br>
・サウンド投稿メディアに投稿する事で自身の考えを発信し、共有する事ができた。</br>
</br>
**見積もり(所要時間):**</br> 
3時間</br>

### 2, 再生機能
**【優先順位:高】**</br>

**目的：**</br>
投稿されたオーディオファイルを再生する</br>
</br>
**詳細：**</br>
トップページの投稿一覧から投稿音源のサムネールをクリックする事で再生ページに遷移する。</br>
再生ページのオーディオプレイヤーを再生する事で投稿されたオーディオファイルを試聴できる。</br>
</br>
**ストーリー(ユースケース)：**</br>
・あるユーザーは自宅で過ごす時間が増えた事をきっかけに、以前より家事や運動をする事が増えた。
</br>
・作業をする時間の中で、何か学びに活かせる事はできないかと考えた。</br>
・サウンドメディアを再生しながら作業する事で、時間を効率的に使いながら学ぶ事ができた。</br>
</br>
**見積もり(所要時間):**</br> 
5時間</br>

### 3, コメント機能
**【優先順位:中】**</br>

**目的：**</br>
オーディオファイル再生ページにコメントする</br>
</br>
**詳細：**</br>
投稿内容に応じて、試聴したユーザーはコメントを記載する事ができる。</br>
</br>
**ストーリー(ユースケース)：**</br>
・あるユーザーは試聴した投稿内容について、印象に残ったと同時に疑問を感じので、その旨を投稿者や他のリスナーに対して意見を聞いてみたくなった。</br>
・コメントを残す事で、その疑問を投稿者や他のリスナーと共有でき、またコメントへの返信があった事でいろいろな意見を聞くことができた。</br>
</br>
**見積もり(所要時間):**</br> 
4時間</br>

### 4, いいね機能
**【優先順位:低】**</br>

**目的：**</br>
投稿音源に対して好印象を表現する</br>
</br>
**詳細：**</br>
投稿内容を試聴したユーザーは"いいね"ボタンを押すことで高評価を表現する事ができる。</br>
</br>
**ストーリー(ユースケース)：**</br>
・あるユーザーは試聴した投稿内容がとても魅力的に感じたので良い評価を投稿者に伝えたかった。</br>
・いいねボタンを押すことで手軽に高評価の反応を示す事ができた。</br>
</br>
**見積もり(所要時間):**</br> 
4時間</br>

## 実装した機能

1. ユーザーがパーソナリティーとなり、MP3などのオーディオファイルをアップロードし、投稿一覧に公開される機能。
2. ユーザーはアップロードされたオーディオファイルを投稿一覧から選択し、試聴できる機能。
3. 再生ページにコメントを記述でき、リスナー側のユーザーとパーソナリティー側のユーザーがコミュニケーションを取れる機能。
4. ユーザーは投稿された音源に対して"いいね"ボタンが押せ、その"いいね"のカウント数が再生ページと投稿一覧ページに表示される機能。


## 挙動確認

1. オーディオファイルの投稿</br>
![](./app/assets/images/gif/TMkyodo_01_0111.gif)
![](./app/assets/images/gif/TMkyodo_01_02.gif)

2. 再生ページで再生
![](./app/assets/images/gif/TMkyodo_02.gif)

3. コメント投稿
![](./app/assets/images/gif/TMkyodo_03.gif)

4. いいねボタン
![](./app/assets/images/gif/TMkyodo_04.gif)

## データベース設計
![ページ遷移図](./app/assets/images/TalkyMine_Moving.png)

![ER図](./app/assets/images/TalkyMine_ERMAP.png)

## ローカルでの動作確認方法

1. % git clone https://github.com/BugGreedy/talky-mine.git 
2. % cd talky-mine
3. % bundle install
4. % rails db:create
5. % rails db:migrate
6. % rails s
7. http://localhost:3000/ へアクセス

## version info 
* ruby '2.6.5'
* rails '~> 6.0.0'
* mysql2 '0.5.3'

## gemfile
### group: test
* rubocop 
* rspec-rails '~> 4.0.0'
* factory_bot_rails
* faker

### additional
* devise
* pry-rails
* mini_magick
* image_processing '~> 1.2'
* active_hash
* carrierwave
* audiojs-rails
* carrierwave-audio
* aws-sdk-s3, require: false # AWS S3導入時に追加
* fog # carrierwaveをS3に設定する際に追加

### group: production
* ~~rails_12factor # heroku導入時に追加~~
* unicorn '5.4.1' # EC2導入時に追加

