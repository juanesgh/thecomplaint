class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.where(dumpster: false, deleted: false )
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    set_post
    @cmt = Comment.new()
    @user = User.all
    @re = @post.id
    @comments = Comment.all.where(post_id: @re).order(:created_at)
    @files = PostAttachment.all.where(post_id: @re)
    @likes = (UserLikePost.all.where(post_id: @re).where(like: true)).length
    @dislikes = (UserLikePost.all.where(post_id: @re).where(like: false)).length
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params.merge(:user_id => current_user.id))
    @post.open = true
    @post.dumpster = false
    @post.deleted = false
    @post.solved = false
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update 
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.delete
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def likes
    @pos23 = params[:post]
    #revisar si el usuario ya dio like o dislike, si no ha dado a ninguno, nueva instancia de like
    #si ya existia cambiar el boolean al contrario
    @val = UserLikePost.find_by(user_id: current_user.id, post_id: @pos23)
    if @val != nil
      if @val.like 
        flash[:failure] = "Already Liked"
      else
        @val.update(like: true)
      end
    else
      #UserLikePost.create!(user_id: current_user.id, like: true, post_id: :this)
      Post.find(@pos23).user_like_posts.create!(user_id: current_user.id, like: true, post_id: @pos23)
    end
    redirect_to Post.find(@pos23)
  end 

  def dislikes
    #idem al anterior
    @pos32 = params[:post]
    @val = UserLikePost.find_by(user_id: current_user.id, post_id: @pos32)
    if @val != nil
      if !@val.like 
        flash[:failure] = "Already Disliked"
      else
        @val.update(like: false)
      end
    else
      UserLikePost.create(user_id: current_user.id, like: false, post_id: @pos32)
    end
    redirect_to Post.find(@pos32)
  end
  
  def commentLike
    @pos = params[:comment]
    @pos1 = params[:post]
    #revisar si el usuario ya dio like o dislike, si no ha dado a ninguno, nueva instancia de like
    #si ya existia cambiar el boolean al contrario
    @val = UserLikeComment.find_by(user_id: current_user.id, comment_id: @pos)
    if @val != nil
      if @val.like 
        flash[:failure] = "Already Liked"
      else
        @val.update(like: true)
      end
    else
      UserLikeComment.create(user_id: current_user.id, like: true, comment_id: @pos)
    end
    redirect_to Post.find(@pos1)
  end
  
  def commentDisLike
    #
    @pos1 = params[:post]
    @pos = params[:comment]
    @val = UserLikeComment.find_by(user_id: current_user.id, comment_id: @pos)
    if @val != nil
      if !@val.like 
        flash[:failure] = "Already Disliked"
      else
        @val.update(like: false)
      end
    else
      UserLikeComment.create(user_id: current_user.id, like: false, comment_id: @pos)
    end
    redirect_to Post.find(@pos1)
  end

  def hideComment
    #check if
    @pos1 = params[:post]
    if current_user.admin
      com = params[:comment]
      Comment.find_by(id: com).update(visible: false)
    else
      flash[:success] = "No tienes los permisos necesarios para realizar esta accion"
    end
    redirect_to Post.find(@pos1)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :description, :location, :solved, :open, :dumpster, :deleted, postimages: [], files: [])
    end
    
end
