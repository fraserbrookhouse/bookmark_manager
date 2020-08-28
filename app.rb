# frozen_string_literal: true

require 'sinatra/base'
require 'shotgun'
require_relative './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(
      id: params[:id],
      title: params[:title],
      url: params[:url]
    )
    redirect('/bookmarks')
  end
end
