require 'ortsbo/language'
require 'httparty'
require 'json'
module Ortsbo
  def self.translate(text, from_lang, to_lang)
    return nil unless from_lang && to_lang && from_lang != to_lang
    from_lang = Language.code_by_ietf_tag from_lang
    to_lang = Language.code_by_ietf_tag to_lang
    text = URI.escape(text)
    res = HTTParty.get("https://ots.cloudapp.net/ots.svc/translate?from=#{from_lang}&to=#{to_lang}&input=#{text}")
    res.parsed_response["Translation"]
  end
end