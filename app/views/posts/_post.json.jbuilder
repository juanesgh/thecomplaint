json.extract! post, :id, :user_id, :title, :description, :image, :location, :solved, :open, :dumpster, :deleted, :created_at, :updated_at
json.url post_url(post, format: :json)
