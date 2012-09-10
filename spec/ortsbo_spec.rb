require 'ortsbo'

# Change this to your own API key if you want to run the specs
Ortsbo::API_KEY = nil

describe Ortsbo do
  it 'returns all supported languages' do
    Ortsbo::LANGUAGES.count.should eq 53
  end

  it 'finds language by IETF tag' do
    Ortsbo::Language.find('zh-TW').english_name.should eq 'Chinese (Traditional)'
  end

  it 'finds english name by IETF tag' do
    Ortsbo::Language.english_name_by_ietf_tag('zh-CN').should eq 'Chinese (Simplified)'
  end

  it 'finds native name by IETF tag' do
    Ortsbo::Language.native_name_by_ietf_tag('it').should eq 'Italiano'
  end

  it 'finds code by IETF tag' do
    Ortsbo::Language.code_by_ietf_tag('zh-CN').should eq 'zhs'
  end

  it 'Can translate string containing an ampersand' do
    result = Ortsbo.translate "Salut mon nom est Chris & j'aime biere", 'fr', 'en'
    result.should eq("Hi my name is Chris and I love beer")
  end
end
