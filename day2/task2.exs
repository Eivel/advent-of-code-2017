defmodule Task2 do
  def run(filename) do
    process_file(filename)
  end

  defp process_file(filename) do
    File.stream!(filename)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, "	"))
    |> Stream.map(&Enum.map(&1, fn (ch) -> Integer.parse(ch) end))
    |> Stream.map(&Enum.map(&1, fn ({int, _}) -> int end))
    |> Stream.map(fn (line) -> parse_list(line) end)
    |> Enum.sum
    |> IO.puts
  end

  defp parse_list([head | tail]) do
    compare(head, tail, tail)
  end

  defp compare(val, [head | tail], copy) do
    cond do
      val == head -> 1
      val > head && rem(val, head) == 0 -> div(val, head)
      val < head && rem(head, val) == 0 -> div(head, val)
      true -> compare(val, tail, copy)
    end
  end

  defp compare(_, [], [head | tail]) do
    compare(head, tail, tail)
  end

  defp compare(_, [], []) do
    0
  end
end

Task2.run("task_input")
