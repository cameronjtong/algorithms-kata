require_relative "graph"

RSpec.describe Vertex do
  it "has the correct state" do
    vertex = Vertex.new(nil)

    expect(vertex).to have_attributes(value: nil, adjacent_vertices: [])
  end

  it "can add adjacent vertices" do
    vertex = Vertex.new(nil)
    adjacent_vertex = Vertex.new(1)

    vertex.add_adjacent_vertex(adjacent_vertex)

    expect(vertex.adjacent_vertices).to include(adjacent_vertex)
  end
end

RSpec.describe "search" do
  it "finds the correct vertex with dfs" do
    searched_vertex = Vertex.new(3)
    root = Vertex.new(1)
    root.add_adjacent_vertex(searched_vertex)

    actual = depth_first_search(root, 3)

    expect(actual).to be(searched_vertex)
  end

  it "finds the correct vertex with bfs" do
    searched_vertex = Vertex.new(3)
    root = Vertex.new(1)
    root.add_adjacent_vertex(searched_vertex)

    actual = breadth_first_search(root, 3)

    expect(actual).to be(searched_vertex)
  end
end
