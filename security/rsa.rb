# rsa.rb -
#  example of an RSA public/private key pair encoding system in ruby from scratch
# author: Tim Hickey
# date: June 22, 2010


# raise x to the kth power modulo n 
# and do it quickly, i.e. in b^2 steps, 
# where b=log n is the number of bits in n
# key idea here is that 
#    a^(2n) = (a^2)^n
#    a^(2n+1) = a*(a^2)^n
#    a^0 = 1

def fastexp_mod x,k,n
  if k<0
   throw :error
  elsif k==0
   1
  elsif (k%2==0)
    fastexp_mod (x*x)%n, k/2, n
  else
    x*(fastexp_mod (x*x)%n, k/2, n) % n
  end
end


# this computes the greatest common divisor of two numbers
def gcd a,b
  if a<b
   gcd b,a
  elsif b==0
   a
  else
   gcd b,a%b
  end
end

# this returns d,r,s  where d = r*a+s*b and d = gcd a,b
# which shows constructively that the gcd of a and b can be
# written as a linear combination of a and b.... we need this later
def gcd2 a,b
 if a<b
  d,s,r = gcd2 b,a
 [d,r,s]
 elsif b==0
  [a,1,0]
 else
  x=a/b
  y=a%b
  d,r,s = gcd2 b,y
 # here we know that d = r*b+s*y, and a=x*b+y, so y=a-x*b
 # thus d=r*b+s*(a-x*b) = (r-s*x)*b + s*a
 # so we return [d,s,r-s*x]
 # uncomment the following three lines to see this work out
 #  puts "#{a}=#{x}*#{b}+#{y}"
 #  puts "#{d}=#{s}*#{a} + #{(r-s*x)}*#{b}"
  [d,s,(r-s*x)]
 end
end

# this tests that the gcd2 result is correct ...
def gcd2test a,b
  d,r,s = gcd2 a,b
  z = r*a+s*b
  return z==d
end

  

# this returns the multiplicative inverse of x modulo n
# that is it returns a number r such that (r*x)%n = 1
def inv_mod x,n
  d,r,s = gcd2 x,n
  if d==1
    r % n
  else
    0
  end
end

# this tests to see if p is a prime number
# it relies on the fact that for any a in 0..p-1
#   a^(p-1)%p = 1
# and if p is not prime then this test will be true with probablity less than 0.5
# Running the test 20 times will give a false positive of less than 1/2^20, i.e.
# one in a million.
# (actually there are some rare pseudo-primes for which this test is always true!)

def rand_test p
  20.downto(0) do |i|
    a = 1+rand(p-1)
    x = fastexp_mod(a,(p-1),p)
#    puts "a=#{a} x=#{x}"
    if (x != 1)
      return false
    end
  end
  return true
end

# this generates a random prime with at least b bits
# by generating a large random number p and finding the first
# prime larger than p-1
def gen_rand b
  p = rand(2**b)+2**b-1
  while ! rand_test p
#    puts p
    p += 1
  end
  p
end

# return a factoriation [a,b] of n (i.e. a*b=n)
# or return false if no such factorization exists
# this takes time O(sqrt(n)), don't run it on numbers bigger than 1,000,000
def factor n
  d=Math.sqrt n
  i=2
  while i<d
   if n%i==0
     return [i,n/i]
   end
   i += 1
  end
  return false
end

# this generate a pubic/private key pair with at least 2*bits bits
def gen_keys bits
  x=gen_rand bits
  y=gen_rand bits
  n=x*y
  m=(x-1)*(y-1)
  e = rand(m)
  while gcd(e,m)>1
    e += 1
  end
  f= inv_mod e,m
  return [2*bits,[e,n],[f,n]]
end

# this encodes an integer x 
# using the specified rsakey
# (but note that we must have x < rsakey[1]
def encode_int rsakey, x
  e,n = rsakey
  return fastexp_mod x,e,n
end



# this converts an ASCII string to a (possibly large) integer
def string_to_int s
  d=0
  s.each_byte do |x|
    d = x + (d<<8)
  end
  d
end

# this converts an integer to a string (viewed as an array of bytes)
def int_to_string d
  a=[]
  while (d >0)
   a<< (d%256)
   d=d/256
  end
  a.reverse.pack("C*")
end

# this converts a string into an array of integers
# by grouping the characters into groups of bytes chars
def string_to_int_array s,bytes
  a=[]
  t = String.new(s)
  while t != ""
    a << string_to_int(t[0..(bytes-1)])
    t[0..(bytes-1)]=""
  end
  a
end

# this converts and array of integers into a string
def int_array_to_string a
  s=""
  a.each do |x|
   s << int_to_string(x)
  end
  s
end

# this encodes a string s into an array of integers using
# the specified key where 2^bits < key[1]
def rsa_encoder bits, key, s
  a = string_to_int_array s,bits/8
  b = a.collect do |x|
    encode_int key,x
  end
  b
end

# this decodes the array of ints into a string using the specified key
def rsa_decoder key, a
  c = a.collect do |x|
    encode_int key,x
  end
  int_array_to_string c
end


## demo - here are some tests ...
@a  = "This is a test of the bit encoder. I wonder if it will work."
puts "\nHere is the plaintext.\n"
puts @a
@k = gen_keys 100
puts "\nHere is the key\n"
puts "number of bits is "
puts @k[0]
puts "public key (e,n) is"
puts @k[1]
puts "private key (f,n) is"
puts @k[2]
@b = rsa_encoder @k[0],@k[1],@a
puts "\nHere is the encoded string\n"
puts @b
@c = rsa_decoder @k[2],@b
puts "\nHere is the decoded string\n"
puts "..."
puts @c
puts "..."

def encode s
 rsa_encoder @k[0],@k[1],s
end

def decode a
 rsa_decoder @k[2],a
end

