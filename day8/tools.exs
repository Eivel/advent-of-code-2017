defmodule Tools do
  def parse_regex([_, source_reg, transform, value, cond_reg, operator, condition], map) do
    cond do
      condition_true?(cond_reg, operator, condition, map) ->
        if Map.has_key?(map, source_reg) do
          Map.put(map, source_reg, process_reg(map[source_reg], transform, value))
        else
          Map.put(map, source_reg, process_reg(0, transform, value))
        end
      true -> map
    end
  end

  def parse_to_int(el) do
    { val, _ } = Integer.parse(el)
    val
  end

  def process_reg(source_val, transform, value) do
    cond do
      transform == "inc" -> source_val + parse_to_int(value)
      true -> source_val - parse_to_int(value)
    end
  end

  def condition_true?(key, operator, condition, map) do
    cond do
      Map.has_key?(map, key) ->
        { result, _ } = Code.eval_string("#{map[key]} #{operator} #{condition}")
        result
      true ->
        { result, _ } = Code.eval_string("0 #{operator} #{condition}")
        result
    end
  end

  def find_max(map, list, max \\ 0)
  def find_max(map, [head | tail], max) do
    cond do
      map[head] > max -> find_max(map, tail, map[head])
      true -> find_max(map, tail, max)
    end
  end

  def find_max(_, [], max) do
    max
  end
end
