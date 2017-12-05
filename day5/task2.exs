defmodule Task2List do
  def run() do
    File.stream!("task_input")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&parse_to_int/1)
    |> step()
    |> IO.puts
  end

  def step(list, position \\0,  steps \\ 0) do
    cond do
      position >= length(list) || position < 0 -> steps
      true ->
        val = Enum.at(list, position)
        new_position = position + val
        new_steps = steps + 1
        new_list = List.update_at(list, position, &process_offset/1)
        step(new_list, new_position, new_steps)
    end
  end

  def parse_to_int(el) do
    { val, _ } = Integer.parse(el)
    val
  end

  def process_offset(offset) do
    cond do
      offset >= 3 -> offset - 1
      true -> offset + 1
    end
  end
end

defmodule Task2Map do
  def run() do
    File.stream!("task_input")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&parse_to_int/1)
    |> parse_to_map()
    |> step()
    |> IO.puts
  end

  def step(map, position \\0,  steps \\ 0) do
    cond do
      position >= length(Map.keys(map)) || position < 0 -> steps
      true ->
        val = map[position]
        new_position = position + val
        new_steps = steps + 1
        new_map = Map.update!(map, position, &process_offset/1)
        step(new_map, new_position, new_steps)
    end
  end

  def parse_to_int(el) do
    { val, _ } = Integer.parse(el)
    val
  end

  def process_offset(offset) do
    cond do
      offset >= 3 -> offset - 1
      true -> offset + 1
    end
  end

  def parse_to_map(list) do
    0..length(list)-1 |> Stream.zip(list) |> Enum.into(%{})
  end
end

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

IO.puts "Measuring time for List processing..."
IO.puts Benchmark.measure(fn -> Task2List.run() end)

IO.puts "Measuring time for Map processing..."
IO.puts Benchmark.measure(fn -> Task2Map.run() end)

