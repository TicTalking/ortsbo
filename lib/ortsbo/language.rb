require 'yaml'

module Ortsbo
  class Language
    attr_reader :english_name, :native_name, :code

    def initialize(options)
      @english_name = options[:english_name]
      @native_name = options[:native_name]
      @code = options[:code]
    end 
  end

  SUPPORTED_LANGUAGES = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'data', 'languages.yml')))
end
