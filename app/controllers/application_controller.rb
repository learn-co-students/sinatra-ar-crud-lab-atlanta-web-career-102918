
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  #What order do these things go in



  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to "/posts"
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


  get '/show' do
    erb:index
  end

  get '/posts' do
    @posts = Post.all
  end

  get '/posts/:id' do
    @post = Post.all.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.all.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.all.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.all.find(params[:id])
    @post.delete
    erb :delete
  end
end
