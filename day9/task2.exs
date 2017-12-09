defmodule Task2 do
  def run(filename \\ "task_input") do
    { _, line } = File.read(filename)
    line
    |> String.trim()
    |> String.graphemes()
    |> process_input()
    |> IO.puts
  end

  defp process_input(list, ignore \\ false, garbage \\ false, level \\ 0, score \\ 0, garbage_collected \\ 0)
  defp process_input([_ | tail], true, garbage, level, score, garbage_collected) do
    process_input(tail, false, garbage, level, score, garbage_collected)
  end

  defp process_input(["!" | tail], _, garbage, level, score, garbage_collected) do
    process_input(tail, true, garbage, level, score, garbage_collected)
  end

  defp process_input(["<" | tail], ignore, true, level, score, garbage_collected) do
    process_input(tail, ignore, true, level, score, garbage_collected + 1)
  end

  defp process_input(["<" | tail], ignore, false, level, score, garbage_collected) do
    process_input(tail, ignore, true, level, score, garbage_collected)
  end

  defp process_input([">" | tail], ignore, true, level, score, garbage_collected) do
    process_input(tail, ignore, false, level, score, garbage_collected)
  end

  defp process_input(["{" | tail], ignore, true, level, score, garbage_collected) do
    process_input(tail, ignore, true, level, score, garbage_collected + 1)
  end

  defp process_input(["{" | tail], ignore, false, level, score, garbage_collected) do
    process_input(tail, ignore, false, level + 1, score, garbage_collected)
  end

  defp process_input(["}" | tail], ignore, true, level, score, garbage_collected) do
    process_input(tail, ignore, true, level, score, garbage_collected + 1)
  end

  defp process_input(["}" | tail], ignore, false, level, score, garbage_collected) do
    process_input(tail, ignore, false, level - 1, score + level, garbage_collected)
  end

  defp process_input([_ | tail], ignore, true, level, score, garbage_collected) do
    process_input(tail, ignore, true, level, score, garbage_collected + 1)
  end

  defp process_input([_ | tail], ignore, false, level, score, garbage_collected) do
    process_input(tail, ignore, false, level, score, garbage_collected)
  end

  defp process_input([], _, _, _, _, garbage_collected) do
    garbage_collected
  end
end

Task2.run()
