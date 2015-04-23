#!/usr/local/bin/ruby -w

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome(input)
  s_in = input.to_s
  return s_in == s_in.reverse
end

def find_factors(min_digits, input)
  min_factor = 10 ** (min_digits-1)
  max_factor = (10 ** (min_digits)) - 1
  factor_range = min_factor..max_factor

  factor_range.each do |n|
    remainder = input % n
    if remainder && (input/n).between?(min_factor, max_factor)
      return n, input/n
    end
  end

  return -1, -1
end


num_dig = 3
max_output = 999 * 999
min_output = 100 * 100

(min_output..max_output).to_a.reverse.first(10000).each do |e|
  if palindrome(e)
    puts "is #{e} palindrome? #{palindrome(e) == true ? "YES" : "NO"}"
    factors = find_factors(num_dig, e)
    if factors.uniq.first != -1
      puts "\tfactor1: #{factors[0]}, factor2: #{factors[1]}"
    end
  end
end
