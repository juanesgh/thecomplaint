class PostsearchsController < ApplicationController

    def search 
        term = params[:terms].tr(',.<>!@#$%^&*()_={]}["|\/?><;:', '')
        term = term.downcase
        term = term.split(' ')
        @tt = term
        @us = []
        @pos = []#perfect hasta aca 
        u = User.all.where(deleted: false).where(banned: false).where(blacklist: false)
        @s = []
        u.each do |usu|
            i = 0
            while i < term.length do
                if usu.name.include? term[i].downcase or usu.lastname.include? term[i].downcase or usu.nick.include? term[i].downcase
                    @us.push(usu)
                    break
                end
                i += 1
            end
        end
        p = Post.all.where(dumpster: false).where(deleted: false)
        p.each do |po|
            i = 0
            while i < term.length do
                if po.title.include? term[i].downcase or po.description.include? term[i].downcase
                    @pos.push(po)
                    break
                end
                i += 1
            end
        end
        #post que aparecen en la busqueda
        #no incluir  a los post eliminados en dumpster o cualquier otro   
    end

    def postsearch
    end
end
