def nth_prime(n)
  primes = []
  i = 2
  until primes.length == n
    puts "Test number i: #{i}"
    not_prime = false
    (2..(i - 1)).each do |j|
      puts "#{i} % #{j} = #{i % j}"
      not_prime = true if (i % j).zero?
      break if not_prime
    end
    primes << i unless not_prime
    i += 1
  end
  primes
end

require 'prime'

def using_ruby_features(n)
  prime_generator = Prime::EratosthenesGenerator.new
  prime = 0
  (1..n).each do
    prime = prime_generator.next
  end
  prime
end

# puts nth_prime(10_001).inspect
puts using_ruby_features(10_001)
