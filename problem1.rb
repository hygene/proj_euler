#!/usr/local/bin/ruby -w

# Project Euler problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000


def solve (input)
  output = 0
  mult_five = 5
  curr_val = 3

  while curr_val < input
    if curr_val > mult_five
      output += mult_five
      mult_five += 5
    elsif curr_val == mult_five
      mult_five += 5
    end

    output += curr_val
    curr_val += 3
  end

  return output
end

#Main entry point
puts solve(1000)
