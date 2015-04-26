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

  def zellers(month, year)
  	q = 1 #day of the month

  	if month < 3
  		month = month + 12
  		year = year - 1
  	end

    m = month #month (3 = March, 4 = April, 5 = May, ..., 14 = February)
  	k = year % 100 #year of the century
  	j = year / 100 #zero-based century

	  # h = #day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
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