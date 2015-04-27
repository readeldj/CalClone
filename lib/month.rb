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

  def zellers#(month, year)
  	q = 1 #day of the month

  	if @month < 3
  		month = @month + 12
  		year = @year - 1
  	else
  		month = @month
  		year = @year
  	end

    m = month #month (3 = March, 4 = April, 5 = May, ..., 14 = February)
  	k = year % 100 #year of the century
  	j = year / 100 #zero-based century

	  # h = #day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
	  h = (q + ((13 * (m + 1)) / 5).floor + k + (k / 4).floor + (j / 4).floor + (5 * j))%7
	  @day = h
	end

	def build_week

		month_size()
		zellers()
		one_sp = " "
		two_sp = "  "
		week_one = String.new(str="")
    countdown = (1..@month_size).to_a
    countdown.each do |value|
	    if @day == 1
#first week
	      if week_one.length == 0
      		week_one << one_sp
      	  week_one << value.to_s
      	elsif week_one.length > 1 && week_one.length < 20
      		week_one << two_sp
      	  week_one << value.to_s
      	elsif week_one.length == 20
      		week_one << "\n"
	      end
#second week
	      if week_one.length == 21
	        week_one << one_sp
	      	week_one << value.to_s
      	elsif week_one.length > 21 && week_one.length < 41
      		if value < 10
	        	week_one << two_sp
	      	  week_one << value.to_s
	      	elsif value > 9
	        	week_one << one_sp
	      	  week_one << value.to_s
	      	end
      	elsif week_one.length == 41
      		week_one << "\n"
	      end
#third week
	      if week_one.length == 42
	      	week_one << value.to_s
	      elsif week_one.length > 42 && week_one.length < 62
	      	week_one << one_sp
	      	week_one << value.to_s
	      elsif week_one.length == 62
      		week_one << "\n"
      	end
#fourth week
      	if week_one.length == 63
	      	week_one << value.to_s
	      elsif week_one.length > 63 && week_one.length < 83
	      	week_one << one_sp
	      	week_one << value.to_s
	      elsif week_one.length == 83
      		week_one << "\n"
      	end
#fith week
      	if week_one.length == 84
	      	week_one << value.to_s
	      elsif week_one.length > 84 && week_one.length < 105
	      	week_one << one_sp
	      	week_one << value.to_s
	      elsif week_one.length == 84
      		week_one << "\n"
      	end

	    end
	  end
	  week_one << "\n"
    # puts week_one.length
    @week_one = week_one
	end

  def to_s
  	build_week()
  	week_header = "Su Mo Tu We Th Fr Sa"
  	m_header = "#{name} #{year}".center(20).rstrip
    <<-EOS
#{m_header}
#{week_header}
#{@week_one}
EOS
  end
end

# 1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# 15 16 17 18 19 20 21
# 22 23 24 25 26 27 28
# 29 30 31