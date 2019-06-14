class UserhomesController < ApplicationController
    before_action :check
    
    def userhome
      @posts = Post.all.order(:created_at)
    end
end
