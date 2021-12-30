require_relative "javascript_linter"

RSpec.describe Linter do
  context "#lint" do
    it "returns true for correct brace usage" do
      text = "() => {[valid javascript]}"

      actual = Linter.new.lint(text)

      expect(actual).to be true
    end

    it "handles no opening brace" do
      text = ") => {}"
      expected = ") does not have an opening brace"

      actual = Linter.new.lint(text)

      expect(actual).to eq(expected)
    end

    it "handles mismatched braces" do
      text = "() => [}"
      expected = "} has mismatched opening brace: ["

      actual = Linter.new.lint(text)

      expect(actual).to eq(expected)
    end
  end
end
