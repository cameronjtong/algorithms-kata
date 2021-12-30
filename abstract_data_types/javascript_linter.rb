require_relative "stacks"

class Linter
  attr_reader :stack

  def initialize
    @stack = Stack.new
  end

  def lint(text)
    text.chars.each do |char|
      if is_an_opening_brace?(char)
        stack.push(char)
      elsif is_a_closing_brace?(char)
        popped_opening_brace = stack.pop

        return "#{char} does not have an opening brace" unless popped_opening_brace

        return "#{char} has mismatched opening brace: #{popped_opening_brace}" if is_not_a_match?(popped_opening_brace, char)
      end
    end
    return "#{stack.read} has no closing brace" if stack.read

    true
  end

  private

  def is_an_opening_brace?(character)
    ["[", "(", "{"].include?(character)
  end

  def is_a_closing_brace?(character)
    ["]", ")", "}"].include?(character)
  end

  def is_not_a_match?(opening_brace, closing_brace)
    closing_brace != { "[" => "]", "(" => ")", "{" => "}" }[opening_brace]
  end
end
