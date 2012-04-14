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

# Plain old URL with a Liquid template
get '/' do
  	liquid :index, :locals => { :name => 'world' }
end

# ERB, and routes with parameters
get '/hello/:name' do
	resp = "Hello, #{params[:name]}!"
	erb resp
end