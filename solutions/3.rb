answerArr = [ 2 ]
( 3..20 ).select do | n |
  (answerArr.each).select do | m |
    if ( n % m == 0 ) then n /= m end
  end
  if n > 1 then answerArr.push( n ) end
end
puts answerArr.inject( :* )
