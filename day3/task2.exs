require Logger

defmodule Task2 do
  def run(target, map \\ %{}, value \\ 1, { x, y, d, m } \\ { 0, 0, 1, 1 }) do
    map = Map.put(map, { x, y }, value)
    follow(target, map, { x, y, d, m })
  end
  def follow(target, map, { x, y, d, m } \\ { 0, 0, 1, 1 }) do
    cond do
      target < map[{ x, y }] -> IO.puts map[{ x, y }]
      2 * x * d < m -> run(target, map, calculate_value(map, { x + d, y }), { x + d, y, d, m })
      2 * y * d < m -> run(target, map, calculate_value(map, { x, y + d }), { x, y + d, d, m })
      true -> follow(target, map, { x, y, -1 * d, m + 1 })
    end
  end

  def calculate_value(map, { x, y }) do
    0
    |> fetch_val(map, { x - 1, y - 1 })
    |> fetch_val(map, { x, y - 1 })
    |> fetch_val(map, { x, y + 1 })
    |> fetch_val(map, { x + 1, y})
    |> fetch_val(map, { x - 1, y})
    |> fetch_val(map, { x + 1, y - 1})
    |> fetch_val(map, { x - 1, y + 1})
    |> fetch_val(map, { x + 1, y + 1})
  end

  def fetch_val(val, map, key) do
    cond do
      not Map.has_key?(map, key) -> val
      true -> map[key] + val
    end
  end
end

Task2.run(347991)
