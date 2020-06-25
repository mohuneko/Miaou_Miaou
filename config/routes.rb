
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, controllers: {
  	sessions:      'customers/sessions',
  	passwords:     'customers/passwords',
  	registrations: 'customers/registrations'
  }

  root 'home#top'
  get 'customers/about' => 'customers/home#about' #abouotページ
  get 'customers/contact' => 'customers/contacts#contact' #問合せフォーム
  post 'customers/confirm' => 'customers/contacts#confirm' #問合せ内容確認画面
  post 'customers/thanks' => 'customers/contacts#thanks' #問合せありがとうページ

  get 'customers/mypage' => 'customers#mypage' #myページ
  get 'customers/edit' => 'customers#edit' #パスワード編集ページ
  get 'customers/fix' => 'customers#fix' #編集ページ
  patch 'customers/fix' => 'customers#fix_update'
  put 'customers/fix' => 'customers#fix_update'
  get 'customers/withdraw' => 'customers#withdraw' #退会ページ
  put 'customers/withdraw' => 'customers#withdraw_update'

  get 'customers/cafe_posts/favorite' => 'customers/cafe_posts#favorite' #猫カフェ投稿いいね一覧
  get 'customers/product_posts/favorite' => 'customers/product_posts#favorite' #猫グッズ投稿いいね

  get 'customers/product_posts/mypost' => 'customers/product_posts#mypost' #自分の投稿
  get 'customers/product_posts/posts' => 'customers/product_posts#posts' #@customerの投稿

  post 'follow/:id' => 'customers/relationships#follow', as: 'follow' #フォローする
  delete 'unfollow/:id' => 'customers/relationships#unfollow', as: 'unfollow' #フォローを外す

# 　resources :customers, only: [:show, :index, :edit, :update] #フォロー
  get 'customers/:customer_id/followers' => 'customers/relationships#followers', as: 'followers'
  get 'customers/:customer_id/follows' => 'customers/relationships#follows', as: 'follows'

  get 'customers/search' => 'customers/product_posts#search' #postのsearch

  get 'customers/product_categories' => 'customers/product_categories#index' #カテゴリー一覧



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :customers do
  	resources :cafe_posts, only: [:index, :show, :update, :edit, :destroy, :create, :new] do #猫カフェ投稿
  	  resources :cafe_comments, only: [:create, :destroy] #猫カフェコメント
  	  resource :cafe_favorites, only: [:create, :destroy] #猫カフェいいね
  	end

  	resources :product_posts, only: [:index, :show, :update, :edit, :destroy, :create, :new] do #猫グッズ投稿
  	  resources :product_comments, only: [:create, :destroy] #猫グッズコメント
  	  resource :product_favorites, only: [:create, :destroy] #猫グッズいいね 
  	end

  end

end
