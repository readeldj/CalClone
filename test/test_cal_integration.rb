require_relative 'helper'

class TestCalIntegration < Minitest::Test

  def test_no_arguments_help_message
  	output = `./cal.rb`
  	expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_month_that_starts_on_Sunday
  	output = `./cal.rb 01 2012`
  	expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, output
  end

  def test_regular_leap_year
    output = `./cal.rb 02 2012`
  	expected = <<EOS
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29

EOS
    assert_equal expected, output
  end

  def test_century_leap_year
    skip
    output = `./cal.rb 02 2009`
  	expected = <<EOS
   February 2009
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28



EOS
    assert_equal expected, output
  end

  def test_400_year_leap_year
    output = `./cal.rb 02 2000`
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    assert_equal expected, output
  end

  def test_January_2015
    output = `./cal.rb 01 2015`
    expected = <<EOS
    January 2015
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_March_2015
    output = `./cal.rb 03 2015`
    expected = <<EOS
     March 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, output
  end

  def test_April_2015
    output = `./cal.rb 04 2015`
    expected = <<EOS
     April 2015
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_May_2015
    output = `./cal.rb 05 2015`
    expected = <<EOS
      May 2015
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31

EOS
    assert_equal expected, output
  end

  def test_June_2015
    output = `./cal.rb 06 2015`
    expected = <<EOS
     June 2015
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30

EOS
    assert_equal expected, output
  end

  def test_July_2015
    output = `./cal.rb 07 2015`
    expected = <<EOS
     July 2015
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_August_2015
    output = `./cal.rb 08 2015`
    expected = <<EOS
    August 2015
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

EOS
    assert_equal expected, output
  end

  def test_September_2015
    output = `./cal.rb 09 2015`
    expected = <<EOS
   September 2015
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_October_2015
    output = `./cal.rb 10 2015`
    expected = <<EOS
    October 2015
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_November_2015
    output = `./cal.rb 11 2015`
    expected = <<EOS
   November 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
    assert_equal expected, output
  end

  def test_December_2015
    output = `./cal.rb 12 2015`
    expected = <<EOS
   December 2015
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_date_1800_is_the_first_allowable
    output = `./cal.rb 01 1800`
    expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_date_3000_is_the_last_allowable
    output = `./cal.rb 12 3000`
    expected = <<EOS
   December 3000
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_date_1799_is_below_the_first_allowable
    output = `./cal.rb 12 1799`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_date_3001_is_above_the_last_allowable
    output = `./cal.rb 01 3001`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_date_3001_is_above_the_last_allowable
    output = `./cal.rb 01 3001`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_month_entered_as_word_not_allowable
    output = `./cal.rb April 2015`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_month_year_entered_backwards_not_allowable
    output = `./cal.rb 2015 04`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end
end