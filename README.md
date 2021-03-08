<h2>アプリケーション概要</h2>

<p>オススメのお笑いのネタを投稿して共有できるSNSサービス。</p>

<p>URL:http://18.223.73.24/</p>
<h2>動機</h2>

<p>昔からお笑いが好きだが、たくさんの芸人さんやネタがあって面白いネタを探すことが大変だった。</p><br>
<p>そこでお笑いに関してのみ投稿するSNSがあれば、便利に面白いネタを探せると思い作成しました。</p>

<h2>アプリケーション機能</h2>
<ul>
  <li>基本的なCRUD処理</li>
  <li>ログイン機能(devise)</li>
  <li>記事投稿機能</li>
  <li>記事一覧機能</li>
  <li>画像投稿機能</li>
  <li>フォロー・フォロワー一覧機能</li>
  <li>ゲストユーザー機能機能</li>
  <li>フォロー機能</li>
  <li>ソート(kaminari)</li>
  <li>ユーザー画像登録</li>
  <li>コメント機能</li>
  <li>パスワード変更メール</li>
</ul>

<h2>使用技術</h2>
<ul>
  <li>MySQL</li>
  <li>nginx,puma</li>
  <li>JavaScript・jQuery</li>
  <li>Ruby 2.6.3</li>
  <li>Ruby on Rails 6.0.3.5</li>
  <li>RSpec(テストフレームワーク)</li>
  <li>docker,docker-compose(開発環境)</li>
  <li>AWS/本番環境 (EC2,VPC)</li>
  <li>Mac OS(10.15.7)</li>
  <li>Amazon Linux</li>
  <li>Git,GitHub(バージョン管理)</li>
</ul>
<h2>工夫した点</h2>
<p>N+１問題の解消</p>

<p>フォロー機能に非同期通信(Ajax)の導入
  
<h2>サイトマップ</h2>
<img width="998" alt="スクリーンショット 2021-02-18 0 42 09" src="https://user-images.githubusercontent.com/76152070/108398019-ec7ae700-725b-11eb-9a6f-788e1ba7cb12.png">

<h2>ER図</h2>
<img width="614" alt="スクリーンショット 2021-02-19 3 38 45" src="https://user-images.githubusercontent.com/76152070/108405231-2e0f9000-7264-11eb-887a-3f61e0fa775c.png">
<h2>実装予定</h2>
<ul>
  <li>検索機能</li>
  <li>お気に入り機能(いいね機能)</li>
  <li>5段階評価機能</li>
</ul>
