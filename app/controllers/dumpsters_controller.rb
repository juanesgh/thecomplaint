class DumpstersController < ApplicationController
    before_action :check
    before_action :is_admin

    def dumpster
        @dump = Post.all.where(dumpster: true)
    end

    def restoredump
        @id = params[:post_id]
        Post.find_by(id: @id).update(dumpster: false)
        redirect_to dumpster_path()
    end

    def makedumpster
        @prost = params[:post_id]
        Post.find_by(id: @prost).update(dumpster: true)
        redirect_to dumpster_path()
    end
end
