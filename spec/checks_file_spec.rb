require_relative '../lib/check_file.rb'

describe CheckError do
  let(:checker) { CheckError.new('test.rb') }

  describe '#check_trailing_spaces' do
    it 'should return trailing space error on line 3' do
      checker.check_trailing_spaces
      expect(checker.errors[0]).to eql('line:3:20: Error: Trailing whitespace detected.')
    end
  end

  describe '#tag_error' do
    it "returns missing/unexpected tags eg '( )', '[ ]', and '{ }'" do
      checker.tag_error
      expect(checker.errors[0]).to eql("line:3 Lint/Syntax: Unexpected/Missing token ']' Square Bracket")
    end
  end

  describe '#end_error' do
    it 'returns missing/unexpected end' do
      checker.end_error
      expect(checker.errors[0]).to eql("Lint/Syntax: Missing 'end'")
    end
  end
end
