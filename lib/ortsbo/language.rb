require 'yaml'

module Ortsbo
  class Language
    attr_reader :english_name, :native_name, :code, :ietf_tag

    def initialize(english_name, native_name, code, ietf_tag)
      @english_name = english_name
      @native_name = native_name
      @code = code
      @ietf_tag = ietf_tag
    end 
  end

  SUPPORTED_LANGUAGES = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'data', 'languages.yml')))
end
