require 'rubygems'
require 'oauth'
require 'json'


def parse_user_response(response)
  user = nil

  # Check for a successful request
  if response.code == '200'
    # Parse the response body, which is in JSON format.
    # ADD CODE TO PARSE THE RESPONSE BODY HERE
    user =

    # Pretty-print the user object to see what data is available.
    puts "Hello, #{user["screen_name"]}!"
  else
    # There was an error issuing the request.
    puts "Expected a response of 200 but got #{response.code} instead"
  end

  user
end

# Change the following values to those provided on dev.twitter.com
# The consumer key identifies the application making the request.
# The access token identifies the user making the request.

consumer_key = OAuth::Consumer.new(
    "B9aoiy67b5hgVaTutc41xEjlM",
    "eGTVoPnaLhC4RRyyr9C07KilnvQpp5TzRMYTyxAdFCzNuKQlfH")
access_token = OAuth::Token.new(
    "966698214018740226-ePodkhWnLLW5qsIBHXyaY4exkSVTuMo",
    "zVgTq1yxxSdtyJMiFbtd7eC4T5SCthjwqai84tRVK9csj")


# All requests will be sent to this server.
baseurl = "https://api.twitter.com"

# The verify credentials endpoint returns a 200 status if
# the request is signed correctly.
address = URI("#{baseurl}/1.1/account/verify_credentials.json")

# Set up Net::HTTP to use SSL, which is required by Twitter.
http = Net::HTTP.new address.host, address.port
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Build the request and authorize it with OAuth.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token


path = '/1.1/statues/show.json'
query = URI.encode_www_form("id" => "266270116780576768")
address_status = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

def print_tweet(tweet)
  puts tweet
end

request.oauth! http, consumer_key, access_token
http.start
response = http.request request 

tweet = nil

if response.code == '200' then
  tweet = JSON.parse(response.body)
  print_tweet(tweet)
end