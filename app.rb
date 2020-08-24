# frozen_string_literal: true

require 'sinatra/base'
require 'shotgun'
require_relative './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end
end
