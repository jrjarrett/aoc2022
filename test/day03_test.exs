defmodule Day03Test do
  use ExUnit.Case

  alias Day03

  @moduletag :capture_log

  doctest Day03


  test "to_ascii works" do
    assert Day03.to_priority("A") == 27
    assert Day03.to_priority("p") == 16
    assert Day03.to_priority("Z") == 52
  end

  test "read" do
    IO.inspect(Day03.read_input("priv/day-03.txt"))
  end

  test "Day 03 part 1 test" do
    assert Day03.find_item_priorities("priv/day-03.txt") == 157
  end

  test "Day 03 part 1" do
    IO.inspect(Day03.find_item_priorities("priv/input-day3.txt"))
  end

 test "Day03 part 2 test" do
   assert Day03.find_badges("priv/day-03.txt") == 70
  end

  test "Day 03 part21" do
    IO.inspect(Day03.find_badges("priv/input-day3.txt"))
  end

end
