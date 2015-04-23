#!/usr/local/bin/ruby -w

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


def prune_factors(factors)
  factors.delete(1)
  factors.reverse_each do |factor|
    index = factors.index(factor)
    multiples = factors.select {|e| e > factor && (e%factor == 0)}
    # puts "factor: #{factor}, index: #{index}, factors: #{factors}, multiples: #{multiples}"
    if multiples.length > 0
      # puts "POP!"
      factors.delete_at(index)
    end
  end

  return factors
end


def find_gcd(a,b)
  while b != 0
    t = b
    b = a % b
    a = t
  end

  return a
end


def find_lcm(a,b)
  return (a * b) / find_gcd(a, b)
end


def solve(factors)
  factors = prune_factors(factors)
  puts "factors: #{factors}"

  lcm = 0
  factors.each do |f|
    if lcm == 0
      lcm = f
      next
    end

    lcm = find_lcm(lcm, f)
  end

  return lcm
end

puts solve((1..20).to_a)