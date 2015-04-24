require_relative '../lib/month'

class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def name
  	month_name = ["Months", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  	@name = month_name[@month]
  end

  def month_size
  	month_size_array = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  	if @month == 2
      if @year%4 == 0 && @year%100 != 0
      	@month_size = 29
      elsif @year%4 == 0 && @year%100 == 0 && @year%400 == 0
      	@month_size = 29
      else
  	    @month_size = 28
  	  end
  	else
  		@month_size = month_size_array[@month]
  	end
  end

  def zellers(q, m, k, j)
	  # h = #day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
	  # q = #day of the month
	  # m = #month (3 = March, 4 = April, 5 = May, ..., 14 = February)
	  # K = #year of the century (year \mod 100).
	  # J = #zero-based century (actually \lfloor year/100 \rfloor) For example, the zero-based centuries for 1995 and 2000 are 19 and 20 respectively (to not be confused with the common ordinal century enumeration which indicates 20th for both cases).
	  h = (q + ((13 * (m + 1)) / 5).floor + k + (k / 4).floor + (j / 4).floor + (5 * j))%7
	end

  def to_s
  	week = "Su Mo Tu We Th Fr Sa"
  	m_header = "#{name} #{year}".center(20, " ")
    <<-EOS
#{m_header}
#{week}
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end
end