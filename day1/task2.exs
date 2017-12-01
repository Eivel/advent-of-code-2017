defmodule Task2 do
  def sum_conditionally(input, range, index, accumulator) do
    length = String.length(input)
    cond do
      length == index -> accumulator
      length > index ->
        m = String.to_integer(String.at(input, index))
        n = String.to_integer(String.at(input, rem(index + range, length)))
        sum_conditionally(input, range, index + 1, sum_if_equal(m, n, accumulator))
    end
  end

  def sum_if_equal(m, m, accumulator) do
    accumulator + m
  end

  def sum_if_equal(_, _, accumulator) do
    accumulator
  end
end
input = "paste input here"
range = round(String.length(input) / 2)
IO.puts Task2.sum_conditionally(input, range, 0, 0)
