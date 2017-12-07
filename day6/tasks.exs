defmodule Tasks do
  def run(task \\ 1) do
    { _, line } = File.read("task_input")
    line
    |> String.trim()
    |> String.split(" ")
    |> Enum.map(&parse_to_int(&1))
    |> redistribute(task)
    |> IO.puts
  end

  defp redistribute(list, task, remembered \\ []) do
    { max, index } = max_with_index(list)
    new_list = List.update_at(list, index, fn (_) -> 0 end)
    new_list = balance(new_list, rem(index + 1, length(list)), max)
    cond do
      Enum.member?(remembered, new_list) -> choose_output(task, remembered, new_list)
      remembered == [] -> redistribute(new_list, task, [list] ++ [new_list])
      true ->
        redistribute(new_list, task, remembered ++ [new_list])
    end
  end

  defp choose_output(1, remembered, _) do
    length(remembered)
  end

  defp choose_output(2, remembered, list) do
    length(remembered) - get_elem_index(remembered, list)
  end

  defp balance(list, index, blocks) do
    cond do
      blocks == 0 -> list
      true ->
        new_list = List.update_at(list, index, &(&1 + 1))
        balance(new_list, rem(index + 1, length(list)), blocks - 1)
    end
  end

  defp max_with_index(list, max \\ 0, scanned \\ 0, index \\ 0)

  defp max_with_index([head | tail], max, scanned, index ) do
    cond do
      head > max -> max_with_index(tail, head, scanned + 1, scanned)
      true -> max_with_index(tail, max, scanned + 1, index)
    end
  end

  defp max_with_index([], max, _, index ) do
    { max, index }
  end

  defp parse_to_int(el) do
    { val, _ } = Integer.parse(el)
    val
  end

  defp get_elem_index(list, elem, index \\ 0)

  defp get_elem_index([head | tail], elem, index) do
    cond do
      head == elem -> index
      true -> get_elem_index(tail, elem, index + 1)
    end
  end
  defp get_elem_index([], _, _) do
    -1
  end
end

Tasks.run(1)
