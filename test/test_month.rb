require_relative 'helper'
require_relative '../lib/month'

class TestMonth < Minitest::Test
  def test_initializing_a_month_saves_month
    m = Month.new(05, 2015)
    assert_equal 05, m.month
  end

  def test_initializing_a_month_saves_year
    m = Month.new(05, 2015)
    assert_equal 2015, m.year
  end

  def test_to_s_on_jan_2012
    m = Month.new(01, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_jan_2017
    m = Month.new(01, 2017)
    expected = <<EOS
    January 2017
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_mar_2009
    m = Month.new(03, 2009)
    expected = <<EOS
     March 2009
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_name_for_march
  	m = Month.new(03, 2009)
  	assert_equal m.name, "March"
  end

  def test_name_for_january
  	m = Month.new(01, 2009)
  	assert_equal m.name, "January"
  end

  def test_name_for_december
  	m = Month.new(12, 2009)
  	assert_equal m.name, "December"
  end

  def test_zellers_for_0_Saturday
  	#Jan 1 2000
  	expected = 0
  	test = Month.new(01, 2000)
  	result = test.zellers#(01, 2000)
  	assert_equal expected, result
  end

  def test_zellers_for_4_Wednesday
  	#Mar 1 2000
  	expected = 4
  	test = Month.new(03, 2000)
  	result = test.zellers#(03, 2000)
  	assert_equal expected, result
  end

  def test_zellers_for_6_Friday
  	#Feb 7 1812
  	expected = 0
  	test = Month.new(02, 1812)
  	result = test.zellers#(02, 1812)
  	assert_equal expected, result
  end

  def test_how_many_days_in_January
  	test = Month.new(01, 2009)
  	expected = 31
  	result = test.size
  	assert_equal expected, result
  end

  def test_how_many_days_in_March
  	test = Month.new(03, 2900)
  	expected = 31
  	result = test.size
  	assert_equal expected, result
  end

  def test_how_many_days_in_June
  	test = Month.new(06, 2900)
  	expected = 30
  	result = test.size
  	assert_equal expected, result
  end

  def test_how_many_days_in_November
  	test = Month.new(11, 1960)
  	expected = 30
  	result = test.size
  	assert_equal expected, result
  end

  def test_is_it_a_leap_year_1895
    test = Month.new(02, 1895)
    expected = 28
    result = test.size
  	assert_equal expected, result
  end

  def test_is_it_a_leap_year_1896
    test = Month.new(02, 1896)
    expected = 29
    result = test.size
  	assert_equal expected, result
  end

  def test_is_it_a_leap_year_1900
    test = Month.new(02, 1900)
    expected = 28
    result = test.size
  	assert_equal expected, result
  end

  def test_is_it_a_leap_year_2000
    test = Month.new(02, 2000)
    expected = 29
    result = test.size
  	assert_equal expected, result
  end

#   def test_build_1st_week_at_Sunday
#   	test = Month.new(01, 2017)
#   	result = test.build_week
#     expected = <<EOS
#  1  2  3  4  5  6  7
# EOS
#     assert_equal expected, result
#   end

#   def test_build_1st_two_weeks_at_Sunday
#   	test = Month.new(01, 2017)
#   	result = test.build_week
#     expected = <<EOS
#  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# EOS
#     assert_equal expected, result
#   end

#   def test_build_1st_three_weeks_at_Sunday
#   	test = Month.new(01, 2017)
#   	result = test.build_week
#     expected = <<EOS
#  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# 15 16 17 18 19 20 21
# EOS
#     assert_equal expected, result
#   end

#   def test_build_1st_four_weeks_at_Sunday
#   	test = Month.new(01, 2017)
#   	result = test.build_week
#     expected = <<EOS
#  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# 15 16 17 18 19 20 21
# 22 23 24 25 26 27 28
# EOS
#     assert_equal expected, result
#   end


  def test_build_31_day_month_starting_at_Sunday
  	test = Month.new(01, 2017)
  	result = test.build_week
    expected = <<EOS
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOS
    assert_equal expected, result
  end

  def test_build_31_day_month_starting_at_Monday
  	test = Month.new(12, 2014)
  	result = test.build_week
    expected = <<EOS
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31
EOS
    assert_equal expected, result
  end

  def test_build_31_day_month_starting_at_Tuesday
  	test = Month.new(07, 2014)
  	result = test.build_week
    expected = <<EOS
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31
EOS
    assert_equal expected, result
  end

  def test_build_31_day_month_starting_at_Wednesday
  	test = Month.new(01, 2014)
  	result = test.build_week
    expected = <<EOS
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
EOS
    assert_equal expected, result
  end

  def test_build_30_day_month_starting_at_Thursday
  	test = Month.new(11, 2012)
  	result = test.build_week
    expected = <<EOS
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30
EOS
    assert_equal expected, result
  end

  def test_build_30_day_month_starting_at_Friday
    test = Month.new(9, 1876)
    result = test.build_week
    expected = <<EOS
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
EOS
    assert_equal expected, result
  end

  def test_build_31_day_month_starting_at_Saturday
    test = Month.new(8, 1970)
    result = test.build_week
    expected = <<EOS
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    assert_equal expected, result
  end

end

