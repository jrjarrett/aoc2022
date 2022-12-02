defmodule Day02 do
  @moduledoc false

  @external_resource "priv/day-02.txt"

  def rps(move) do
     case move do
       "A" -> :rock
       "X" -> :rock
       "B" -> :paper
       "Y" -> :paper
       "C" -> :scissors
       "Z" -> :scissors
       _ -> :error
     end
  end

  def rps_two(move) do
    case move do
      "A" -> :rock
      "X" -> :lose
      "B" -> :paper
      "Y" -> :draw
      "C" -> :scissors
      "Z" -> :win
      _ -> :error
    end
  end


  def read_guide(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.chunk_every(1)
    |> Enum.reject(fn  x -> x == [""] end)
    |> Enum.map(fn x -> String.split(List.first(x)," ", trim: true) end)
  end

  def convert_to_rps(listOfMoves) do
    listOfMoves
    |> Enum.map( fn move -> rps(move) end)
  end

  def normalize_game(strategy_guide_filename) do
    read_guide(strategy_guide_filename)
    |> Enum.map(fn x -> convert_to_rps(x) end)
  end

  def score_game(game) do
    [opponent | you] = game
    you = List.first(you)
    # Points
    case you do
      you when you == :rock ->
        points = 1
        case opponent do
          opponent when opponent == :rock ->
            points + 3
          opponent when opponent == :scissors ->
            points + 6
          opponent when opponent == :paper ->
            points + 0
        end
      you when you == :paper ->
        points = 2
        case opponent do
          opponent when opponent == :paper ->
            points + 3
          opponent when opponent == :rock ->
            points + 6
          opponent when opponent == :scissors ->
            points + 0
        end
      you when you == :scissors ->
        points = 3
        case opponent do
          opponent when opponent == :scissors ->
            points + 3
          opponent when opponent == :paper ->
            points + 6
          opponent when opponent == :rock ->
            points + 0
        end
    end
  end

 # Part 2
  def convert_to_rps_two(listOfMoves) do
    listOfMoves
    |> Enum.map( fn move -> rps_two(move) end)
  end

  def normalize_game_two(strategy_guide_filename) do
    read_guide(strategy_guide_filename)
    |> Enum.map(fn x -> convert_to_rps_two(x) end)
  end

  def score_game_two(game) do
    [opponent | you] = game
    you = List.first(you)
    # Points
    points = 0
    case opponent do
      opponent when opponent == :rock ->
         case you do
           you when you == :win ->
           # play paper 2 + 6
              points + 8
           you when you == :draw ->
           # play rock 1 + 3
              points + 4
           you when you == :lose ->
              # play scissors 3 + 0
              points + 3
         end
     opponent when opponent == :paper ->
       case you do
         you when you == :win ->
           # play scissors 3 + 6
           points + 9
         you when you == :draw ->
           # play paper 3 + 3
           points + 5
         you when you == :lose ->
           # play rock 1 + 0
           points + 1
       end
     opponent when opponent == :scissors ->
       case you do
         you when you == :win ->
           # play rock 1 + 6
           points + 7
         you when you == :draw ->
           # play scissors 3 + 3
           points + 6
         you when you == :lose ->
           # play paper 2 + 0
           points + 2
       end

    end

  end

 end
