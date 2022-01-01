require_relative "trie"

RSpec.describe TrieNode do
  it "creates the correct state" do
    node = TrieNode.new

    expect(node).to have_attributes(children: {})
  end
end

RSpec.describe Trie do
  it "inserts a word" do
    name = "Cam"
    trie = Trie.new

    trie.insert(name)

    expect(trie.root.children).to include("C")
    expect(trie.root.children["C"].children).to include("a")
  end

  it "collects all words" do
    names = %w[Cam Nicki Mika Sean]
    trie = Trie.new
    names.each { |name| trie.insert(name) }

    actual = trie.collect_all_words

    expect(actual).to match_array(names)
  end

  it "autocompletes based on a prefix" do
    names = %w[Cam Nicki Mika Sean]
    trie = Trie.new
    names.each { |name| trie.insert(name) }

    actual = trie.autocomplete("Se")

    expect(actual).to match_array(["an"])
  end
end
