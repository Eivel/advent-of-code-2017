defmodule Task2 do
  def run(filename \\ "task_input") do
    File.stream!(filename)
    |> Enum.map(&String.trim/1)
    |> (fn (input) -> process_input(%{}, input) end).()
    |> IO.puts
  end

  defp process_input(map, list, global_max \\ 0)
  defp process_input(map, [head | tail], global_max) do
    ~r/^([a-z]+)\s(inc|dec)\s(-?[0-9]+)\sif\s([a-z]+)\s([<>=!]+)\s(-?[0-9]+)$/
    |> Regex.run(head)
    |> Tools.parse_regex(map)
    |> process_input(tail, update_global_max(map, global_max))
  end

  defp process_input(_, [], global_max) do
    global_max
  end

  def update_global_max(map, global_max) do
    current = Tools.find_max(map, Map.keys(map))
    cond do
      current > global_max -> current
      true -> global_max
    end
  end
end

