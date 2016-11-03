class DPMatrix
  def initialize arr1, arr2, default = 0
    @arr1, @arr2 = arr1, arr2
    @store = Array.new(arr1.length + 1){Array.new(arr2.length + 1){default}}
  end

  def [] i, j = nil
    j.nil? ? @store[i] : @store[i][j]
  end

  def []= i, j, val
    @store[i][j] = val
  end

  def to_s
    "      " + @arr2.join("   ") + "\n" +
    @store.map.with_index do |row, i|
      j = i == 0 ? " " : @arr1[i]
      j + row.to_s
    end.join("\n")
  end
end

class StringMatrix < DPMatrix
  def initialize s1, s2
    super(s1.chars, s2.chars, '')
  end
end
