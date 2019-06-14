Rails.application.routes.draw do
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#create'
    get '/users/sign_up' => 'devise/registrations#create'
  end

  get '/posts/index', to: 'posts#index'
  root to: 'homes#home'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :posts do
    resources :comments
  end
  resources :users

  post '/postsearchs', to: 'postsearchs#search'
  get '/postsearchs', to: 'postsearchs#postsearch'
  
  get '/likes', to: 'posts#likes'
  get '/dislikes', to: 'posts#dislikes'
  post '/commentLike', to: 'posts#commentLike'
  post '/commentDisLike', to: 'posts#commentDisLike'
  get '/hideComment', to: 'posts#hideComment'
  post '/deleteuser', to: 'useradmins#deleteuser'
  post '/changepassword', to: 'changepasswords#changepassword'
  post '/blacklist', to: 'blacklists#blacklist'
  post '/banuser', to: 'useradmins#banuser'
  patch '/blacklistuser', to: 'useradmins#blacklistuser'
  post '/redeem', to: 'blacklists#redeem'

  post '/revokeadmin', to: 'adminsystems#revokeadmin'
  post '/revokesuperadmin', to: 'adminsystems#revokesuperadmin'
  post '/makeadmin', to: 'adminsystems#makeadmin'
  post '/makesuperadmin', to: 'adminsystems#makesuperadmin'

  get '/users', to: 'users#index'
  get '/blacklist', to: 'blacklists#blacklist'##########
  get '/adminreg', to: 'adminregs#adminreg'###########
  get '/changepassword', to: 'changepasswords#changepassword'###############
  get '/dumpster', to: 'dumpsters#dumpster'####################
  get '/editprofile', to: 'editprofiles#editprofile'
  get '/home', to: 'homes#home'##########
  get '/passrec', to: 'passrecs#passrec'########
  get '/reg', to: 'regs#reg'
  get '/useradmin', to: 'useradmins#useradmin'###########
  get '/userhome', to: 'userhomes#userhome'###########
  get '/userprofile', to: 'userprofiles#userprofile'#!!!!!!!!!!!!!!!!!!!!
  get '/adminsystem', to: 'adminsystems#adminsystem'##############
  get '/messages/conversation', to: 'messages#conversation'##########
  get '/messages', to: 'messages#chats'#############

  get '/geofences', to: 'geofences#admins'
  get '/geofences/viewadmin', to: 'geofences#viewadmin'
  get '/geofences/addfences', to: 'geofences#addfences'
  post '/def', to: 'geofences#removefence'
  get '/as', to: 'geofences#as'
  post '/checkfence', to: 'geofences#checkfence'



  post '/users', to: 'users#create'
  post '/posts', to: 'posts#create'

  delete '/users', to: 'users#destroy'
  delete '/posts', to: 'posts#destroy'

  patch '/users', to: 'users#update'
  patch '/posts', to: 'posts#update'



end

