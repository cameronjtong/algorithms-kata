class Vertex
  attr_reader :value, :adjacent_vertices

  def initialize(value)
    @value = value
    @adjacent_vertices = []
  end

  def add_adjacent_vertex(vertex)
    return if adjacent_vertices.include?(vertex)

    adjacent_vertices << vertex
    vertex.add_adjacent_vertex(self)
  end
end

def depth_first_search(vertex, search_value, visited_vertices = {})
  return vertex if vertex.value == search_value

  visited_vertices[vertex] = true

  vertex.adjacent_vertices.each do |adjacent_vertex|
    next if visited_vertices[adjacent_vertex]

    return adjacent_vertex if adjacent_vertex.value == search_value

    vertex_were_searching_for =
      depth_first_search(adjacent_vertex, search_value, visited_vertices)

    return vertex_were_searching_for if vertex_were_searching_for
  end
  nil
end

def breadth_first_search(starting_vertex, search_value)
  queue = Queue.new
  return starting_vertex if starting_vertex.value == search_value

  visited_vertices = {}
  visited_vertices[starting_vertex.value] = true
  queue.push(starting_vertex)

  until queue.empty?
    current_vertex = queue.pop

    current_vertex.adjacent_vertices.each do |adjacent_vertex|
      next if visited_vertices[adjacent_vertex.value]
      return adjacent_vertex if adjacent_vertex.value == search_value

      visited_vertices[adjacent_vertex.value] = true

      queue.push(adjacent_vertex)
    end
  end
  nil
end
