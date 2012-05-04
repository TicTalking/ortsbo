require 'nokogiri'
require 'json'
require 'net/http'
require 'ortsbo'

desc "updating the list of Ortsbo supported languages"
task :update_languages do |t, args|
  response = Net::HTTP.get_response('ortsboapi.cloudapp.net', '/REST/GetLanguages')
  result = JSON.parse response.body
  languages = result.map {|r| Ortsbo::Language.new r["EnglishName"], r["NativeName"], r["Lang3Code"]}
    .sort_by(&:english_name)
  puts "Retrieved #{languages.count} languages"
  file_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'data', 'languages.yml'));
  File.open(file_path, 'w') do |io|
    Psych.dump(languages, io)
  end
  puts "done updating #{file_path}"
end

desc "translating text"
task :translate, :api_key, :text, :from, :to do |t, args|
  Ortsbo::API_KEY = args[:api_key]
  puts Ortsbo.translate args[:text], args[:from], args[:to]
end

