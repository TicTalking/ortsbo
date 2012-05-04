require 'psych'

module Ortsbo
  class Language
    attr_reader :english_name, :native_name, :code

    def initialize(english_name, native_name, code)
      @english_name = english_name
      @native_name = native_name
      @code = code
    end 
  end

  SUPPORTED_LANGUAGES = Psych.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'data', 'languages.yml')))
end
