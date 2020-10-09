# method to pick random elements from an array
module Methods
  def self.rand_string(array)
    array[rand(array.size)]
  end
end
