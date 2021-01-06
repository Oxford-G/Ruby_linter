require_relative '../lib/lookup_file.rb'

describe ReadFile do
  before(:all) do
    @client = ReadFile.new('test.rb')
  end

  it { @client.should respond_to :file_lines }
  it { @client.should respond_to :err_msg }
end
