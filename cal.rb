#!/usr/bin/env ruby

require_relative "lib/month"

month = ARGV[0]
year = ARGV[1]
year_num = year.to_i

@m = Month.new(month, year)
# puts m.to_s

if month.to_i < 13 && month.to_i > 0 && year_num > 1799 && year_num < 3001
  # !!!! going to have to fix this when we start printing the year !!!!

  puts @m.to_s
else
	puts "Date not in acceptable format/range"
end

