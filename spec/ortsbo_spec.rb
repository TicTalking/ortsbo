require 'ortsbo'

describe Ortsbo do
  it 'returns all supported languages' do
    Ortsbo::LANGUAGES.count.should eq 53
  end

  it 'finds language by IETF tag' do
    Ortsbo::Language.find('zh-TW').english_name.should eq 'Chinese (Traditional)'
  end

  it 'finds code by IETF tag' do
    Ortsbo::Language.code_by_ietf_tag('zh-CN').should eq 'zhs'
  end
end