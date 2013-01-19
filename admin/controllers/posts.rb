# -*- encoding : utf-8 -*-
Admin.controllers :posts do
  before do
    settings.breadcrumbs.reset
    settings.breadcrumbs.add :post, url(:posts, :index), :post
  end

  get :index do
    @posts = Post.all
    render 'posts/index'
  end

  get :new do
    settings.breadcrumbs.add :post_new , url(:posts, :new), :new
    @post = Post.new
    render 'posts/new'
  end

  post :create do
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      params[:save_and_continue] ? redirect(url(:posts, :index)) : redirect(url(:posts, :edit, :id => @post.id))
    else
      render 'posts/new'
    end
  end

  get :edit, :with => :id do
    settings.breadcrumbs.add :post_edit, params[:id],  :edit
    @post = Post.find(params[:id])
    if @post
      render 'posts/edit'
    else
      halt 404
    end
  end

  put :update, :with => :id do
    @post = Post.find(params[:id])
    if @post
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        params[:save_and_continue] ? redirect(url(:posts, :index)) : redirect(url(:posts, :edit, :id => @post.id))
      else
        render 'posts/edit'
      end
    else
      halt 404
    end
  end

  delete :destroy, :with => :id do
    post = Post.find(params[:id])
    if post
      if post.destroy
        flash[:notice] = 'Post was successfully destroyed.'
      else
        flash[:error] = 'Unable to destroy Post!'
      end
      redirect url(:posts, :index)
    else
      halt 404
    end
  end

  delete :delete_multiple do
    unless params[:post_ids]
      flash[:error] = 'You must select at least one post '
      redirect(url(:posts, :index))
    end
    posts = Post.find(params[:post_ids])
    if Post.destroy posts
      flash[:notice] = 'posts have been successfully destroyed.'
    end
    redirect url(:posts, :index)
  end
end
