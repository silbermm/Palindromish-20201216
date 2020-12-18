defmodule Palindromish do
  @input File.stream!("./words.txt")

  def run() do
    word = find_word(@input)
    IO.puts("Word is #{inspect word}")
  end

  defp find_word(stream) do
    stream
    |> Stream.map(&String.trim/1) 
    |> Stream.map(&String.graphemes/1)
    |> Stream.filter(&is_palindromish?/1)
    |> Stream.map(&Enum.join/1)
    |> Enum.take(1)
  end

  defp is_palindromish?(string_list) when length(string_list) == 9 do
    middle = Enum.slice(string_list, 3, 3)
    first = Enum.slice(string_list, 0, 3)
    last = Enum.slice(string_list, 6, 3)
    matches_criteria?(first, middle, last)  
  end
  defp is_palindromish?(_string_list), do: false

  defp matches_criteria?(first, middle, last) when middle == ["e", "l", "i"] do
    first == Enum.reverse(last)
  end
  defp matches_criteria?(_first, _middle, _last), do: false
end
