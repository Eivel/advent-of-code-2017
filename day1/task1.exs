defmodule Task1 do
  def initialize([head | tail], accumulator) do
    sum_conditionally([head | tail], accumulator, head)
  end

  def sum_conditionally([ head1 | [ head1 | tail ]], accumulator, first) do
    { parsed, "" } = Integer.parse(head1)
    sum_conditionally([ head1 | tail ], accumulator + parsed, first)
  end

  def sum_conditionally([ _ | [ head2 | tail]], accumulator, first) do
    sum_conditionally([ head2 | tail ], accumulator, first)
  end

  def sum_conditionally([ first ], accumulator, first) do
  { parsed, "" } = Integer.parse(first)
    accumulator + parsed
  end

  def sum_conditionally([ _ ], accumulator, _) do
    accumulator
  end
end
input = "paste input here"
input_array = String.graphemes(input)
IO.puts Task1.initialize(input_array, 0)
