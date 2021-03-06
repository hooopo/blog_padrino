# -*- encoding : utf-8 -*-
Blog.controllers :posts do
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index, :provides => [:html, :atom] do
    @posts = Post.all(:order => "created_at desc")
    render "posts/index"
  end

  get :show, :map => "/posts/:id" do
    @post = Post.find(params[:id])
    render "posts/show"
  end

end
