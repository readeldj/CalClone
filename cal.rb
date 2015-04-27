#!/usr/bin/env ruby

require_relative "lib/month"

month = ARGV[0]
year = ARGV[1]
year_num = year.to_i

@m = Month.new(month, year)
# puts m.to_s

if year_num > 1799 && year_num < 3001
  puts @m.to_s
  # puts `cal #{month} #{year}`
else
	puts "Date not in acceptable format/range"
end

