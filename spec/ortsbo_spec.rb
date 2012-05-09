require 'ortsbo'

describe Ortsbo do
  it 'returns all supported languages' do
    Ortsbo::LANGUAGES.count.should eq 53
  end

  it 'finds language by IETF tag' do
    Ortsbo::Language.find_by_ietf_tag('zh-TW').english_name.should eq 'Chinese (Traditional)'
  end

  it 'finds language by code' do
    Ortsbo::Language.find_by_code('ron').english_name.should eq 'Romanian'
  end

  it 'finds code by IETF tag' do
    Ortsbo::Language.code_by_ietf_tag('zh-CN').should eq 'zhs'
  end

  it 'finds IETF tag by code' do
    Ortsbo::Language.ietf_tag_by_code('ita').should eq 'it'
  end
end