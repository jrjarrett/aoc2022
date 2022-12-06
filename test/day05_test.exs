defmodule Day05Test do
  use ExUnit.Case

  alias Day05

  @moduletag :capture_log

  doctest Day05

  test "parse input works" do
    IO.inspect(Day05.parse_input(File.read!("priv/day-05.txt")))
  end

  test "foo" do
    plan = Day05.parse_input(File.read!("priv/day-05.txt"))
    IO.inspect()
  end
end
