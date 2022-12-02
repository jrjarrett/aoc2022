defmodule Day01Test do
  use ExUnit.Case

  alias Day01

  @moduletag :capture_log

  doctest Day01

  test "module exists" do
    assert is_list(Day01.module_info())
  end

  test "what does read_food do" do
    IO.inspect(Day01.read_food("priv/input-day1.txt"))
    assert Day01.read_food("priv/input-day1.txt") != nil
  end

  test "foo" do
    food_list = Day01.read_food("priv/input-day1.txt")
    |> Enum.chunk_by(fn x -> x != "" end)
    |> Enum.reject(fn  x -> x == [""] end)

    IO.inspect(food_list)

    IO.inspect(length(food_list))

    elfFood = food_list
    |> Enum.zip(0..length(food_list))
    |> Map.new
    |> Enum.map(fn {k,v} -> Map.new() |> Map.put(:Elf, v) |> Map.put(:calories, Day01.convert_list_of_cals_to_total_cals(k)) end)
    |> Enum.sort_by(&Map.fetch(&1, :Elf))

    Enum.map(elfFood, fn x -> IO.inspect(x) end)
  end
#  Real tests start here.
  test "convert_list_of_cals_to_total_cals works" do
    assert Day01.convert_list_of_cals_to_total_cals(["1000", "2000", "3000"]) == 6000
  end

  test "day 1 test" do
    result = Day01.calories_for_elves("priv/input-day1.txt")
    |> Day01.elf_with_the_most_calories
    assert Map.get(result, :calories) == 24000
  end

  test "day 1 part 1" do
    result = Day01.calories_for_elves("priv/input-day1.txt")
    IO.inspect(result)
  end

  test "day 1 part 2 test" do
    result = Day01.calories_for_elves("priv/day-01.txt")
    |> Day01.top_three_elves_with_the_most_calories

   assert result == 45000

  end

  test "day 1 part 2" do
    result = Day01.calories_for_elves("priv/input-day1.txt")
             |> Day01.top_three_elves_with_the_most_calories

    IO.inspect(result)

  end


end
