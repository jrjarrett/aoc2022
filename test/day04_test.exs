defmodule Day04Test do
  use ExUnit.Case

  alias Day04

  @moduletag :capture_log

  doctest Day04

  test "read_input works" do
    IO.inspect(
      Day04.read_input("priv/day-04.txt")
    )
  end

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
           |> Day04.day04_part1
    )
  end

  #### Part 2 stuff ####
  test "range does not overlap" do
    assert Day04.range_overlaps([%{x: 2, y: 4}, %{x: 6, y: 8}]) == false
  end

  test "range overlaps 1" do
    assert Day04.range_contains([%{x: 5, y: 7}, %{x: 7, y: 9}]) == true
  end

  test "range overlaps all" do
    assert Day04.range_contains([%{x: 2, y: 8}, %{x: 3, y: 7}]) == true
  end
  test "range overlaps once" do
    assert Day04.range_contains([%{x: 6, y: 6}, %{x: 4, y: 6}]) == true
  end

end
