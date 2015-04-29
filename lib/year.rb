


require_relative '../lib/month'

class Year
  attr_reader :year

  def initialize(year)
    @nyear = year.to_i
  end

  def build_year_header
  	y_header = "#{@nyear}".center(63).rstrip
  	@y_header = y_header + "\n" + "\n"
  end

  def build_month_header
    @m_header_1 = "      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa" "\n"
    @m_header_2 = "       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa" "\n"
    @m_header_3 = "        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa" "\n"
    @total_months = @m_header_1 + @m_header_2 + @m_header_3
    @m_header_1
  end

  def establish_months
    @jan = Month.new(1, @nyear).build_week
    @feb = Month.new(2, @nyear).build_week
    @mar = Month.new(3, @nyear).build_week
    @apr = Month.new(4, @nyear).build_week
    @may = Month.new(5, @nyear).build_week
    @june = Month.new(6, @nyear).build_week
    @july = Month.new(7, @nyear).build_week
    @aug = Month.new(8, @nyear).build_week
    @sept = Month.new(9, @nyear).build_week
    @oct = Month.new(10, @nyear).build_week
    @nov = Month.new(11, @nyear).build_week
    @dec = Month.new(12, @nyear).build_week
    puts @jan + @feb + @mar
    puts @jan.split("\n")
    @dec
  end
end