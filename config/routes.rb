Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :customers, controllers: {
  	sessions:      'customers/sessions',
  	passwords:     'customers/passwords',
  	registrations: 'customers/registrations'
  }

  root 'home#top'
  get 'customers/home/about' => 'customers/home#about' #abouotページ
  get 'customers/home/contact' => 'customers/home#contact' #問合せフォーム
  get 'customers/home/confirm' => 'customers/home#confirm' #問合せ内容確認画面
  get 'customers/home/thanks' => 'customers/home#thanks' #問合せありがとうページ

  get 'customers/mypage' => 'customers#mypage' #myページ
  get 'customers/edit' => 'customers#edit' #編集ページ
  get 'customers/withdraw' => 'customers#withdraw' #退会ページ

  get 'customers/cafe_posts/favorite' => 'customers/cafe_post#favorite' #猫カフェ投稿いいね一覧
  get 'customers/product_posts/favorite' => 'customers/product_posts#favorite' #猫グッズ投稿いいね

  get 'customers/followers' => 'relationships#followers', as: 'followers'
  get 'customers/followees' => 'relationships#followees', as: 'followees'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :customers do
  	resources :cafe_posts, only: [:index, :show, :update, :edit, :destroy, :create, :new] do #猫カフェ投稿
  	  resources :cafe_post_comments, only: [:create, :destroy] #猫カフェコメント
  	  resource :cafe_favorites, only: [:create, :destroy] #猫カフェいいね
  	end

  	resources :product_posts, only: [:index, :show, :update, :edit, :destroy, :create, :new] do #猫グッズ投稿
  	  resources :product_post_comments, only: [:create, :destroy] #猫グッズコメント
  	  resource :product_favorites, only: [:create, :destroy] #猫グッズいいね 
  	end

  end

end
