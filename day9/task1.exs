defmodule Task1 do
  def run(filename \\ "task_input") do
    { _, line } = File.read(filename)
    line
    |> String.trim()
    |> String.graphemes()
    |> process_input()
    |> IO.puts
  end

  defp process_input(list, ignore \\ false, garbage \\ false, level \\ 0, score \\ 0)
  defp process_input([_ | tail], true, garbage, level, score) do
    process_input(tail, false, garbage, level, score)
  end

  defp process_input(["!" | tail], _, garbage, level, score) do
    process_input(tail, true, garbage, level, score)
  end

  defp process_input(["<" | tail], ignore, true, level, score) do
    process_input(tail, ignore, true, level, score)
  end

  defp process_input(["<" | tail], ignore, false, level, score) do
    process_input(tail, ignore, true, level, score)
  end

  defp process_input([">" | tail], ignore, true, level, score) do
    process_input(tail, ignore, false, level, score)
  end

  defp process_input(["{" | tail], ignore, true, level, score) do
    process_input(tail, ignore, true, level, score)
  end

  defp process_input(["{" | tail], ignore, false, level, score) do
    process_input(tail, ignore, false, level + 1, score)
  end

  defp process_input(["}" | tail], ignore, true, level, score) do
    process_input(tail, ignore, true, level, score)
  end

  defp process_input(["}" | tail], ignore, false, level, score) do
    process_input(tail, ignore, false, level - 1, score + level)
  end

  defp process_input([_ | tail], ignore, garbage, level, score) do
    process_input(tail, ignore, garbage, level, score)
  end

  defp process_input([], _, _, _, score) do
    score
  end
end

Task1.run()
