defmodule Task1 do
  @moduledoc """
  Density: maximum vertical or horizontal distance of all values in current level (minus 1)
  Pointer: vertical or horizontal distance of a value from the middle
  Limiter: the last number of a density (the last number in a level)
  """

  def calculate_path(n) do
    { density, pointer } = calculate_density(n)
    IO.puts density + pointer - 1
  end
  def calculate_density(n, base \\ 8, limiter \\ 1, density \\ 2) do
    new_limiter = limiter + base
    cond do
      new_limiter >= n -> { density, calculate_pointer(n, limiter, density) }
      true -> calculate_density(n, base + 8, new_limiter, density + 1)
    end
  end

  def calculate_pointer(n, limiter, density) do
    pointers = Stream.cycle(calculate_pointers_list(density))
    index = n - limiter
    Enum.at(pointers, index)
  end

  def calculate_pointers_list(density) do
    cond do
      density > 2 -> Enum.concat((density - 1)..0, 1..(density - 2))
      true -> (1..0)
    end
  end
end

Task1.calculate_path(347991)
