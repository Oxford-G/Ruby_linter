require 'colorize'
require 'strscan'
require_relative 'lookup_file.rb'

class CheckError
  attr_reader :checker, :errors

  def initialize(file_path)
    @checker = ReadFile.new(file_path)
    @errors = []
    @keywords = %w[begin case class def do if module unless]
  end

  def check_trailing_spaces
    @checker.file_lines.each_with_index do |value, index|
      if value[-2] == ' ' && !value.strip.empty?
        @errors << "line:#{index + 1}:#{value.size - 1}: Error: Trailing whitespace detected."
      end
    end
  end

  def end_error
    keyw_count = 0
    end_count = 0
    @checker.file_lines.each_with_index do |value, _index|
      keyw_count += 1 if @keywords.include?(value.split(' ').first) || value.split(' ').include?('do')
      end_count += 1 if value.strip == 'end'
    end

    status = keyw_count <=> end_count
    log_error("Lint/Syntax: Missing 'end'") if status.eql?(1)
    log_error("Lint/Syntax: Unexpected 'end'") if status.eql?(-1)
  end

  def tag_error
    check_tag_error(/\(/, /\)/, '(', ')', 'Parenthesis')
    check_tag_error(/\[/, /\]/, '[', ']', 'Square Bracket')
    check_tag_error(/\{/, /\}/, '{', '}', 'Curly Bracket')
  end

  private

  # rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def check_tag_error(*args)
    @checker.file_lines.each_with_index do |value, index|
      open_p = []
      close_p = []
      open_p << value.scan(args[0])
      close_p << value.scan(args[1])

      status = open_p.flatten.size <=> close_p.flatten.size

      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{args[3]}' #{args[4]}") if status.eql?(1)
      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{args[2]}' #{args[4]}") if status.eql?(-1)
    end
  end

  def log_error(error_msg)
    @errors << error_msg
  end
end
