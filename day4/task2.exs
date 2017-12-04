defmodule Task2 do
  def sort_string(word) do
    String.graphemes(word)
    |> Enum.sort()
    |> Enum.join("")
  end
end

File.stream!("task_input")
|> Enum.map(&String.trim/1)
|> Enum.map(&String.split(&1, " "))
|> Enum.map(&Enum.map(&1, fn (word) -> Task2.sort_string(word) end))
|> Enum.filter(&Enum.uniq(&1) == &1)
|> length()
|> IO.puts
