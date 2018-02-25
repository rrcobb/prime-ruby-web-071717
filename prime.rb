# Add  code here!
def prime?(number)
  if number < 2
    return false
  end
  # sieve of erasthenes
  root_ceil = Math.sqrt(number).ceil
  #         0      1      2     3     4      5     init rest to true
  primes = [false, false, true, true, false, true, *Array.new([root_ceil - 5, 0].max, true)]
  if number <= 5 # how many we are initializing the sieve with
    return primes[number]
  end
  primes.each_with_index do |candidate, index|
    if !candidate
      next
    else
      if number % index == 0
        return false
      else
        # update multiples of the (known prime) candidate, starting at the square of the candidate
        x = index ** 2
        until !primes[x] do
          primes[x] = false
          x += index
        end
      end
    end
  end
  true
end
