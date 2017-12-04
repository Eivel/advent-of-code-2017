File.stream!("task_input")
|> Enum.map(&String.trim/1)
|> Enum.map(&String.split(&1, " "))
|> Enum.filter(&Enum.uniq(&1) == &1)
|> length()
|> IO.puts
