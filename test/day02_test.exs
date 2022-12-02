defmodule Day02Test do
  use ExUnit.Case

  alias Day02

  @moduletag :capture_log

  doctest Day02

  test "read guide works as expected" do
    assert Day02.read_guide("priv/day-02.txt") == [["A", "Y"], ["B", "X"], ["C", "Z"]]
  end

  test "rps maps things correctly" do
    assert Day02.rps("A") == :rock
    assert Day02.rps("B") == :paper
    assert Day02.rps("C") == :scissors
    assert Day02.rps("X") == :rock
    assert Day02.rps("Y") == :paper
    assert Day02.rps("Z") == :scissors
    assert Day02.rps("4") == :error
  end

  test "convert to rps works correctly" do
    expected = [[:rock, :paper], [:paper, :rock], [:scissors, :scissors]]
    assert Day02.normalize_game("priv/day-02.txt") == expected
  end


  test "score game works" do
    assert Day02.score_game([:rock, :paper]) == 8
    assert Day02.score_game([:paper, :rock]) == 1
    assert Day02.score_game([:scissors, :scissors]) == 6
  end

  test "foo" do
    IO.inspect( Day02.normalize_game("priv/day-02.txt")
                |> Enum.map(fn x -> Day02.score_game(x) end)
                |> Enum.reduce(fn x, acc -> x + acc end)

    )
  end

  test "day02 test" do
   assert Day02.normalize_game("priv/day-02.txt")
    |> Enum.map(fn x -> Day02.score_game(x) end)
    |> Enum.reduce(fn x, acc -> x + acc end)
          == 15
  end

  test "day02 part 1" do
    IO.inspect(Day02.normalize_game("priv/input-day2.txt")
           |> Enum.map(fn x -> Day02.score_game(x) end)
           |> Enum.reduce(fn x, acc -> x + acc end)
    )
  end

# Part 2
  test "rps 2 maps things correctly" do
    assert Day02.rps_two("A") == :rock
    assert Day02.rps_two("B") == :paper
    assert Day02.rps_two("C") == :scissors
    assert Day02.rps_two("X") == :lose
    assert Day02.rps_two("Y") == :draw
    assert Day02.rps_two("Z") == :win
  end


  test "convert to rps_two works correctly" do
    expected = [[:rock, :draw], [:paper, :lose], [:scissors, :win]]
    assert Day02.normalize_game_two("priv/day-02.txt") == expected
  end

  test "score game 2 works" do
    assert Day02.score_game_two([:rock, :win]) == 8
    assert Day02.score_game_two([:paper, :lose]) == 1
    assert Day02.score_game_two([:scissors, :draw]) == 6

    assert Day02.score_game_two([:rock, :lose]) == 3 # scissors smashed by rock = 3
    assert Day02.score_game_two([:paper, :lose]) == 1 # rock is covered by paper = 1
    assert Day02.score_game_two([:scissors, :lose]) == 2 # paper is cut by scissors = 2

    assert Day02.score_game_two([:rock, :win]) == 8 # paper covers rock 2 + 6 = 8
    assert Day02.score_game_two([:paper, :win]) == 9 # scissors cuts paper 3 + 6 = 9
    assert Day02.score_game_two([:scissors, :win]) == 7 # rock smashes scissors 1 + 6 = 7

    assert Day02.score_game_two([:rock, :draw]) == 4 # rock-rock = 1 + 3 = 4
    assert Day02.score_game_two([:paper, :draw]) == 5 # paper-paper 2 + 3 = 5
    assert Day02.score_game_two([:scissors, :draw]) == 6 # scissors-scissors = 6
  end

  test "day02 part 2" do
    IO.inspect(Day02.normalize_game_two("priv/input-day2.txt")
               |> Enum.map(fn x -> Day02.score_game_two(x) end)
               |> Enum.reduce(fn x, acc -> x + acc end)
    )
  end

end
