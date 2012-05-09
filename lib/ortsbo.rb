require 'ortsbo/language'

module Ortsbo
  def self.translate(text, from_lang, to_lang)
    return nil unless from_lang && to_lang && from_lang != to_lang
    from_lang = Language.code_by_ietf_tag from_lang
    to_lang = Language.code_by_ietf_tag to_lang
    uri = URI("http://ortsboapi.cloudapp.net/REST/TranslateBody?devkey=#{API_KEY}&fromlang=#{from_lang}&tolang=#{to_lang}")
    req = Net::HTTP::Post.new(uri.to_s)
    req.body = text
    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request req
    end
    case res
      when Net::HTTPSuccess
        decoded_response = JSON.parse res.body
        decoded_response['Status'] == 1 ? decoded_response['TranslatedText'] : nil
      else
        nil
    end
  end
end