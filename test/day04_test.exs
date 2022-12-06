defmodule Day04Test do
  use ExUnit.Case

  alias Day04

  @moduletag :capture_log

  doctest Day04


 test "find_distance" do
    assert Day04.range_contains([%{x: 2, y: 4}, %{x: 6, y: 8}]) == false
 end

  test "find_distance for no overlap" do
    assert Day04.range_contains([%{x: 5, y: 7}, %{x: 7, y: 9}]) == false
  end
  test "find_distance for an overlap" do
    assert Day04.range_contains([%{x: 2, y: 8}, %{x: 3, y: 7}]) == true
  end
  test "find_distance for an one bin" do
    assert Day04.range_contains([%{x: 6, y: 6}, %{x: 4, y: 6}]) == true
  end

  test "day 04 test works" do
      assert Day04.read_input("priv/day-04.txt") |> Day04.day04_part1 == 2
  end

  test "day 04 part 1" do
    IO.inspect( Day04.read_input("priv/input-day4.txt")
           |> Day04.day04_part1,
     label: "Day 4 part 1 answer")
  end

  #### Part 2 stuff ####
  test "range 1 does not overlap" do
    assert Day04.range_overlaps([%{x: 2, y: 4}, %{x: 6, y: 8}]) == false
  end

  test "range 2 does not overlap" do
    assert Day04.range_overlaps([%{x: 2, y: 3}, %{x: 4, y: 5}]) == false
  end


  test "range 3 overlaps" do
    assert Day04.range_overlaps([%{x: 5, y: 7}, %{x: 7, y: 9}]) == true
  end

  test "range 4 overlapsl" do
    assert Day04.range_overlaps([%{x: 2, y: 8}, %{x: 3, y: 7}]) == true
  end
  test "range 5 overlaps" do
    assert Day04.range_overlaps([%{x: 6, y: 6}, %{x: 4, y: 6}]) == true
  end

  test "range 6 overlaps" do
    assert Day04.range_overlaps([%{x: 2, y: 6}, %{x: 4, y: 8}]) == true
  end


  test "range  overlaps" do
    assert Day04.range_overlaps([%{x: 46, y: 99}, %{x: 19, y: 95}]) == true
  end


  test "range should overlaps" do
    assert Day04.range_overlaps([%{x: 7, y: 9}, %{x: 5, y: 7}]) == true
  end


  test "range should NOT overlaps" do
    assert Day04.range_overlaps([%{x: 11, y: 97}, %{x: 99, y: 99}]) == false
  end



  test "day 04 part 2 test" do
    assert Day04.read_input("priv/day-04.txt") |> Day04.day04_part2 == 4
  end


  test "day 04 part 2" do
    IO.inspect( Day04.read_input("priv/input-day4.txt")
                |> Day04.day04_part2,
     label: "Day04 part 2 answer")
  end
end
