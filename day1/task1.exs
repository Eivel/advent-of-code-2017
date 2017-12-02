defmodule Task1 do
  def initialize([head | tail]) do
    sum_conditionally([head | tail], head)
  end

  def sum_conditionally([ head1 | [ head1 | tail ]], first) do
    { parsed, "" } = Integer.parse(head1)
    parsed + sum_conditionally([ head1 | tail ], first)
  end

  def sum_conditionally([ _ | [ head2 | tail]], first) do
    sum_conditionally([ head2 | tail ], first)
  end

  def sum_conditionally([ first ], first) do
  { parsed, "" } = Integer.parse(first)
    parsed
  end

  def sum_conditionally([ _ ], _) do
    0
  end
end
input = "91212129"
input_array = String.graphemes(input)
IO.puts Task1.initialize(input_array)
