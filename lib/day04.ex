defmodule Day04 do
  @moduledoc false


  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x,",") end)
    |> Enum.reject(fn  x -> x == [""] end)
  end

  def create_tuple(list) do
    list
    |> Enum.map(fn x -> String.split(x,"-")  end)
    |> Enum.map(fn pair -> %{x: String.to_integer(hd(pair)), y: String.to_integer(hd(tl(pair)))} end)
  end

  def range_contains(listItem) do
    [head | tail] = listItem
    (Map.get(head,:x) <= Map.get(hd(tail),:x) && Map.get(head,:y) >= Map.get(hd(tail),:y))
    ||
    (Map.get(hd(tail),:x) <= Map.get(head,:x) && Map.get(hd(tail),:y) >= Map.get(head,:y))
  end

  def range_overlaps(listItem) do
    [head | tail] = listItem
    ( (Map.get(head,:x) <= Map.get(hd(tail),:x) && Map.get(hd(tail),:x) <= Map.get(head,:y)) || (Map.get(head,:x) <= Map.get(hd(tail),:y) && Map.get(hd(tail),:y) <= Map.get(head,:y)) )
    || ( (Map.get(hd(tail),:x) <= Map.get(head,:x) && Map.get(head,:x) <= Map.get(hd(tail),:y)) || (Map.get(hd(tail),:x) <= Map.get(head,:y) && Map.get(head,:y) <= Map.get(hd(tail),:y)) )
  end


  def day04_part1(list) do
    list
    |> Enum.map(fn x -> Day04.create_tuple(x) end)
    |> Enum.map(fn x -> Day04.range_contains(x) end)
    |> Enum.reject(fn x -> x == false end)
    |> Enum.count
  end

  def day04_part2(list) do
    list
    |> Enum.map(fn x -> Day04.create_tuple(x) end)
    |> Enum.map(fn x -> Day04.range_overlaps(x) end)
    |> Enum.reject(fn x -> x == false end)
    |> Enum.count
  end

  def day04_part2a(list) do
    list
    |> Enum.map(fn x -> Day04.create_tuple(x) end)
    |> Enum.map(fn x -> Day04.range_overlaps(x) end)
    |> Enum.zip(list)
  end
end
