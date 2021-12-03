def usage
  STDERR.puts "Usage: #{ARGV[0]} [-p1|-p2]"
end

def read_data
  File.read(ARGV[0]).split("\n")
end

def part1(data)
  gamma = data.
    map{|str| str.split("")}. # split each binary number into an array of bits
    transpose. # turn our NxM 2D array into an MxN one
    map{|arr| arr.max_by{|d| arr.count(d)}}. # find the most common value for each bit
    join(""). # join all the most common values into a single string
    to_i(2) # parse our bitstring into an integer

  epsilon = gamma ^ ("111111111111".to_i(2)) # invert gamma's bits to find epsilon

  puts gamma, epsilon, gamma*epsilon
end

def part2(data)
  new_data = data.each_cons(3).map{|a, b, c| a+b+c}
  part1(new_data)
end

if ARGV.length != 2
  usage
  exit
end

if ARGV[1] == "-p1"
  part1(read_data)
elsif ARGV[1] == "-p2"
  part2(read_data)
else
  usage
  exit
end
