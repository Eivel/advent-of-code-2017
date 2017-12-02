File.stream!("task_input")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.split(&1, "	"))
|> Stream.map(&Enum.map(&1, fn (ch) -> Integer.parse(ch) end))
|> Stream.map(&Enum.map(&1, fn ({int, _}) -> int end))
|> Stream.map(&(Enum.max(&1) - Enum.min(&1)))
|> Enum.sum
|> IO.puts
