
class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
  end

  def name
    month_name = ["Months", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @name = month_name[@month]
  end

  def size
    month_size_array = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if @month == 2
      if @year%4 == 0 && @year%100 != 0
        @size = 29
      elsif @year%4 == 0 && @year%100 == 0 && @year%400 == 0
        @size = 29
      else
        @size = 28
      end
    else
      @size = month_size_array[@month]
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
    size()
    zellers()
    week = String.new(str="")
    a_month_array1 = [" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9"]
    a_month_array2 = (10..@size).to_a

    if @day == 2 #Mon
      a_month_array1.unshift("  ")
    elsif @day == 3 #Tue
      a_month_array1.unshift("  ", "  ")
    elsif @day == 4 #Wed
      a_month_array1.unshift("  ", "  ", "  ")
    elsif @day == 5 #Thur
      a_month_array1.unshift("  ", "  ","  ","  ")
    elsif @day == 6 #Fri
      a_month_array1.unshift("  ", "  ", "  ", "  ", "  ")
    elsif @day == 0 #Sat
      a_month_array1.unshift("  ", "  ", "  ", "  ", "  ", "  ")
    end

    a_month_array1 = a_month_array1 + a_month_array2
    a_month_array1 = a_month_array1.each_slice(7).to_a
    a_month_array1.each do |value|
      week << value.join(" ")
      week << "\n"
    end
    @week = week
  end

  def to_s
    build_week()
    week_header = "Su Mo Tu We Th Fr Sa"
    m_header = "#{name} #{year}".center(20).rstrip
    @month_result = m_header + "\n" + week_header + "\n" + @week + "\n"
  end
  @month_result
end
