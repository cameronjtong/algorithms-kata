class TrieNode
  attr_reader :children

  def initialize
    @children = {}
  end
end

class Trie
  attr_reader :root

  def initialize
    @root = TrieNode.new
  end

  def autocomplete(prefix)
    current_node = search(prefix)
    collect_all_words(current_node) if current_node
  end

  def collect_all_words(node = nil, word = "", words = [])
    current_node = node || root

    current_node.children.each do |key, child_node|
      if key == "*"
        words.append(word)
      else
        collect_all_words(child_node, word + key, words)
      end
    end
    words
  end

  def insert(string)
    current_node = root

    string.each_char do |char|
      if current_node.children[char]
        current_node = current_node.children[char]
      else
        new_node = TrieNode.new
        current_node.children[char] = new_node
        current_node = new_node
      end
    end
    current_node.children["*"] = nil
  end

  def search(string)
    current_node = root

    string.each_char do |char|
      if current_node.children[char]
        current_node = current_node.children[char]
      else
        return nil
      end
    end
    current_node
  end
end
