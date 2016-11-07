def knapsack total_weight, items
  matrix = Array.new(items.length + 1){Array.new(total_weight + 1){0}}

  items.each_with_index do |item, i|
    (0...total_weight).each do |j|
      weight = item[:weight]
      value = item[:value]

      if j + 1 >= weight
        matrix[i + 1][j + 1] = [
          matrix[i][j + 1],
          matrix[i + 1][j + 1 - weight] + value
        ].max
      else
        matrix[i + 1][j + 1] = matrix[i][j + 1]
      end
    end
  end

  matrix[-1][-1]
end

require_relative "matrix"

def longest_common_substring s1, s2
  matrix = StringMatrix.new(s1, s2)

  s1.chars.each_with_index do |c1, i|
    s2.chars.each_with_index do |c2, j|
      matrix[i + 1, j + 1] = matrix[i, j]
      matrix[i + 1, j + 1] += c1 if c1 == c2
    end
  end

  matrix[-1].max_by(&:length)
end
