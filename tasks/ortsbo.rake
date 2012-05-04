require 'nokogiri'
require 'json'
require 'net/http'

desc "retrieving the list of Ortsbo supported languages"
task :get_languages do |t, args|
  response = Net::HTTP.get_response('ortsboapi.cloudapp.net', '/REST/GetLanguages')
  result = JSON.parse response.body
  result.each {|l| puts l["NativeName"].capitalize}
  puts result.count
  puts "done"
end
