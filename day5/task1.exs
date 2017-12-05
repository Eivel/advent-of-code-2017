defmodule Task1 do
  def step(list, position \\0,  steps \\ 0) do
    cond do
      position >= length(list) || position < 0 -> steps
      true ->
        val = Enum.at(list, position)
        new_position = position + val
        new_steps = steps + 1
        new_list = List.update_at(list, position, &(&1 + 1))
        step(new_list, new_position, new_steps)
    end
  end

  def parse_to_int(el) do
    { val, _ } = Integer.parse(el)
    val
  end
end

File.stream!("task_input")
|> Enum.map(&String.trim/1)
|> Enum.map(&Task1.parse_to_int/1)
|> Task1.step()
|> IO.puts
