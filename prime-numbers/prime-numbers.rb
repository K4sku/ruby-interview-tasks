def nth_prime(n)
  last_prime = 2
  last_prime_index = 1
  tested_number = 3
  until last_prime_index == n
    # puts "Test number i: #{tested_number}"
    prime = true
    (2..(tested_number / 3)).each do |j|
      # puts "#{tested_number} % #{j} = #{tested_number % j}"
      prime = !(tested_number % j).zero?
      break unless prime
    end
    if prime
      last_prime = tested_number
      last_prime_index += 1
      # puts "############################### #{last_prime_index} : #{last_prime} ###############################"
    end
    tested_number += 2
  end
  last_prime
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

# puts nth_prime(10_001)
# puts using_ruby_features(10_001)

require 'benchmark'

testing = 1111
Benchmark.bmbm do |run|
  run.report { nth_prime(testing) }
  run.report { using_ruby_features(testing) }
end
