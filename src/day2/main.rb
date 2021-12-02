def usage
  STDERR.puts "Usage: #{ARGV[0]} [-p1|-p2]"
end

def read_data
  File.read(ARGV[0]).split("\n")
end

def part1(data)
  position = {
    x: 0,
    y: 0,
  }

  data.each do |str|
    a = str.split(" ")
    dir = a[0]
    amount = a[1].to_i

    if dir == "forward"
      position[:x] += amount
    elsif dir == "down"
      position[:y] += amount
    elsif dir == "up"
      position[:y] -= amount
    end
  end

  puts position[:x] * position[:y]
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
