require 'sinatra'
require File.join(File.dirname(__FILE__), 'fetcher')

get '/' do
	haml :newhomepage
end

post '/user-badges' do
	@commit_data = fetch_data(params[:gname] || "murtuzakz")
	haml :badges
end