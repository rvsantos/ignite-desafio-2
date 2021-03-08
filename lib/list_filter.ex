defmodule ListFilter do
  require Integer

  def call(list) do
    list
    |> convert_to_integer
    |> Enum.filter(fn x -> Integer.is_odd(x) end)
    |> Enum.count()
  end

  defp convert_to_integer(strings) do
    Enum.flat_map(strings, fn string ->
      case Integer.parse(string) do
        # transform to integer
        {int, _rest} -> [int]
        # skip the value
        :error -> []
      end
    end)
  end
end
