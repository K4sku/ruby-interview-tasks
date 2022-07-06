def nth_prime(n)
  primes = [2]
  tested_number = 3
  until primes.length == n
    prime = true
    # half_of_tested_number = tested_number / 3
    half_of_tested_number = Math.sqrt(tested_number).to_int
    primes.each do |known_lower_prime|
      prime = !(tested_number % known_lower_prime).zero?
      break unless prime
      break if known_lower_prime > half_of_tested_number
    end
    primes << tested_number if prime
    tested_number += 2
  end
  primes.last
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

def using_ruby_features2(n)
  prime_generator = Prime::TrialDivisionGenerator.new
  prime = 0
  (1..n).each do
    prime = prime_generator.next
  end
  prime
end

def eratosthenes_sieve(n)
  Prime::EratosthenesSieve.instance.get_nth_prime(n - 1)
end

testing = 12
puts "#{testing}. prime: Custom #{nth_prime(testing)} || Prime::EratosthenesGenerator #{using_ruby_features(testing)} || Prime::TrialDivisionGenerator #{using_ruby_features2(testing)}"
puts eratosthenes_sieve(testing)
testing = 12_112
puts "#{testing}. prime: Custom #{nth_prime(testing)} || Prime::EratosthenesGenerator #{using_ruby_features(testing)} || Prime::TrialDivisionGenerator #{using_ruby_features2(testing)}"
puts eratosthenes_sieve(testing)
testing = 52_321
puts "#{testing}. prime: Custom #{nth_prime(testing)} || Prime::EratosthenesGenerator #{using_ruby_features(testing)} || Prime::TrialDivisionGenerator #{using_ruby_features2(testing)}"
puts eratosthenes_sieve(testing)
require 'benchmark'

Benchmark.bmbm do |run|
  run.report('Custom:') { nth_prime(10_001) }
  run.report('Prime::EratosthenesGenerator:') { using_ruby_features(10_001) }
  run.report('Prime::TrialDivisionGenerator:') { using_ruby_features2(10_001) }
  run.report('Gludek prime') { gludek_prime(10_001) }
  run.report('EratosthenesSieve') { eratosthenes_sieve(10_001) }
end
