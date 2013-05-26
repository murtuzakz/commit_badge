require 'net/http'
require 'json'

GITHUB_URL = "https://github.com/users/{{username}}/contributions_calendar_data/".freeze

def fetch_data(username)
	user_link = GITHUB_URL.gsub("{{username}}",username)
	url = URI.parse(user_link)
	req = Net::HTTP::Get.new(url.path)
	res = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http|
	  http.request(req)
	}
	commit_count_array = []
	JSON.parse(res.body).each do |data|
		commit_count_array << data[1]
	end
	commit_count_array
end