defmodule Task1 do
  def run(filename \\ "task_input") do
    File.stream!(filename)
    |> Enum.map(&String.trim/1)
    |> (fn (input) -> process_input(%{}, input) end).()
    |> (fn (map) -> Tools.find_max(map, Map.keys(map)) end).()
    |> IO.puts
  end

  defp process_input(map, [head | tail]) do
    ~r/^([a-z]+)\s(inc|dec)\s(-?[0-9]+)\sif\s([a-z]+)\s([<>=!]+)\s(-?[0-9]+)$/
    |> Regex.run(head)
    |> Tools.parse_regex(map)
    |> process_input(tail)
  end

  defp process_input(map, []) do
    map
  end
end

