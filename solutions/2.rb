@fibo = [1,2]

@fibo << (@fibo[-1] + @fibo[-2]) until @fibo[-1] >= 4000000

puts @fibo.select { |x| x % 2 == 0 && x < 4000000 }.inject(:+)