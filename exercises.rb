class Knapsack
  attr_accessor :weight, :value, :items
  def initialize weight:, value:, items: []
    @weight = weight
    @value = value
    @items = items
  end
end

def knapsack total_weight, items
  array = [Knapsack.new(weight: 0, value: 0)]

  items.each_with_index do |item, i|
    # possible_outcomes = array.map do |outcome|
    #   new_outcome = Knapsack.new(
    #     weight: outcome.weight + item.weight,
    #     value: outcome.value + item.value,
    #     items: outcome.items + [i]
    #   )
    #
    #   new_outcome.weight < total_weight ? new_outcome : outcome
    # end
    # 
    # array.push(possible_outcomes.max_by(&:value))
  end

  array[-1]
end

items = []
10.times do
  items.push(Knapsack.new(weight: rand(10) + 1, value: rand(20 + 1)))
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
