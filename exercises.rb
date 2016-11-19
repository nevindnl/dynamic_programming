require_relative "matrix"

# item is hash with weight, value
def knapsack total_weight, items
  weights = (1..total_weight).to_a
  matrix = DPMatrix.new(items, weights)

  items.each_with_index do |item, i|
    weights.each_with_index do |_, j|
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

def closest_sequence seq1, seq2
  matrix = DPMatrix.new(seq1, seq2)

  (0...seq1.length).each do |i|
    matrix[i + 1][i + 1] = (0..i)
      .map{|j| (seq1[j] - seq2[j]).abs}
      .reduce(:+)

    (i + 1...seq2.length).each do |j|
      matrix[i + 1][j + 1] = [
        matrix[i + 1][j],
        matrix[i][j] + (seq1[i] - seq2[j]).abs
      ].min
    end
  end

  matrix[-1][-1]
end
