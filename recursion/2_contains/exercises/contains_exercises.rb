def contains?(hash, search_value)
  # Write a method that recursively searches for a value in a nested hash.
  # It should return `true` if the object contains that value.
  #
  # Examples:
  # contains?({ foo: { bar: "baz" } }, "baz") # true
  # contains?({ foo: { bar: "baz" } }, "egg") # false
  
  hash.each_value do |value|
    #require "pry-byebug"; binding.pry if search_value.is_a?(String) and value.is_a?(String)
    if value.is_a?(Hash)
      return true if contains?(value, search_value)
    end
    return true if value == search_value
  end
  return false
end
