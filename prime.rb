# Uses the sieve of eratosthenes to decide whether a number is prime
def prime?(number)
  if number < 2
    return false
  end
  # sieve of erasthenes
  root_ceil = Math.sqrt(number).ceil
  #         0      1      2     3     4      5     init rest to true
  candidate_primes= [false, false, true, true, false, true, *Array.new([root_ceil - 5, 0].max, true)]
  if number <= 5 # how many we are initializing the sieve with
    return candidate_primes[number]
  end
  candidate_primes.each_with_index do |candidate, index|
    if !candidate
      next
    else
      if number % index == 0
        return false
      else
        # update multiples of the (known prime) candidate, starting at the square of the candidate
        x = index ** 2
        until !candidate_primes[x] do
          candidate_primes[x] = false
          x += index
        end
      end
    end
  end
  true
end
