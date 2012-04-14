require 'bundler'
require 'net/http'
require 'liquid'
require 'sass'
Bundler.require

# CSS running through SCSS
get '/css/*.css' do
	content_type 'text/css', :charset => 'utf-8'
	scss params[:splat].join.to_sym, :style => :compressed
end

get '/' do
  	liquid :index, :locals => { :name => 'world' }
end
