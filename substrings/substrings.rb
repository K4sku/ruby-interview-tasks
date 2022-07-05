def share_substrings?(string1, string2)
  (string1.delete(' ').chars & string2.delete(' ').chars).any?
end

should_ret_false1 = %w[Hello hi]

should_ret_true1 = ['Star Wars', 'Star Trek']

puts share_substrings?(should_ret_false1[0], should_ret_false1[1])
puts share_substrings?(should_ret_true1[0], should_ret_true1[1])
