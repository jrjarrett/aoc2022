defmodule Day01 do
  @moduledoc """
  Documentation for 2022 AOC day 1
  """

  @external_resource "priv/day-01.txt"

  def read_food(filename) do
    File.read!(filename)
    |> String.split("\n")
  end

  def convert_list_of_cals_to_total_cals(elfFoodList) do
    elfFoodList
    |> Enum.map(fn d -> String.to_integer(d) end)
    |> Enum.reduce(0, fn element, accumulator -> element + accumulator end)
  end

  def calories_for_elves(filename) do
    food_list = read_food(filename)
                |> Enum.chunk_by(fn x -> x != "" end)
                |> Enum.reject(fn  x -> x == [""] end)

    food_list
    |> Enum.zip(0..length(food_list))
    |> Map.new
    |> Enum.map(fn {k,v} -> Map.new() |> Map.put(:Elf, v) |> Map.put(:calories, Day01.convert_list_of_cals_to_total_cals(k)) end)
    |> Enum.sort_by(&Map.fetch(&1, :calories), :desc)

  end

  def elf_with_the_most_calories(elfList) do
    elfList
    |> List.first
  end

  def top_three_elves_with_the_most_calories(elfList) do
    elfList
    |> Enum.take(3)
    |> Enum.reduce(0, fn x, acc -> Map.get(x, :calories) + acc end)
  end
end
