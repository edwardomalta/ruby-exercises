def permutations(array)
  # Write a method that takes in an array of integers and returns an array of
  # all possible permutations of the original array. The permutations of a set
  # are the different ways the elements can be arranged.
  #
  # For simplicity, the integers are guaranteed to not repeat.
  #
  # Examples:
  # `permutations([1, 2, 3])` has six different permutation  (or ways the elements can be arranged)
  #  it should return `[[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]`
  #
  # `permutations([])` returns `[[]]`, as there's only one arrangement of an empty set
  #
  # NOTE: the tests do not check for ordering, so a return of `[[1, 2], [2, 1]]`
  # will be treated the same as `[[2, 1], [1, 2]]`
  result = []
  if array.length <= 1
    result.push(array)
    return result
  end
  
  if array.length == 2
    array.each_with_index do |item, index|
      copy = array.dup
      copy.delete_at(index)
      new_array = [item] + copy
      result.push(new_array)
    end
  end

  if array.length > 2
    array.each_with_index do |item, index|
      copy = array.dup
      copy.delete_at(index)
      
      list_of_results = permutations(copy)

      list_of_results.each do |permutation|
        #require "pry-byebug"; binding.pry
        result.push([item] + permutation)
      end
    end
  end
  return result
end
