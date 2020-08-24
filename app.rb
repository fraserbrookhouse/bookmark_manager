# frozen_string_literal: true

require 'sinatra/base'
require 'shotgun'

class Bookmark_Manager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
end
