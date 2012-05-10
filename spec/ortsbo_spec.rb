require 'ortsbo'

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
end