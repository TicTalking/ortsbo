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

    def self.find ietf_tag
      LANGUAGES_BY_IETF_TAG[ietf_tag]
    end

    def self.english_name_by_ietf_tag ietf_tag, default=nil
      l = LANGUAGES_BY_IETF_TAG[ietf_tag]
      l ? l.english_name : default
    end

    def self.native_name_by_ietf_tag ietf_tag, default=nil
      l = LANGUAGES_BY_IETF_TAG[ietf_tag]
      l ? l.native_name : default
    end

    def self.code_by_ietf_tag ietf_tag
      l = LANGUAGES_BY_IETF_TAG[ietf_tag]
      l ? l.code : nil
    end
  end

  LANGUAGES = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'data', 'languages.yml')))

  protected

  LANGUAGES_BY_IETF_TAG = Hash[*LANGUAGES.map {|l| [l.ietf_tag, l]}.flatten]
end
