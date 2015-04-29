require_relative 'helper'
require_relative '../lib/month'
require_relative '../lib/year'

class TestYear < Minitest::Test

	def test_build_year_header
    test = Year.new(2400)
    result = test.build_year_header
    expected = <<EOS
                             2400

EOS
    assert_equal expected, result
  end

  def test_build_month_header
    test = Year.new(2400)
    result = test.build_month_header
    expected = <<EOS
      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
EOS
    assert_equal expected, result
  end


  def test_year_1st_3_months
    skip
    test = Year.new(2400)
    result = test.first_3_months
    expected = <<EOS
                             2400

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1         1  2  3  4  5            1  2  3  4
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18
16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25
23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31
30 31
EOS
    assert_equal expected, result
  end

  def test_create_weeks_of_months
    test = Year.new(2400) #dec
    result = test.establish_months
    expected = <<EOS
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    assert_equal expected, result
  end


#   def test_year_400_leap
#     test = Year.new(2400)
#     result = test
#     expected = <<EOS
#                              2400

#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5            1  2  3  4
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25
# 23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31
# 30 31
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1      1  2  3  4  5  6               1  2  3
#  2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
#  9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
# 16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
# 23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
# 30
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5                  1  2
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
# 23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
# 30 31
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4                  1  2
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
# 29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
#                                             31

# EOS
#     assert_equal expected, result
#   end

#   def test_year_400_leap
#     test = Year.new(2000)
#     result = test
#     expected = <<EOS
#                              2000

#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5            1  2  3  4
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25
# 23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31
# 30 31
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1      1  2  3  4  5  6               1  2  3
#  2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
#  9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
# 16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
# 23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
# 30
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5                  1  2
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
# 23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
# 30 31
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4                  1  2
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
# 29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
#                                             31

# EOS
#     assert_equal expected, result
#   end

#   def test_year_100_non_leap
#     test = Year.new(2100)
#     result = test
#     expected = <<EOS
#                              2100

#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                 1  2      1  2  3  4  5  6      1  2  3  4  5  6
#  3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13
# 10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20
# 17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27
# 24 25 26 27 28 29 30  28                    28 29 30 31
# 31
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#              1  2  3                     1         1  2  3  4  5
#  4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12
# 11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19
# 18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26
# 25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30
#                       30 31
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#              1  2  3   1  2  3  4  5  6  7            1  2  3  4
#  4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11
# 11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18
# 18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25
# 25 26 27 28 29 30 31  29 30 31              26 27 28 29 30

#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                 1  2      1  2  3  4  5  6            1  2  3  4
#  3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11
# 10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18
# 17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25
# 24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31
# 31

# EOS
#     assert_equal expected, result
#   end

#   def test_year_normal
#     test = Year.new(2015)
#     result = test
#     expected = <<EOS
#                              2015

#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#              1  2  3   1  2  3  4  5  6  7   1  2  3  4  5  6  7
#  4  5  6  7  8  9 10   8  9 10 11 12 13 14   8  9 10 11 12 13 14
# 11 12 13 14 15 16 17  15 16 17 18 19 20 21  15 16 17 18 19 20 21
# 18 19 20 21 22 23 24  22 23 24 25 26 27 28  22 23 24 25 26 27 28
# 25 26 27 28 29 30 31                        29 30 31

#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#           1  2  3  4                  1  2      1  2  3  4  5  6
#  5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
# 12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
# 19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
# 26 27 28 29 30        24 25 26 27 28 29 30  28 29 30
#                       31
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#           1  2  3  4                     1         1  2  3  4  5
#  5  6  7  8  9 10 11   2  3  4  5  6  7  8   6  7  8  9 10 11 12
# 12 13 14 15 16 17 18   9 10 11 12 13 14 15  13 14 15 16 17 18 19
# 19 20 21 22 23 24 25  16 17 18 19 20 21 22  20 21 22 23 24 25 26
# 26 27 28 29 30 31     23 24 25 26 27 28 29  27 28 29 30
#                       30 31
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#              1  2  3   1  2  3  4  5  6  7         1  2  3  4  5
#  4  5  6  7  8  9 10   8  9 10 11 12 13 14   6  7  8  9 10 11 12
# 11 12 13 14 15 16 17  15 16 17 18 19 20 21  13 14 15 16 17 18 19
# 18 19 20 21 22 23 24  22 23 24 25 26 27 28  20 21 22 23 24 25 26
# 25 26 27 28 29 30 31  29 30                 27 28 29 30 31


# EOS
#     assert_equal expected, result
#   end
end