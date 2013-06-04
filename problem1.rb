#!/usr/local/bin/ruby -w

# Project Euler problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000


def solve (input) 
  output = 0
  n = 1
  while (3 * n) < input
    output += (((3*n) % 5) == 0) ? 0 : (3*n) # exclude multiples of 5, those will be addressed in next loop
    n+=1
  end
  
  n = 1
  while (5 * n) < input
    output += (5*n)
    n+=1
  end
  
  return output
end

#Main entry point
puts solve(1000)