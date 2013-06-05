#!/usr/local/bin/ruby -w

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?


def isPrime (input)
  b_prime = true
  for i in 2..Math.sqrt(input)
    if input%i == 0
      b_prime = false
      break
    end
  end
end


def solve (input) 
  # initialize variables
  prime_limit = Math.sqrt(input).floor # prime factor can't be greater than this

  if input%2 == 0
    return 2
  else
    output = (input%3) == 0 ? 3 : 5

    (6..prime_limit).step(6) do |n|
      if input % (n+1) == 0 and isPrime(n+1) 
        output = n+1
      elsif input % (n-1) == 0 and isPrime(n-1) 
        output = n-1
      end
    end
  end

  return output
end

#Main entry point
puts solve(600851475143)