class UserhomesController < ApplicationController
    
    def userhome
      @posts = Post.all.order(:created_at)
    end
end
