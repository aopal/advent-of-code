def part1
  puts File.read(ARGV[0]).split("\n").map(&:to_i).each_cons(2).map{|a, b| 1 if a < b}.compact.reduce(&:+)
end

def part2

end

part1
# part2
