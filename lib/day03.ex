defmodule Day03 do
  @moduledoc false


  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.chunk_every(1)

  end

  @doc """
    Convert the item to its priority.
    Items a-z have priority 1-26
    Items A-Z have priority 27-52
  """
    def to_priority(string) when is_binary(string) do
     is_upper = String.upcase(string, :ascii) == string
     case is_upper do
         true -> :binary.first(string) - :binary.first("A") + 27
         false -> :binary.first(string) - :binary.first("a") +1
     end
  end


  @doc """
  Calculate the priority of the duplicated item
  """
  def item_priority(contentList) do
   contentString = contentList
     |> hd

   contents = String.split_at(contentString,round(String.length(contentString)/2))
    |> Tuple.to_list
    |> Enum.map(fn compartment -> String.graphemes(compartment) end)
    |> Enum.map(fn items -> MapSet.new(items) end)

    MapSet.intersection(hd(contents), hd(tl(contents)))
    |> MapSet.to_list()
    |> hd
    |> to_priority

 end

  def find_item_priorities(filename) do
    Day03.read_input(filename)
    |> Enum.map(fn rucksack -> item_priority(rucksack) end)
    |> Enum.sum()
  end


  ################ Part 2 stuff #################

  def find_badges(filename) do
    Day03.read_input(filename)
    |> Enum.chunk_every(3)

    |> Enum.map(fn elf -> item_priority_by_badge(elf) end)
    |> Enum.sum()
  end


  @doc """
  Calculate the priority of the duplicated item
  """
  def item_priority_by_badge(elfList) do
    # elfList is 3 rucksacks, we need to find the common item between all 3.
    thing = elfList
    |> Enum.map(fn rucksack -> String.graphemes(hd(rucksack)) end)
    |> Enum.map(fn items -> MapSet.new(items) end)

    thirdSet = hd(tl(tl(thing)))
    MapSet.intersection(hd(thing), hd(tl(thing)))
    |> MapSet.intersection(thirdSet)
    |> MapSet.to_list()
    |> hd
    |> to_priority

  end
end
