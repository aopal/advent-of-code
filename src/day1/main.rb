def usage
  STDERR.puts "Usage: #{ARGV[0]} [-p1|-p2]"
end

def read_data
  File.read(ARGV[0]).split("\n").map(&:to_i)
end

def part1(data)
  puts data.each_cons(2).map{|a, b| 1 if a < b}.compact.reduce(&:+)
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
