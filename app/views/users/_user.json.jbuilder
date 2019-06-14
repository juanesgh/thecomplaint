json.extract! user, :id, :name, :lastname, :nick, :phone, :email, :country, :city, :image, :admin, :superadmin, :blacklist, :banned, :deleted, :created_at, :updated_at
json.url user_url(user, format: :json)
