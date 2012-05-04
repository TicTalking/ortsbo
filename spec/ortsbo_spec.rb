require 'ortsbo'

describe Ortsbo do
  it 'returns all supported languages' do
    Ortsbo::SUPPORTED_LANGUAGES.count.should eq 53
  end
end